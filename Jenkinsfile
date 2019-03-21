def NOTIFY_EMAIL = 'anassiry@salesforce.com'

pipeline {
 agent any

 tools {
  maven 'Maven3.3.9'
  jdk 'Java8u181'
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
         /home/jenkins/tools/hudson.model.JDK/Java8u181/bin/java -version
         sleep 200
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
