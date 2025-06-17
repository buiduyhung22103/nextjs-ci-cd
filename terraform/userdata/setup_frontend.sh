#!/bin/bash
yum update -y
curl -fsSL https://rpm.nodesource.com/setup_16.x | bash -
yum install -y nodejs git

cd /home/ec2-user
git clone ${repo_url} repo
cd repo/counter-app/frontend
npm install
npm run build
npm install -g serve
serve -s dist -l 80 &