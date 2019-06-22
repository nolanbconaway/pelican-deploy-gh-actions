#!/bin/bash

set -e

# lots copied from https://github.com/nelsonjchen/gh-pages-pelican-action

echo "REPO: $GITHUB_REPOSITORY"
echo "ACTOR: $GITHUB_ACTOR"


echo '----- Making HTML -----'
make html
cd output


echo '----- Generating git branch -----'
remote_repo="git@github.com:${GITHUB_REPOSITORY}.git"
git init
git remote add deploy "$remote_repo"
git checkout $remote_branch || git checkout --orphan $remote_branch
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
echo -n 'Files to Commit:' && ls -l | wc -l
timestamp=$(date +%s%3N)


echo '----- Commiting files, deploying -----'
git commit -m "[ci skip] Automated deployment to GitHub Pages on $timestamp"
git push deploy $remote_branch --force
rm -fr .git
cd ../


echo '----- Done -----'