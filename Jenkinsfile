pipeline {
    agent any
    
    environment {
        GIT_REPO = "https://github.com/jasonvettraino/tfawsdemo"
    }

    stages {
        stage('Prep') {
            steps {
                sh "ls"
                sh "terraform version"
            }
        }
        stage('Terraform Init') {
            steps {
                sh "touch main.tf"
                sh "terraform init"
            }
        }
        stage ('Terraform Apply') {
            steps {
                sh "terraform apply -auto-approve"
            }
        }
    }
}
