#!/bin/bash

# Define directories to search for Jsonnet files
search_dirs=("tenants" "platform")
output_dir="manifests"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Function to compile a single Jsonnet file
compile_jsonnet() {
  local file_path="$1"
  local output_path="$2"
  echo "Compiling $file_path to $output_path"
  jsonnet -J modules -o "$output_path" "$file_path"
}

# Loop through the directories and compile each Jsonnet file found
for dir in "${search_dirs[@]}"; do
  find "$dir" -type f -name '*.jsonnet' | while read -r file; do
    # Generate output path by replacing base directory name and extension
    output_path=$(echo "$file" | sed "s|^\./||;s|\.jsonnet$|.yaml|")
    output_path="$output_dir/${output_path}"
    mkdir -p "$(dirname "$output_path")"
    compile_jsonnet "$file" "$output_path"
  done
done
