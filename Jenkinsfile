pipeline {
    agent any 

    environment {
        REGISTRY_URL = 'localhost:5000'
        IMAGE_NAME = 'ansible_admin/ci-app'
        # REGISTRY_CREDENTIALS = credentials('docker-registry-login') 
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/andreademarco/formazione_cm.git'
            }
        }

        stage('Determine Version') {
            steps {
                script {
                    // Ottiene il numero di build corrente di Jenkins per il tag progressivo
                    def buildNumber = env.BUILD_NUMBER
                    env.IMAGE_TAG = "v1.0.${buildNumber}"
                    echo "Building new image with tag: ${env.IMAGE_TAG}"
                }
            }
        }

        stage('Build Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -f Dockerfile.debian ."
                    sh "docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${REGISTRY_URL}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Push to Registry') {
            steps {
                script {

                    echo "Pushing ${IMAGE_NAME}:${IMAGE_TAG} to ${REGISTRY_URL}"
                    sh "docker push ${REGISTRY_URL}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
        
        stage('Ansible Deploy (Placeholder)') {
            steps {
                echo "Ansible deploy step will be implemented next. It will use the generated image: ${REGISTRY_URL}/${IMAGE_NAME}:${IMAGE_TAG}"
                
            }
        }
    }
}
