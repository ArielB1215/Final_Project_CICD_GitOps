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
                sh 'export DOCKER_HOST=tcp://host.docker.internal:2375 && docker build -t final_project .'
            }
        }
        stage('Trivy Image Scan')
        {
            steps {
                sh 'export DOCKER_HOST=tcp://host.docker.internal:2375 && trivy image --severity CRITICAL final_project'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'export DOCKER_HOST=tcp://host.docker.internal:2375 && docker rm -f final_project || true && docker run -d --name final_project final_project && sleep 5 && docker stop final_project'
            }
        }
        
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }
        stage('Docker Tag & Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    export DOCKER_HOST=tcp://host.docker.internal:2375 && docker tag final_project arielbm5911/finalproject:latest
                    export DOCKER_HOST=tcp://host.docker.internal:2375 && docker push arielbm5911/finalproject:latest
                    '''
                }
            }
        }

        stage('k8s deployment') {
            steps {
                sh '''
                export KUBECONFIG=$HOME/.kube/config
                kubectl get nodes
                kubectl apply -f ./k8s/deployment.yaml
                kubectl get deployments
                '''
            }
        }
        stage('k8s service deployment') {
            steps {
                sh '''
                export KUBECONFIG=$HOME/.kube/config
                kubectl apply -f ./k8s/service.yaml
                kubectl get svc
                hostname -I
                sleep 60
                '''
            }
        }
    }
}