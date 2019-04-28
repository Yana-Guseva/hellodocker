pipeline {
    agent any
     environment {
            DOCKER_CERT_PATH="C:\\Users\\Yana\\.docker\\machine\\machines\\default"
            DOCKER_HOST="tcp://192.168.99.100:2376"
            DOCKER_MACHINE_NAME="default"
            DOCKER_TLS_VERIFY="1"
            ECR_URL = "https://625035742010.dkr.ecr.eu-central-1.amazonaws.com"
            ECR_CREDENTIALS = "ecr:eu-central-1:aws_ecr_credentials"
            VERSION = "latest"
            PROJECT = "hellodocker"
            IMAGE = "hellodocker"
            // AWS_ACCESS_KEY_ID=""
            // AWS_SECRET_ACCESS_KEY=""
            // AWS_DEFAULT_REGION=""
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
            steps {
                sh 'docker --version'
            }
        }
        stage ('Docker build') {
            steps {
                script {
                    docker.build("$IMAGE:${env.BUILD_NUMBER}")
                }
            }
        }
        stage ('Docker push') {
            steps {
                script {
                    // sh("eval \$(aws ecr get-login --no-include-email --region eu-central-1)")
                    docker.withRegistry(ECR_URL, ECR_CREDENTIALS)
                    {
                        docker.image("$IMAGE:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
    post {
        always {
            sh "docker rmi $IMAGE:${env.BUILD_NUMBER}"
        }
    }
}