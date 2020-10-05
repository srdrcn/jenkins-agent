# Jenkins agent for **Docker** and **Kubernetes**

[![Build Status](https://srdrcn.semaphoreci.com/badges/jenkins-agent/branches/main.svg?style=shields)](https://srdrcn.semaphoreci.com/projects/jenkins-agent)

## Usage:
              volumes:
                - hostPathVolume:
                    hostPath: "/var/run/docker.sock"
                    mountPath: "/var/run/docker.sock"
