#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
echo "Usage: $0 <folder_path>"
exit 1
fi

# Assign the directory path to a variable
folder_path=$1

# Check if the directory exists
if [ ! -d "$folder_path" ]; then
echo "Directory not found!"
exit 1
fi

# List of keywords to search for
keywords=("keywords to search")

# Iterate over each keyword and search for it in the given directory and all subdirectories
for keyword in "${keywords[@]}"; do
echo "Searching for keyword '$keyword' in files within directory '$folder_path' and all subdirectories..."
grep --color=auto -rni "$keyword" "$folder_path"

# Check the result of grep for this keyword
if [ "$?" -ne 0 ]; then
echo "Keyword '$keyword' not found in any file within '$folder_path' or its subdirectories."
else
echo "Search for '$keyword' complete."
fi
echo "---------------------------------------------"
done
