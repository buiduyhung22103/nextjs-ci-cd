#!/bin/bash
yum update -y
curl -fsSL https://rpm.nodesource.com/setup_16.x | bash -
yum install -y nodejs git

cd /home/ec2-user
git clone ${repo_url} repo
cd repo/counter-app/backend
npm install

export DB_HOST=${db_host}
export DB_NAME=${db_name}
export DB_USER=${db_user}
export DB_PASS=${db_pass}

nohup node index.js > backend.log 2>&1 &
