#!/bin/bash

livedir="../toliwe.github.io/"

cd "$livedir"
if [ "$(git config --get user.name)" != "Total Liberation Weekend" ]; then
  echo "ERROR: git user is not set correctly."
  exit 1
fi
if [ "$(git config --get user.email)" != "nothing@example.com" ]; then
  echo "ERROR: git email is not set correctly."
  exit 1
fi

git commit . -m "page update $(date '+%F')"
git pull origin master
git push origin master
