def NOTIFY_EMAIL = 'anassiry@salesforce.com'

pipeline {
 agent any
 
 options {
  timeout(time: 2, unit: 'HOURS')
  disableConcurrentBuilds()
 }
 
 tools {	
  //maven 'Maven3.5.4'	
  jdk 'JDK8202'	
 }

 parameters {
  string(name: 'credentialId', defaultValue: 'github', description:'github write access')
 }

 stages {
        
    stage ('Test Java') {
      steps {
         sh '''
         which java
         java -version
         ''' 
       }
     }
     
   stage('Test Maven'){
      steps{
         sh "mvn test"
      }
   }
  
  stage('Test Node') {
   steps {
      sh 'node -v'
      script {
        sleep 200
      }
   }
  }
  
  stage('Test jq') {
   steps {
      sh 'jq'
      script {
        sleep 200
      }
   }
  }
  
 } //stages
} //pipeline
