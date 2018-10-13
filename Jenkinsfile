pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                withMaven(maven: 'mvn3.2.2') {sh 'mvn -B -DskipTests clean package'}
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
