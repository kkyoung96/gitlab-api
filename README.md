# ?
- Gitlab API를 이용하여 Job Artifact 제거
## 0. setting
```bash
(install) jq
```

## 1. GET Projects ID
```bash
./get_prj_id.sh {GIT_URL} {GIT_PRI_TOKEN}
...
(output file) jq_prj_id.txt
```
### jq_prj_id.txt example
```json
{
  "id": 1,
  "url": "{GIT_URL}/{GROUP}/{REPO}"
}
```

## 2. DELETE Project jobs artifact
```bash
./delete_prj_job_artifacts.sh {GIT_URL} {GIT_PRI_TOKEN} {GIT_PROJECT_ID}
```