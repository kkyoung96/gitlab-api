#!/bin/bash

source configure.sh

if [ $# -gt 1 ]
then
        STATUS=$(curl --connect-timeout 5 -o /dev/null -w "%{http_code}" --request GET --header "PRIVATE-TOKEN: ${GIT_PRI_TOKEN}" ${GIT_URL}/api/${GIT_API_VERSION}/user)
        if [ $STATUS -eq 200 ]
        then
                echo $STATUS
        else
                echo Connection Check ${GIT_URL} By status_check.sh
                exit 1
        fi
fi