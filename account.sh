#!/bin/bash

# How to run:
# sh account.sh admin Admin@69

# Arguments
USERNAME=$1
PASSWORD=$2

# Create file and directory
directory=./auth
file=./auth/htpasswd

if [ ! -d "$directory" ]; then
  mkdir "$directory"
  echo "Directory created: $directory"

  if [ ! -f "$file" ]; then
    touch "$file"
    echo "File created: $file"
  fi
fi

# Create account
# htpasswd -Bbn "$USERNAME" "$PASSWORD" > ./auth/htpasswd
docker run \
  --entrypoint htpasswd \
  httpd:2 -Bbn "$USERNAME" "$PASSWORD" > ./auth/htpasswd

# View
echo "Created: "
cat ./auth/htpasswd