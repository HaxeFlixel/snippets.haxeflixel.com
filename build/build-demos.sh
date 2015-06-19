#!/bin/bash
set -ev
export NEKOPATH="${HOME}/neko"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${NEKOPATH}"
export PATH="${PATH}:${NEKOPATH}"
export PATH="${PATH}:${HOME}/haxe"
export HAXE_STD_PATH="${HOME}/haxe/std"
for f in $(find ./demos/**/Project.xml -type f); do
  haxelib run lime build $f flash -release
done