#!/usr/bin/env python

import subprocess
import re
import json


def get_spaces():
    ps = subprocess.Popen(['yabai', '-m', 'query', '--spaces'], stdout=subprocess.PIPE).communicate()[0].replace('\n', '').replace('\t', '').replace('[{', '').replace('}]', '').split('},{')
    result = {}
    for k, item in enumerate(ps):
        item = "{" + item + "}".replace("'", "\"")
        json_string = json.loads(item)
        result[k] = json_string
    return result

def get_windows():
    ps = subprocess.Popen(['yabai', '-m', 'query', '--windows'], stdout=subprocess.PIPE).communicate()[0].replace('\n', '').replace('\t', '').replace('[{', '').replace('}]', '').split('},{')
    result = {}
    for k, item in enumerate(ps):
        item = "{" + item + "}".replace("'", "\"")
        json_string = json.loads(item)
        result[k] = json_string
    return result

def prettify_results(spaces, windows):
    active_window = json.loads(subprocess.Popen(['yabai', '-m',  'query', '--windows', '--window'], stdout=subprocess.PIPE).communicate()[0].replace('\n', '').replace('\t', '').replace("'", "\""))
    result = {}
    for space in spaces:
        result[str(space)] = {}
        for window in windows:
            if windows[window]['id'] in spaces[space]['windows']:
                result[str(space)][str(windows[window]['id'])] = windows[window]['app']
    result['active'] = {str(active_window['id']): active_window['app']}
    return result




def main():
    return json.dumps(prettify_results(get_spaces(), get_windows()))


if __name__ == '__main__':
    print(main())
