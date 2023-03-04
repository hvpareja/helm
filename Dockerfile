FROM alpine:3.17.2

ENV BASE_URL="https://get.helm.sh"

ENV HELM_3_FILE="helm-v3.11.1-linux-amd64.tar.gz"
ENV PYTHONPATH "/usr/lib/python3.11/site-packages/"


RUN apk add --no-cache ca-certificates \
    jq curl bash nodejs aws-cli && \
    # Install helm version 3:
    curl -L ${BASE_URL}/${HELM_3_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm3 && \
    chmod +x /usr/bin/helm3 && \
    ln -s /usr/bin/helm3 /usr/bin/helm && \
    rm -rf linux-amd64

COPY . /usr/src/
ENTRYPOINT ["node", "/usr/src/index.js"]
