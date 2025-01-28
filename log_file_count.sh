#!/bin/bash

# Directory to count files in
TARGET_DIR="/Users/hemanthjoy/Desktop/J"

# Output CSV file
OUTPUT_FILE="file_count_log.csv"

# Get the current date and time
CURRENT_TIME=$(date +"%Y-%m-%d %H:%M:%S")

# Count the number of files in the directory
FILE_COUNT=$(find "$TARGET_DIR" -type f | wc -l)

# Check if the output file exists; if not, add a header
if [ ! -f "$OUTPUT_FILE" ]; then
    echo "Timestamp,File Count" > "$OUTPUT_FILE"
fi

# Append the timestamp and file count to the CSV file
echo "$CURRENT_TIME,$FILE_COUNT" >> "$OUTPUT_FILE"

echo "File count logged successfully to $OUTPUT_FILE."
