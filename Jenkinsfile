pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops-practice"
        CONTAINER_NAME = "devops-practice-container"
        APP_PORT = "8000" 
        HOST_PORT = "8000"
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
                docker rm -f %CONTAINER_NAME% 2>NUL
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
