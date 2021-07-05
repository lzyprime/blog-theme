#!/bin/bash

##### define #####
repo_addr="git@github.com:lzyprime/blog-theme.git"
branch="gh-page"
self_source="`pwd`"
##### define end #####

function generate() {
    ./post.sh
    hexo clean
    hexo g
}

function push() {
    cd $self_source/../../../public
    rm -rf .git
    git init
    git add .
    git commit -m "update`date '+%Y-%m-%d %H:%M'`"
    git remote add origin $repo_addr
    git.exe push -f origin master:$branch
}

#### begin ####

if [[ "$1" != "push" ]]; then
    generate
fi

if [[ "$1" != "g" ]]; then
    push
fi

#### end ####
