pipeline {
    agent {
        label 'master'
    }
    tools{
        jdk 'jdk8'
        maven 'maven'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building'
            }
        }
        stage('Test') {
            steps {
                echo 'mvn sonar:sonar'
            }
        }
        stage('Deploy - Staging') {
            steps {
                sh 'chmod 777 ./jenkins-run.sh'
                sh './jenkins-run.sh'
            }
        }
        stage('Sanity check') {
            steps {
                input "El entorno de la puesta en escena se ve bien"
            }
        }
        stage('Deploy - Production') {
            steps {
                echo 'mvn deploy'
            }
        }
    }
    post {
        always {
            echo 'De una forma u otra he terminado'
            deleteDir() /* clean up our workspace */
        }
        success {
            echo 'I succeeeded!'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Las cosas eran diferentes antes ...'
        }
    }
}