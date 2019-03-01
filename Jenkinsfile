def NOTIFY_EMAIL = 'hmnassiry@gmail.com'
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
  timestamps()
  disableConcurrentBuilds()
 }

 parameters {
  string(name: 'credentialId', defaultValue: 'hmnassiry_github', description:'github write access')
 }

 stages {
   
     stage('Compile'){
      steps{
         sh 'mvn -B -DskipTests clean compile'
      }
     }
     
     stage('Junit'){
      steps{
         sh 'mvn test'
      }
     }
     
     stage('Package'){
      steps{
             git url: 'https://github.com/hmnassiry/simple-java-maven-app.git'
             withMaven(maven: 'mvn3.5.4') {
                  sh "mvn package"
             }
       }
     }
  
 } //stages

post {  
  failure {
      script {
        withCredentials([usernamePassword(credentialsId: 'hmnassiry_github', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
        def fail_resp =["curl", "-s", "-X", "POST", "-H", "client_id", "${USERNAME}", "client_secret", "${PASSWORD}", "-d", "{\"state\": \"failure\",\"context\": \"Build Status\"}", "https://api.github.com/repos/hmnassiry/simple-java-maven-app/statuses/$GIT_COMMIT"].execute().text
        print(fail_resp)
       } //credentials
      } //script
      mail to: "${NOTIFY_EMAIL}", subject: "Failed Pipeline: ${currentBuild.fullDisplayName}", body: "This build failed: ${env.BUILD_URL}"
  } //failure
  
  success {
      script {
        def success_resp = ["curl", "-v", "-X", "POST", "-H", "Authorization: token 86964332839141ab1ccf6571d24fb1d5cc0081f6", "-d", "{\"state\": \"success\", \"context\": \"Build Status\"}", "https://api.github.com/repos/hmnassiry/simple-java-maven-app/statuses/$GIT_COMMIT"].execute().text
        print(success_resp)
      } //script
      cleanWs cleanWhenSuccess: true, deleteDirs: true
   } //success
  
  
 } //post
} //pipeline
