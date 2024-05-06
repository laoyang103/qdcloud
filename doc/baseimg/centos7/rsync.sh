#!/bin/bash

# home,var,etc,root,usr
dirList=$(echo $1 | sed "s/,/ /g")
targetDir=$2
for dir in ${dirList[@]}; do
  if [ ! -e "$targetDir/$dir/.synced" ]; then
    rsync -a /$dir $targetDir/
    touch $targetDir/$dir/.synced
    ls $targetDir/$dir/
  fi
done


