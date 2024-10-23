grep -l "sample" ./dataset1/* \
| xargs grep -o "CSC510" \
| uniq -c \
| grep -E "^\s+[3-9][0-9]*|^\s+[1-9][0-9]+\s\w+" \
| gawk '{print $1, $2}' \
| sed 's/:CSC510$//' \
| xargs -I {} sh -c 'file=$(echo "{}" | gawk "{print \$2}"); echo "{}" $(stat -c%s "$file")' \
| sort -k1,1nr -k3,3nr \
| sed 's/file/filtered/'
