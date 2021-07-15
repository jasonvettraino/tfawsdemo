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
                withCredentials([usernamePassword(credentialsId: 'AWS_Credentials', usernameVariable: 'ACCESSKEY', passwordVariable: 'SECRETKEY')]) {
                // available as an env variable, but will be masked if you try to print it out any which way
                // note: single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want
                    sh 'echo $SECRETKEY'
                // also available as a Groovy variable
                    echo ACCESSKEY
                // or inside double quotes for string interpolation
                    echo "Access Key ID is $ACCESSKEY"
                }
            }
        }
        stage('Terraform Init') {
            steps {
                sh "terraform -chdir=tf init"
            }
        }
        stage('Terraform Plan') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'AWS_Credentials', usernameVariable: 'ACCESSKEY', passwordVariable: 'SECRETKEY')]) {
                    sh 'echo $SECRETKEY'
                    sh "terraform -chdir=tf plan -var 'aws_access_key=$ACCESSKEY' -var 'aws_secret_key=$SECRETKEY' -out=tf.plan "
                }
            }
        }
        stage ('Terraform Apply') {
            steps {
                sh "terraform -chdir=tf apply tf.plan"
            }
        }
        stage ('Terraform Destroy') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'AWS_Credentials', usernameVariable: 'ACCESSKEY', passwordVariable: 'SECRETKEY')]) {
                    sh "terraform -chdir=tf destroy -var 'aws_access_key=$ACCESSKEY' -var 'aws_secret_key=$SECRETKEY' "
                }
            }
        }
    }
}
