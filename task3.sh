cat titanic.csv \
| gawk -F, '{print $6" "$7" "$3" "$13" "$4" "$5}' \
| grep -E '[0-9]+\s[2]\sS' \
| sed 's/female/F/' \
| sed 's/male/M/' \
| awk '{ sum += $2; n++; print $4" "$5" "$6" "$7" "$1" "$2" "$3} 
       END { if (n > 0) print "Average Age: " sum/n; }'
