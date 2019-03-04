def NOTIFY_EMAIL = 'anassiry@salesforce.com'

pipeline {
 agent any

 tools {
  maven 'Maven3.6.0'
  jdk 'Java8u201'
 }
 
 options {
  timeout(time: 2, unit: 'HOURS')
  disableConcurrentBuilds()
 }

 parameters {
  string(name: 'credentialId', defaultValue: 'anassiry_github', description:'github write access')
 }

 stages {
   
     stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
            }
        }
     
     stage('Junit'){
      steps{
         sh 'mvn test'
      }
     }
     
     stage('Package'){
      steps{
             git url: 'https://github.com/McCheeseJava/simple-java-maven-app.git'
             withMaven(maven: 'Maven 3.6.0') {
                  sh "mvn test"
             }
       }
     }
  
 } //stages


} //pipeline
