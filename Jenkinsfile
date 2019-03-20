def NOTIFY_EMAIL = 'anassiry@salesforce.com'

pipeline {
 agent any

 tools {
  maven 'Maven3.6.0'
  jdk 'Java8u161'
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
         which java
         /home/jenkins/tools/hudson.model.JDK/Java8u191/bin/java -version 
         ''' 
       }
     }
     
   stage('Package'){
      steps{
         sh "mvn test"
      }
   }
  
  
 } //stages


} //pipeline
