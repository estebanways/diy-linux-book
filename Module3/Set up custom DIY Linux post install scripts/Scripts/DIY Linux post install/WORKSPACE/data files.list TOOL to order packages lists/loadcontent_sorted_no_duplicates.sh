#!/bin/bash
# Pipes a whole list of such lines into and it will print the sorted list of unique words for each line.
# Next returns the string no new lines.
#filecontent=( `sort "test.list" | xargs -n1 | sort -u | xargs >output.txt `)
filecontent=( `sort "test.list" | xargs -n1 | sort -u | xargs -n1 >output.txt `)
for t in "${filecontent[@]}"
do
echo $t
done
echo "Read file content!"

cat output.txt

