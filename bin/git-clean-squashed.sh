#!/usr/bin/env bash
default=$(git ls-remote --symref origin HEAD | sed -nE 's|^ref: refs/heads/(\S+)\s+HEAD|\1|p')
git checkout -q "$default" && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $default $branch) && [[ $(git cherry $default $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done