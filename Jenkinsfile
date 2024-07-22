pipeline {
    agent any
    stages {
        stage('Data validation') {
            steps {
                script{
                    checkout scm
                }
                echo 'Starting to build data_validation image'
                /*script {
                    def customImage = docker.build("my-image:${env.BUILD_ID}")
                    customImage.push()
                }*/
                sh 'docker build -t data-validation ./data-validation'
                echo 'Finished build data-validation image'
            }
        }
    }
}
