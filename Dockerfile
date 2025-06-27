FROM alpine:latest

RUN apk update && apk add --no-cache curl jq

RUN --mount=type=secret,id=GITHUB_TOKEN \
    sh -c 'token=$(cat /run/secrets/GITHUB_TOKEN); \
           echo "Token length: ${#token}"; \
           curl -s -H "Authorization: Bearer $token" https://api.github.com/user | jq "{login, id, type}"'