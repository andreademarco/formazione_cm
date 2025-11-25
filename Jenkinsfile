pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:/opt/homebrew/bin:$PATH"
        
        REGISTRY_URL = 'localhost:5000'
        IMAGE_NAME = 'ansible_admin/ci-app'
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
                    def buildNumber = env.BUILD_NUMBER
                    env.IMAGE_TAG = "v1.0.${buildNumber}"
                    echo "Building new image with tag: ${env.IMAGE_TAG}"
                }
            }
        }

        stage('Build Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -f Dockerfile.debian --build-arg PUBLIC_KEY='dummy_key' --build-arg PASSWORD='dummy_pass' ."
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
                echo "Ansible deploy step will be implemented next. It will use: ${REGISTRY_URL}/${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
    }
}
