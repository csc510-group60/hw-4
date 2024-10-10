#!/bin/bash
# List files containing "sample" and at least 3 occurrences of "CSC510"
grep -l 'sample' dataset1/* | while read file; do
  count=$(grep -o 'CSC510' "$file" | wc -l)
  if [ "$count" -ge 3 ]; then
    echo "$file $count"
  fi
done | sort -k2,2nr -k1,1 | while read file count; do
  # Replace "file_" with "filtered_" in the file name and list output
  newname=$(echo "$file" | sed 's/file_/filtered_/')
  echo "$newname"
done
