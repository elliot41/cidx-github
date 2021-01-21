#!/bin/bash
echo "Load helpers & install dependencies"
which git || ( apt-get update -y && apt-get install -y git)
which xz-utils || (apt-get update -y && apt-get install xz-utils -y)
./scripts/github/install_salesforce_cli.sh
./scripts/github/init_git.sh
npm config set user 0
npm config set unsafe-perm true
npm cache verify
npm install "git+https://project_649_bot:${CI_JOB_TOKEN}@git.karoo.fr/licences/cidx#master" --global --loglevel=error
cidx --version
