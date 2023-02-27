# Grafana - Backup Docker

This project is a template for grafana using docker compose, to help and maximize the time for backup, restore and new tech monitoring

The project contains a docker-compose file, with initial configuration, and some shell scripts for init your docker, backup the docker, and restore the docker.

You can optimeza this process if you want, using Jenkins for exemple;

```java
pipeline {
    agent any
    stages {
        stage('Environment') {
            steps {
                script{
                    parameters{
                        choice(
                            name: 'process',
                            choices: ['init','backup','restore'],
                            description: 'select what process you want to do'
                        )
                    }
                    if (env.process == "init"){
                        node ('test'){
                            sh """bash /root/git/grafana-project/init.sh -d=${env.dir}"""
                        }
                    }
                    if (env.process == "backup"){
                        node ('test'){
                            sh """bash /root/git/grafana-project/backup.sh -d=${env.dir}"""
                        }
                    }
                    if (env.process == "restore"){
                        node ('test'){
                            sh """bash /root/git/grafana-project/restore.sh -d=${env.dir}"""
                        }
                    }
                }
            }
        }
    }
}
```
All shell script use a -d parameter for directory, if you set the wrong directory, the will fail, but he won't say it to you, so be careful.
