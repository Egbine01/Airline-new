pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Package') {
            steps {
                script {
                    // Add commands to build and package your project
                    bat 'mvn clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Add commands to build a Docker image
                    bat 'docker build -t airline-system:1.0 .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Add commands to push the Docker image to a registry
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'JenDoc', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
                        bat 'docker login -u %DOCKER_USERNAME% -p %DOCKER_PASSWORD%'
                        bat 'docker push airline-system:1.0'
                    }
                }
            }
        }
    }
}
