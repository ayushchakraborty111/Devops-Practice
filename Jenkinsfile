pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops-practice"
        CONTAINER_NAME = "devops-practice-container"
        APP_PORT = "8081" 
        HOST_PORT = "8081"
    }

    stages {
        stage('Clone Repo') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                bat """
                docker --version
                docker build -t %IMAGE_NAME% .
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                bat """
                docker stop %CONTAINER_NAME% || exit 0
                docker rm %CONTAINER_NAME% || exit 0
                docker run -d -p %HOST_PORT%:%APP_PORT% --name %CONTAINER_NAME% %IMAGE_NAME%
                """
            }
        }
    }

    post {
        success {
            echo "Docker image built and container running locally"
        }
        failure {
            echo "Build failed. Check Dockerfile and logs."
        }
    }
}
