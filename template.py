#! /usr/bin/env python3

import argparse
import pathlib
import sys

TEMPLATE_STRING = "{{INSERT_HERE}}"

def main():
    parser = argparse.ArgumentParser(description="Merge content into template.")
    parser.add_argument(
        "template",
        type=pathlib.Path,
        help="template file containing a single line with `{{INSERT_HERE}}`"
    )
    parser.add_argument(
        "content",
        type=pathlib.Path,
        help="content file which will be placed into template. If not specified, read from STDIN instead.",
        default=None,
        nargs="?",
    )

    args = parser.parse_args()

    template_path = args.template
    content_path = args.content

    with template_path.open('r') as f:
        template = ''.join(f.readlines())

    if content_path is None:
        content = ''.join(sys.stdin.readlines())
    else:
        with content_path.open('r') as f:
            content = ''.join(f.readlines())

    merged = template.replace(TEMPLATE_STRING, content)

    print(merged)

if __name__ == "__main__":
    main()
