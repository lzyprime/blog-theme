#!/bin/bash

function dfs() {
	for i in `ls`; do
		if [ -d "$i" ]; then
			cd "$i"
			dfs
			cd ../
		elif [[ "$i" =~ .*.md$ ]]; then 
			filename=$(basename "$i" .md)
			sed -i "" "s#($filename/#(../$filename/#" $i
			echo $filename finish
		fi
	done
}

cd ../../../source
dfs