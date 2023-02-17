#!/bin/bash

source configure.sh
source status_check.sh
source get_prj_job_id.sh

if [ $# -gt 2 ]
then
        for i in `cat ${JOB_ID_FILE}`
        do
                echo $i
                curl --request DELETE --header "PRIVATE-TOKEN: ${GIT_PRI_TOKEN}" ${GIT_URL}/api/${GIT_API_VERSION}/projects/${GIT_PROJECT_ID}/jobs/${i}/artifacts
        done
else
        echo "Usage: $0 {GIT_URL} {GIT_PRI_TOKEN} {GIT_PROJECT_ID}"
        exit 1
fi