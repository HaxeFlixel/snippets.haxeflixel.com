#!/bin/bash
set -e
if [ ! -f ~/neko/neko-2.0.0-linux64.tar.gz ]; then
  mkdir -p ~/neko
  curl -s -L --retry 3 'http://nekovm.org/_media/neko-2.0.0-linux64.tar.gz' | tar -C ~/neko -x -z --strip-components=1 -f -
fi
if [ ! -f ~/haxe/haxe-3.2.0-linux64.tar.gz ]; then
  mkdir -p ~/haxe
  curl -s -L --retry 3 'http://haxe.org/website-content/downloads/3.2.0/downloads/haxe-3.2.0-linux64.tar.gz' | tar -C ~/haxe -x -z --strip-components=1 -f -
fi
mkdir -p ~/haxe/lib
haxelib setup ~/haxe/lib
haxelib install lime 2.9.1 > /dev/null
haxelib install openfl 3.6.1 > /dev/null
haxelib git flixel https://github.com/HaxeFlixel/flixel > /dev/null
haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons > /dev/null
haxelib git flixel-tools https://github.com/HaxeFlixel/flixel-tools > /dev/null
