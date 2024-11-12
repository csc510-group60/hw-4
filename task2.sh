#!/bin/bash

grep -l "sample" dataset1/file* \
| xargs -I{} grep -oH "CSC510" "{}" \
| sed 's/:CSC510$//' \
| sort \
| uniq -c \
| awk '$1 >= 3' \
| gawk '{
    cmd = "wc -c \"" $2 "\""
    cmd | getline line
    close(cmd)
    split(line, arr, " ")
    size = arr[1]
    printf "%10d %s %d\n", $1, $2, size
}' \
| sort -k1,1nr -k3,3nr \
| sed 's/file_/filtered_/g'  
