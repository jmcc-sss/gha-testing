FROM alpine:latest

RUN apk update && apk add --no-cache curl jq

RUN --mount=type=secret,id=GITHUB_TOKEN \
    sh -c 'curl -s -H "Authorization: Bearer $(cat /run/secrets/GITHUB_TOKEN)" https://api.github.com/user | jq "{login, id, type}"'
