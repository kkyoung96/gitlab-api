#!/bin/bash

source configure.sh
source status_check.sh

if [ $# -gt 2 ]
then
        echo "" > git_project_jobs.txt
        for i in {1..10}
        do
                curl --request GET --header "PRIVATE-TOKEN: ${GIT_PRI_TOKEN}" ${GIT_URL}/api/${GIT_API_VERSION}/projects/${GIT_PROJECT_ID}/jobs?per_page=100\&page=${i} | jq >> git_project_jobs.txt
        done
        jq '.[].id' git_project_jobs.txt > jq_prj_job_id.txt
        JOB_ID_FILE="jq_prj_job_id.txt"
else
        echo "Usage: $0 {GIT_URL} {GIT_PRI_TOKEN} {GIT_PROJECT_ID}"
        exit 1
fi