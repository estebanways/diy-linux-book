#!/bin/bash
filecontent=( `cat "test.list" `)

for t in "${filecontent[@]}"
do
echo $t
done
echo "Read file content!"


