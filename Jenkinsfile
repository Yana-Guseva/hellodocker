pipeline {
    agent {
        dockerfile true
    }
    tools {
        maven 'Maven 3.5.4'
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage ('Docker version') {
            environment {
                 set DOCKER_CERT_PATH=%USERPROFILE%\.docker\machine\machines\default
                 set DOCKER_HOST=tcp://192.168.99.100:2376
                 set DOCKER_MACHINE_NAME=default
                 set DOCKER_TLS_VERIFY=1
            }
            steps {
                sh 'echo "docker --version"'
            }
        }
        stage ('Docker build') {
            steps {
                script{
                    docker.build('hellodocker')
                }
            }
        }
    }
}