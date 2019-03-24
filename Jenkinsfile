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
         sh "mvn --version"
      }
   }
  
  stage('Test Node') {
   steps {
      sh 'node -v'
   }
  }
  
  stage('Test jq') {
   steps {
      sh '''
        curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0]'
      '''
   }
  }
  
  stage('Test tree') {
   steps {
      sh '''
        tree
      '''
      script {
        sleep 1
      }
   }
  }
  
 } //stages
} //pipeline
