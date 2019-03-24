def NOTIFY_EMAIL = 'anassiry@salesforce.com'

pipeline {
 agent any
 
 options {
  timeout(time: 2, unit: 'HOURS')
  disableConcurrentBuilds()
 }
 
 tools {	
  maven 'Maven3.6.0'	
  jdk 'JDK8202'	
 }

 parameters {
  string(name: 'credentialId', defaultValue: 'github', description:'github write access')
 }

 stages {
        
    stage ('Initialize') {
      steps {
         sh '''
         which java
         java -version
         ''' 
       }
     }
     
   stage('Package'){
      steps{
         sh "mvn test"
      }
   }
  
  stage('Install Dependencies') {
   steps {
      sh 'npm run lint'
      sleep 200
   }
  }
  
 } //stages
} //pipeline
