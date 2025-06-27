FROM alpine:latest

RUN apk update && apk add --no-cache curl jq

RUN --mount=type=secret,id=GITHUB_TOKEN \
  sh -c 'token=$(cat /run/secrets/GITHUB_TOKEN) && \
         curl -s -H "Authorization: Bearer $token" https://api.github.com/repos/jmcc-sss/gha-testing/collaborators | jq ".[0] | {login, permissions}"'