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
                sh 'docker build final_project:0.0.1 .'
            }
        }
    }
}