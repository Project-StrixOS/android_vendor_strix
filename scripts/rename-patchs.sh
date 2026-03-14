#!/bin/bash

DIR=$1

if [ -z "$DIR" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

for f in "$DIR"/*.diff; do
    [ -e "$f" ] || continue

    new="${f%.diff}.patch"
    mv "$f" "$new"

    echo "rename: $f -> $new"
done