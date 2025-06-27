FROM alpine:latest

RUN apk update && apk add --no-cache curl jq

RUN --mount=type=secret,id=GITHUB_TOKEN \
  sh -c 'token=$(cat /run/secrets/GITHUB_TOKEN); \
         curl -s -H "Authorization: Bearer $token" https://api.github.com/repos/jmcc-sss/gha-testingactions/workflows \
         | jq "{total_count, workflows: [.workflows[].name]}"' | jq "{name, owner, private}"'