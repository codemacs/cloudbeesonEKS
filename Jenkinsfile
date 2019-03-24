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
        
  stage ('Test') {
   parallel {
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
  
  stage('Test Git') {
   steps {
      sh '''
        git clone git@github.com:forcedotcom/sfdx-core.git
      '''
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
   }
  }
  
  stage('Test Python') {
   steps {
      sh '''
        python --version
      '''
   }
  }
    
  stage('Test Selenium') {
   steps {
      sh '''
        pip freeze
        selenium
      '''
      script {
        sleep 1
      }
   }
  }
  
   } //parallel
  } //Test
 } //stages
} //pipeline
