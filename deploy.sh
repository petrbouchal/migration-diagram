#!/usr/bin/env zsh

rm -rf deploy-files
mkdir deploy-files
cp index.html deploy-files
cp colours.html deploy-files

netlify deploy --prod --dir=deploy-files

rm -rf deploy-files
