pipeline {
    agent any
    
    environment {
        GIT_REPO = "https://github.com/jasonvettraino/tfawsdemo"
    }

    stages {
        stage('Prep') {
            steps {
                sh "ls"
                sh '''
                    curl -o tf.zip https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_arm64.zip ; yes | unzip tf.zip
                        ./terraform version
                '''
            }
        }
        stage('Terraform Init') {
            steps {
                sh "touch main.tf"
                sh "./terraform init"
            }
        }
        stage ('Terraform Apply') {
            steps {
                sh ".terraform apply -auto-approve"
            }
        }
    }
}
