#!/bin/sh
set -eu
cd "$(dirname "$0")/.."

if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
    echo "Uso: $0 themes|plugins slug [--apply]" >&2
    exit 2
fi
case "$1" in themes|plugins) ;; *) exit 2 ;; esac
case "$2" in ''|*[!a-z0-9_-]*) exit 2 ;; esac
case "${3:-}" in ''|--apply) ;; *) exit 2 ;; esac

component="site/wp-content/$1/$2"
git fetch origin main
revision=$(git rev-parse origin/main)
if [ "$(git cat-file -t "$revision:$component" 2>/dev/null)" != tree ]; then
    echo "Componente assente da origin/main: $component" >&2
    exit 1
fi

stage=$(mktemp -d)
trap 'rm -rf "$stage"' EXIT
git archive --format=tar --output="$stage/component.tar" "$revision" "$component"
tar -xf "$stage/component.tar" -C "$stage"
destination="u810287674@217.65.157.27:domains/petrinistudiodentistico.it/public_html/wp-content/$1/$2/"
echo "Commit: $revision"
if [ "${3:-}" = --apply ]; then
    rsync -ri -e 'ssh -p 65002' "$stage/$component/" "$destination"
else
    rsync -rin -e 'ssh -p 65002' "$stage/$component/" "$destination"
fi
