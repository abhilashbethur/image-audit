#!/bin/bash

echo "🔍 Starting unused image scan..."

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SRC_DIR="$SCRIPT_DIR/src"
RESULT_FILE="$SCRIPT_DIR/unused-images.txt"
CODE_SNAPSHOT="$SCRIPT_DIR/all-code.txt"

# Step 1: Create code snapshot from all relevant code files
echo "📄 Creating code snapshot..."
find "$SRC_DIR" -type f \( -iname '*.js' -o -iname '*.jsx' -o -iname '*.ts' -o -iname '*.tsx' -o -iname '*.mdx' -o -iname '*.css' -o -iname '*.scss' -o -iname '*.json' -o -iname '*.html' \) -exec cat {} + > "$CODE_SNAPSHOT"

# Step 2: Initialize counters
count=0
unused=0

# Clear previous results
> "$RESULT_FILE"

# Step 3: Start scanning images
while IFS= read -r img; do
  count=$((count + 1))
  basename=$(basename "$img")
  echo "[$count] Checking image: $basename"

  if ! grep -qF "$basename" "$CODE_SNAPSHOT"; then
    echo "❌ Unused image: $img"
    echo "$img" >> "$RESULT_FILE"
    unused=$((unused + 1))
  else
    echo "✅ Used image: $basename"
  fi
done < <(find "$SRC_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.svg' \))

# Step 4: Summary
echo ""
echo "✅ Scan complete. Total images checked: $count"
echo "🗑️  Unused images found: $unused"
echo "📁 Results saved to: $RESULT_FILE"