#!/bin/sh
#set -x

EXCLUDEFOLDERNAME=${3:-"node_modules"}

get_realpath ()
{
    echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
}
SEARCHPATH="$(get_realpath ${2:-"${HOME}"})"

list_tm ()
{
    find "${SEARCHPATH}" -xattrname "com.apple.metadata:com_apple_backup_excludeItem" -name "${EXCLUDEFOLDERNAME}" -type d -prune
}

run_tm ()
{
    find "${SEARCHPATH}" -name "${EXCLUDEFOLDERNAME}" -type d -prune -print0 -exec tmutil addexclusion "{}" \;
}

reset_tm ()
{
    find "${SEARCHPATH}" -xattrname "com.apple.metadata:com_apple_backup_excludeItem" -name "${EXCLUDEFOLDERNAME}" -type d -prune -print0 -exec tmutil removeexclusion "{}" \;
}

case "${1}" in
    list)
        list_tm
    ;;
    run)
        run_tm
    ;;
    reset)
        reset_tm
    ;;
    *)
        echo $"Usage: $0 {run|list|reset} [search path (Default: '${HOME}')] [exclude folder name (Default: 'node_modules')]"
        exit 1
esac
