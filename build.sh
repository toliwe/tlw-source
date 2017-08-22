#!/bin/bash

jbase="jekyll/"
livedir="../toliwe.github.io/"

if [ ! -d "$jbase" ]; then
  echo "ERROR: jbase not found in '$jbase'"
  exit 1
fi

(
  cd "$jbase"
  jekyll build
)
./compress.sh
set -x
if [ -d "$livedir" ]; then
  rm -rf "$livedir"/*
  cp -r "$jbase/_site"/* "$livedir/"
  echo "DONE: just commit and push"
else
  echo "ERROR: livedir not found in '$livedir'"
  exit 1
fi

