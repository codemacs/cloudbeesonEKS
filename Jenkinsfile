def NOTIFY_EMAIL = 'anassiry@salesforce.com'

pipeline {
 agent any

 tools {
  maven 'Maven3.6.0'
  jdk 'Java8u191'
 }
 
 options {
  timeout(time: 2, unit: 'HOURS')
  disableConcurrentBuilds()
 }

 parameters {
  string(name: 'credentialId', defaultValue: 'github', description:'github write access')
 }

 stages {
        
    stage ('Initialize') {
      steps {
         sh '''
         echo "PATH = ${PATH}"
         echo "M2_HOME = ${M2_HOME}"
         java -version 
         ''' 
       }
     }
     
   stage('Package'){
      steps{
         sh "mvn test"
      }
   }
  
   stage('Junit'){
      steps{
         sh 'java -version'
      }
   }
  
 } //stages


} //pipeline
