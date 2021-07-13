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
                sh "terraform -chdir=tf init"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "terraform -chdir=tf plan"
            }
        }
        stage ('Terraform Apply') {
            steps {
                sh "terraform -chdir=tf apply -auto-approve"
            }
        }
    }
}
