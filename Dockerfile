FROM jenkins/jnlp-slave:4.3-9-alpine
WORKDIR /project
USER root
RUN apk add docker
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.1/bin/linux/amd64/kubectl
RUN chmod u+x kubectl && mv kubectl /bin/kubectl
USER jenkins

ENTRYPOINT ["jenkins-slave"]
