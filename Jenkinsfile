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
        stage ('Docker build') {
            steps 'docker --version'
                sh 'dock'
                script{
                    docker.build('hellodocker')
                }
            }
        }
    }
}