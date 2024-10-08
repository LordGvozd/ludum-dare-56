#!/bin/sh
echo -ne '\033c\033]0;ludum-dare-56\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/TheRitual.x86_64" "$@"
