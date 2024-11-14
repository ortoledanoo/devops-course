#!/bin/bash
# Argument ($1) is The IP From EC2

repos=("/home/ortoledano/Documents/test_project")

for repo in "${repos[@]}"
do
    cd "$repos" || continue
    # $1 = Ip Of Server
    # -d'/' = Determinator as /
    # -f4- = Return From The 4th and Untill END
    git remote set-url origin "https://$1/$(git remote get-url origin | cut -d'/' -f4-)"
done
