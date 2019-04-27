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
            steps {
                sh 'docker --version'
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