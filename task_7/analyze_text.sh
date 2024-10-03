#!/bin/bash

file_path="$1"

# Check if the file is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "Error: The file '$file_path' does not exist."
    exit 1
fi

# Count lines, words, and characters
line_count=$(wc -l < "$file_path")
word_count=$(wc -w < "$file_path")
char_count=$(wc -c < "$file_path")

# Find the longest word
longest_word=$(tr -s '[:space:]' '\n' < "$file_path" | awk '{ if (length > max_length) { max_length = length; longest = $0 } } END { print longest }')

# Display the results
echo "Number of lines: $line_count"
echo "Number of words: $word_count"
echo "Number of characters: $char_count"
echo "Longest word: $longest_word"

