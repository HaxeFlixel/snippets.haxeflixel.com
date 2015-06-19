#!/bin/bash
set -ev
for f in $(find ./demos/**/Project.xml -type f); do
  haxelib run lime build $f flash -release
done