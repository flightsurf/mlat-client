#!/bin/bash

set -e
trap 'echo "[ERROR] Error in line $LINENO when executing: $BASH_COMMAND"' ERR

git add version
VERSION=$(cat version)

git commit -m "incrementing version: $VERSION"

git tag "v$VERSION"
git push
git push --tag

