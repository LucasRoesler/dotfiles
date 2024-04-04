#!/usr/bin/env bash
default=$(git ls-remote --symref origin HEAD | sed -nE 's|^ref: refs/heads/(\S+)\s+HEAD|\1|p')
quiet=false

while getopts "q" opt; do
  case $opt in
    q)
      quiet=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

git checkout -q "$default" && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do
  mergeBase=$(git merge-base $default $branch)
  if [[ $(git cherry $default $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]]; then
    if [ "$quiet" = true ]; then
      echo "$branch"
    else
      echo "$branch is merged into '$default' and can be deleted"
    fi
  fi
done

