pipeline {
    agent any
    
    environment {
        GIT_REPO = "https://github.com/jasonvettraino/tfawsdemo"
    }

    stages {
        stage('Prep') {
            steps {
                sh "cd tf"
                sh "ls"
                sh "terraform version"
            }
        }
        stage('Terraform Init') {
            steps {
                sh "terraform init"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "terraform plan"
            }
        }
        stage ('Terraform Apply') {
            steps {
                sh "terraform apply -auto-approve"
            }
        }
    }
}
