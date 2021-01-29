#!/bin/bash
echo "Load helpers & install dependencies"
which git || ( apt-get update -y && apt-get install -y git)
which xz-utils || (apt-get update -y && apt-get install xz-utils -y)
./scripts/github/init_git.sh
