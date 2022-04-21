pipeline {
    agent any

    stages {
        stage('Initializing Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Planning Terraform') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Applying Terraform') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}