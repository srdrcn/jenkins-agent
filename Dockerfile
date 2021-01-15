FROM jenkins/jnlp-slave:4.3-9-alpine
WORKDIR /project
USER root
RUN apk add docker
ARG KUBE_VERSION="1.19.3"

RUN apk add --update ca-certificates && \
    apk add --update -t deps curl && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/v$KUBE_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    apk del --purge deps && \
    rm /var/cache/apk/*
USER jenkins

ENTRYPOINT ["jenkins-slave"]
