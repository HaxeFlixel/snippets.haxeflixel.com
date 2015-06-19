#!/bin/bash
set -e
mkdir -p ~/neko
curl -s -L --retry 3 'http://nekovm.org/_media/neko-2.0.0-linux64.tar.gz' | tar -C ~/neko -x -z --strip-components=1 -f -
export NEKOPATH="${HOME}/neko"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${NEKOPATH}"
export PATH="${PATH}:${NEKOPATH}"
mkdir -p ~/haxe
curl -s -L --retry 3 'http://haxe.org/website-content/downloads/3.2.0/downloads/haxe-3.2.0-linux64.tar.gz' | tar -C ~/haxe -x -z --strip-components=1 -f -
export PATH="${PATH}:${HOME}/haxe"
export HAXE_STD_PATH="${HOME}/haxe/std"
mkdir -p ~/haxe/lib
haxelib setup ~/haxe/lib
echo $(haxe -version)
echo $(neko -version)
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
haxelib git firetongue https://github.com/larsiusprime/firetongue > /dev/null
haxelib git flixel https://github.com/HaxeFlixel/flixel > /dev/null
haxelib git flixel-tools https://github.com/HaxeFlixel/flixel-tools > /dev/null
haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons dev > /dev/null
haxelib git flixel-ui https://github.com/HaxeFlixel/flixel-ui dev > /dev/null
haxelib list
FAILED=0

for f in $(find ./demos/**/Project.xml -type f -printf '%h\n' -type f ); do
  printf "Building $f..."
  cd $f
  if haxelib run lime build $f/Project.xml flash -release > /dev/null ; then
    printf "SUCCESS!\n"
  else
    printf "FAIL!\n"
    FAILED=1
  fi
  cd ..
done | sort -u

printf "Building ./title-logo..."
cd ./title-logo
if haxelib run lime build ./title-logo/Project.xml flash -release > /dev/null ; then
  printf "SUCCESS!\n"
else
  printf "FAIL!\n"
  FAILED=1
fi
cd ..
exit $FAILED