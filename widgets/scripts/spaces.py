#!/usr/bin/env python

import subprocess
import re
import json


def get_yabai(module):
    ps = subprocess.Popen(['yabai', '-m', 'query', '--%s' % module], stdout=subprocess.PIPE).communicate()[0].replace('\n', '').replace('\t', '').replace('[{', '').replace('}]', '').split('},{')
    result = {}
    for k, item in enumerate(ps):
        item = "{" + item + "}".replace("'", "\"")
        json_string = json.loads(item)
        result[k] = json_string
    return result


def prettify_results(spaces, windows, displays):
    active_window = json.loads(subprocess.Popen(['yabai', '-m',  'query', '--windows', '--window'], stdout=subprocess.PIPE).communicate()[0].replace('\n', '').replace('\t', '').replace("'", "\""))
    result = {}
    for space in spaces:
        result[str(space)] = {}
        for window in windows:
            if windows[window]['id'] in spaces[space]['windows']:
                result[str(space)][str(windows[window]['id'])] = windows[window]['app']

    filtered = {}
    for outerkey, outerval in result.items():
        if outerkey not in filtered.keys():
            filtered[outerkey] = {}
        for innerkey, innerval in outerval.items():
            if innerval not in filtered[outerkey].values():
                filtered[outerkey][innerkey] = innerval

    active_space = filtered[str(active_window['space']-1)]
    for id, app in active_space.items():
        if app == active_window['app']:
            filtered['active'] = {id: app}

    if len(displays.keys()) > 1:
        display_splits = []
        for disp_id in displays.keys()[1:]:
            display_splits.append(displays[disp_id]['spaces'][0])
        filtered['display_splits'] = display_splits

    return filtered


def main():
    modules = ['spaces', 'windows', 'displays']
    outputs = list(map(get_yabai, modules))
    return json.dumps(prettify_results(*outputs))


if __name__ == '__main__':
    print(main())
