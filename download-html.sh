#!/usr/bin/env bash

while read -r id url; do
    if [ ! -f html/${id}.html ]
    then
        curl https://polisen.se/${url} -o html/${id}.html
    fi
done< <(cat events.json | jq --raw-output '.[] | "\(.id) \(.url)"')
