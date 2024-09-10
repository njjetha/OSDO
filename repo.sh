#!/bin/bash

# URL of the API endpoint
url="https://api.github.com/orgs/quic/repos?type=public"

# Fetch the JSON data and extract the full_name value
full_name=$(curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer <TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" -s $url | jq -r '.[].full_name')

# Print the full_name value
echo $full_name 
