FROM jenkins/jnlp-slave:4.3-9-alpine
WORKDIR /project
USER root
RUN apk add docker
ARG KUBE_VERSION="1.19.3"
ENV HELM_VERSION="v3.4.2"

RUN apk add --update ca-certificates && \
    apk add --update -t deps curl && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/v$KUBE_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm  && \
    chmod +x /usr/local/bin/helm && \
    apk del --purge deps && \
    rm /var/cache/apk/*
USER jenkins

ENTRYPOINT ["jenkins-slave"]
