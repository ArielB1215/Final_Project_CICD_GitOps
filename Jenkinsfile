pipeline {
    agent any
    
    stages {
        stage('Code Checkout') {
            steps {
                git url: 'https://github.com/ArielB1215/Final_Project_CICD_GitOps.git', branch: 'main'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'export DOCKER_HOST=tcp://host.docker.internal:2375 && docker build -t final_project:0.0.1 .'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'export DOCKER_HOST=tcp://host.docker.internal:2375 && docker run -t final_project:0.0.1'
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }
    }
}