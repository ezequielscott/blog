#!/bin/bash

echo -e "\033[0;32mUpdating source code on GitHub...\033[0m"

# Build the project.
hugo -t cocoa # if using a theme, replace by `hugo -t <yourtheme>`

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# copy all the contents
cp -R public/* ezequielscott.github.io/

cd ezequielscott.github.io/

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build deploy.
git push origin master

cd ..

read -n1 -r -p "Press any key to continue..." key