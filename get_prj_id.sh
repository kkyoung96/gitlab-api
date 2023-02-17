#!/bin/bash

source configure.sh
source status_check.sh

if [ $# -gt 1 ]
then
        echo "" > jq_prj_id.txt
        for i in {1..5}
        do
                curl --request GET --header "PRIVATE-TOKEN: ${GIT_PRI_TOKEN}" ${GIT_URL}/api/${GIT_API_VERSION}/projects?per_page=100\&page=${i} | jq '.[] | {id: .id, url: .web_url}' >> jq_prj_id.txt
        done
else
        echo "Usage: $0 {GIT_URL} {GIT_PRI_TOKEN}"
        exit 1
fi