#!/bin/bash
FIND="https://git.karoo.fr"
REPLACE="ssh://git@git.karoo.fr"
git --version
which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y)
eval $(ssh-agent -s)
echo "${SSH_PRIVATE_KEY}" | ssh-add -
mkdir -p ~/.ssh
[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
chmod 700 ~/.ssh
# ssh -T git@git.karoo.fr
git config --global http.sslverify false
git config --global user.name "Comforth-Karoo CI"
git config --global user.email "ci@comforth-karoo.eu"
git config --global core.quotepath false
git config --list
# git remote set-url --push origin "${$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/$FIND/$REPLACE}"
# git config --global url."https://gitlab-ci-token:${CI_JOB_TOKEN}@git.karoo.fr/".insteadOf https://git.karoo.fr/
