#!/bin/bash
set -e
if [ ! -f ~/neko/neko-2.0.0-linux64.tar.gz ]; then
  mkdir -p ~/neko
  curl -s -L --retry 3 'http://nekovm.org/_media/neko-2.0.0-linux64.tar.gz' | tar -C ~/neko -x -z --strip-components=1 -f -
fi
export NEKOPATH="${HOME}/neko"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${NEKOPATH}"
export PATH="${PATH}:${NEKOPATH}"
if [ ! -f ~/haxe/haxe-3.2.0-linux64.tar.gz ]; then
  mkdir -p ~/haxe
  curl -s -L --retry 3 'http://haxe.org/website-content/downloads/3.2.0/downloads/haxe-3.2.0-linux64.tar.gz' | tar -C ~/haxe -x -z --strip-components=1 -f -
fi
export PATH="${PATH}:${HOME}/haxe"
export HAXE_STD_PATH="${HOME}/haxe/std"
mkdir -p ~/haxe/lib
haxelib setup ~/haxe/lib
haxelib install lime > /dev/null
haxelib install openfl > /dev/null
haxelib git flixel https://github.com/HaxeFlixel/flixel > /dev/null
haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons > /dev/null
haxelib git flixel-tools https://github.com/HaxeFlixel/flixel-tools > /dev/null
