grep -l "sample" dataset/* | while read file; do
    count=$(grep -o "CSC510" "$file" | wc -l)
    size=$(stat -f %z "$file")
    if [ "$count" -ge 3 ]; then
        new_name=$(echo "$file" | sed 's/file_/filtered_/')
        echo "$count $size $new_name"
    fi
done | sort -k1,1nr -k2,2nr
