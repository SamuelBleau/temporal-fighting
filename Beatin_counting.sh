#!/bin/sh
echo -ne '\033c\033]0;Tests\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Beatin_counting.x86_64" "$@"
