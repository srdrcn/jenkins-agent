FROM jenkins/jnlp-slave:4.3-9-alpine
WORKDIR /project
USER root
RUN apk add docker

USER jenkins

ENTRYPOINT ["jenkins-slave"]
