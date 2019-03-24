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
        git clone https://github.com/forcedotcom/cli.git
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
      '''
   }
  }
    
  stage('Test aws-cli') {
   steps {
      sh '''
        aws help
      '''
      script {
        sleep 1
      }
    }
  }
  
   } //parallel
  } //Test
  
  stage('Test tree') {
   steps {
      sh '''
        tree
      '''
      script {
        sleep 100
      }
    }
  }
  
 } //stages
} //pipeline
