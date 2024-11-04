pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/sundar-k565/Wise_Trips.git'
        BRANCH = 'main'
        IMAGE_NAME = 'wise_trips'  // Replace with your preferred Docker image name
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out code from GitHub...'
                // Check out code from the specified repository and branch
                checkout([$class: 'GitSCM', branches: [[name: "${BRANCH}"]],
                          userRemoteConfigs: [[url: "${REPO_URL}"]]])
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    // Disable BuildKit for this build
                    sh "DOCKER_BUILDKIT=0 docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
