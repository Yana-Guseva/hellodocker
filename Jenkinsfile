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
            steps {
                script{
                    sh docker --version
                    docker.build('hellodocker')
                }
            }
        }
    }
}