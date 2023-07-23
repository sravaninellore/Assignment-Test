largest_file=""
largest_size=0

# Find the largest log file
for file in *.log; do
    size=$(wc -l < "$file")
    if (( size > largest_size )); then
        largest_size=$size
        largest_file=$file
    fi
done

# Truncate the largest log file to 100 lines
if [[ -n $largest_file ]]; then
    tail -n 100 "$largest_file" > "$largest_file.tmp"
    mv "$largest_file.tmp" "$largest_file"
    echo "Truncated $largest_file to 100 lines."
else
    echo "No log files found."
fi
