#!/bin/bash
mkdir -p ~/haxe
curl -s -L --retry 3 'http://haxe.org/website-content/downloads/3.2.0/downloads/haxe-3.2.0-linux64.tar.gz' | tar -C ~/haxe -x -z --strip-components=1 -f -
export PATH="${PATH}:${HOME}/haxe"
export HAXE_STD_PATH="${HOME}/haxe/std"
mkdir -p ~/haxe/lib
haxelib setup ~/haxe/lib
echo $(haxe -version)
haxelib install munit > /dev/null
haxelib install lime > /dev/null
haxelib install openfl > /dev/null
haxelib install hxcpp > /dev/null
haxelib install systools > /dev/null
haxelib install nape > /dev/null
haxelib install task > /dev/null
haxelib install hscript > /dev/null
haxelib install poly2trihx > /dev/null
haxelib git spinehaxe https://github.com/bendmorris/spinehaxe > /dev/null
haxelib git openfl-bitfive https://github.com/YellowAfterlife/openfl-bitfive > /dev/null
haxelib git firetongue https://github.com/larsiusprime/firetongue > /dev/null
haxelib git flixel https://github.com/HaxeFlixel/flixel > /dev/null
haxelib git flixel-tools https://github.com/HaxeFlixel/flixel-tools > /dev/null
haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons dev > /dev/null
haxelib git flixel-ui https://github.com/HaxeFlixel/flixel-ui dev > /dev/null
haxelib list