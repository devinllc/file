#!/bin/bash

# This script will reset your GitHub repository and push a clean version
# without sensitive credentials in the history

# Ensure we're in the correct directory
cd /Users/vramesh/jobss

# Create a temporary directory for a clean repository
echo "Creating temporary directory..."
mkdir -p ~/temp_new_repo
cd ~/temp_new_repo

# Initialize new Git repository
echo "Initializing new repository..."
git init
git branch -m master main  # Rename the default branch to main
touch README.md
echo "# File Manager Application" > README.md
echo "" >> README.md
echo "A secure file management system with user authentication and AWS S3 integration." >> README.md
git add README.md
git commit -m "Initial commit"

# Add remote
echo "Adding remote repository..."
git remote add origin https://github.com/devinllc/fmg_flstc.git

# Force push to overwrite history
echo "Force pushing to reset repository history..."
git push -f origin main

# Navigate back to the original project
echo "Returning to main project directory..."
cd /Users/vramesh/jobss

# Remove the credentials file to be safe
rm -f filemanager/backend/firebase-credentials.json

# Create a cleaner, more organized copy
echo "Creating a clean copy of the project..."
mkdir -p ~/temp_new_repo/filemanager
cp -r filemanager/* ~/temp_new_repo/filemanager/
cp -f filemanager/.gitignore ~/temp_new_repo/filemanager/

# Commit and push files
cd ~/temp_new_repo
echo "Adding all project files..."
git add .
git commit -m "Add project files with credentials removed"

echo "Pushing clean version of the project..."
git push origin main

echo "Done! Your repository has been reset and a clean version has been pushed."
echo "IMPORTANT: Remember to revoke and replace all exposed credentials as they may have been compromised." 