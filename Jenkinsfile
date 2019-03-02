def NOTIFY_EMAIL = 'anassiry@salesforce.com'
node {
 checkout scm
 sh 'git clean -Xdf'
}

pipeline {
 agent any
 tools {
  maven 'Maven 3.6.0'
  jdk 'Java 8u202'
 }

 options {
  timeout(time: 2, unit: 'HOURS')
  disableConcurrentBuilds()
 }

 parameters {
  string(name: 'credentialId', defaultValue: 'anassiry_github', description:'github write access')
 }

 stages {
   
     stage('Compile'){
      steps{
         //sh 'mvn -B -DskipTests clean compile'
         sh '${jdk}/bin/java -version'
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
                  sh "mvn package"
             }
       }
     }
  
 } //stages


} //pipeline
