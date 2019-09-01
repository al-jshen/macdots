import subprocess
import re
import json


def get_displays():
    ps = subprocess.Popen(['yabai', '-m', 'query', '--displays'], stdout=subprocess.PIPE).communicate()[0].replace('\n', '').replace('\t', '').replace('[{', '').replace('}]', '').split('},{')
    result = {}
    for k, item in enumerate(ps):
        item = "{" + item + "}".replace("'", "\"")
        json_string = json.loads(item)
        result[k] = json_string
    return result

                                                                                                                                                                                            
def get_apps(spaceid):
    ps = subprocess.Popen(['yabai', '-m', 'query', '--windows', '--space', str(spaceid)], stdout=subprocess.PIPE).communicate()[0].replace('\n', '').replace('\t', '').replace('[{', '').replace('}]', '').split('},{')
    if ps == ['[]']:
        return [u'None']
    result = {}
    for k, item in enumerate(ps):
        item = "{" + item + "}".replace("'", "\"")
        json_string = json.loads(item)
        result[k] = json_string
    apps = set()
    for i in result.values():
        if i['app'] not in apps:
            apps.add(i['app'])
    return list(apps)


def prettify(displays):
    results = {}

    for disp in displays.items():
        _, disp_dat = disp
        disp_id = disp_dat['index']

        if disp_id not in results.keys():
            results[disp_id] = {}
        for space in disp_dat['spaces']:
            results[disp_id][space] = get_apps(space)
    return results


def main():
    return prettify(get_displays())

if __name__ == '__main__':
    print(main())
