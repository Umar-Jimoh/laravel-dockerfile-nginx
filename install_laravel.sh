#!/bin/bash
# install_laravel.sh
# Usage: ./install_laravel.sh

set -e

# Step 1: Rename existing template README
if [ -f README.md ]; then
    echo "Renaming existing README.md to TEMPLATE_README.md..."
    mv README.md TEMPLATE_README.md
fi

# Step 2: Install Laravel in temp folder
TEMP_DIR="laravel_temp"

echo "Installing Laravel in temporary folder ($TEMP_DIR)..."
laravel new "$TEMP_DIR"

# Step 3: Move Laravel files to root
echo "Moving Laravel files to project root..."
shopt -s dotglob
mv "$TEMP_DIR"/* .
mv "$TEMP_DIR"/.* . 2>/dev/null || true
shopt -u dotglob

# Step 4: Remove temp folder
rm -rf "$TEMP_DIR"

echo "Laravel installation complete!"
echo "- Check your .env and database configuration."
echo "- Docker setup is already in the docker/ folder."
