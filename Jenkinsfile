pipeline {
    agent any
    
    stages {
        stage('Code Checkout') {
            steps {
                git url: 'https://github.com/ArielB1215/Final_Project_CICD_GitOps.git', branch: 'main'
            }
        }
        // stage('Docker Login') {
        //     steps {
        //         withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
        //             sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
        //         }
        //     }
        // }

        // stage('Docker Build') {
        //     steps {
        //         sh 'export DOCKER_HOST=tcp://host.docker.internal:2375 && docker build -t arielbm5911/hangman_project:1.0 .'
        //     }
        // }
        
    //    stage('Docker Push'){
    //         steps{
    //             withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]){
    //                 sh '''
    //                 echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
    //                 docker push ${arielbm5911/hangman_project}:latest
    //                 '''
    //             }
    //         }
    //     }
        // stage('Docker Run') {
        //     steps {
        //         sh 'export DOCKER_HOST=tcp://host.docker.internal:2375 && docker run -it arielbm5911/hangman_project:1.0'
        //     }
        // }
    }
}