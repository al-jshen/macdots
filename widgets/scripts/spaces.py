import subprocess
import re
import json


def get_module(module):
    ps = subprocess.Popen(['yabai', '-m', 'query', '--%s' % module], stdout=subprocess.PIPE).communicate()[0].decode().replace('\n', '').replace('\t', '').replace('[{', '').replace('}]', '').split('},{')
    result = {}
    for k, item in enumerate(ps):
        item = "{" + item + "}".replace("'", "\"")
        json_string = json.loads(item)
        result[k] = json_string
    return result


def get_apps(spaceid):
    ps = subprocess.Popen(['yabai', '-m', 'query', '--windows', '--space', str(spaceid)], stdout=subprocess.PIPE).communicate()[0].decode().replace('\n', '').replace('\t', '').replace('[{', '').replace('}]', '').split('},{')
    if ps == ['[]']:
        return ["None"]
    result = {}
    for k, item in enumerate(ps):
        item = "{" + item + "}".replace("'", "\"")
        json_string = json.loads(item)
        result[k] = json_string
    apps = set()
    for i in result.values():
        if i["app"] not in apps:
            apps.add(str(i["app"]))
    return sorted(list(apps))


def prettify(displays):
    results = {}

    for disp in displays.items():
        _, disp_dat = disp
        disp_id = str(disp_dat["index"])

        if disp_id not in results.keys():
            results[disp_id] = {}
        for space in disp_dat["spaces"]:
            results[disp_id][str(space)] = get_apps(space)

    spaces = get_module('spaces')
    visible = [i['index'] for i in spaces.values() if i['visible'] == 1]

    results['visible'] = visible
    
    return results


def main():
    return prettify(get_module('displays'))

if __name__ == '__main__':
    print(main())
