# Jenkins agent for **Docker** and **Kubernetes**

## Usage:
              volumes:
                - hostPathVolume:
                    hostPath: "/var/run/docker.sock"
                    mountPath: "/var/run/docker.sock"
