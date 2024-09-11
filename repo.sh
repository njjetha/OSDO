#!/bin/bash

# URL of the API endpoint


per_page=30
page=1
# url="https://api.github.com/orgs/quic/repos?type=public&page=$page"
# Fetch the JSON data and extract the full_name value'

while [ $page ];
do
  url="https://api.github.com/orgs/quic/repos?type=public&page=$page"
  full_name=$(curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer <TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" -s $url | jq -r '.[].full_name')
  
  full_names+=$full_name
  page=$((page+1))
  
  if [[ -z $full_name ]]; then
    break
  fi
done

# Print the full_name value
echo $full_names
