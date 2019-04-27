pipeline {
    agent {
        dockerfile true
    }
    tools {
        maven 'Maven 3.5.4'
        docker 'Docker'
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage ('Docker version') {
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