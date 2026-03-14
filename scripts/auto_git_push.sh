#!/bin/bash
git pull --rebase
if [ $? -ne 0 ]; then
  echo "Git pull failed. Resolve conflicts and try again."
  exit 1
fi
git add .
git commit -m "Auto update and push"
git push origin main
