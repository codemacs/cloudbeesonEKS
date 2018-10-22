def NOTIFY_EMAIL = 'hmnassiry@gmail.com'
node {
 checkout scm
 sh 'git clean -Xdf'
}

pipeline {
 agent any
 tools {
  maven 'mvn3.5.4'
 }

 options {
  timeout(time: 2, unit: 'HOURS')
  timestamps()
  disableConcurrentBuilds()
 }

 parameters {
  string(name: 'credentialId', defaultValue: 'hmnassiry_github')
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
         sh 'mvm package'
      }
     }
  
 } //stages

post {
  always {
   publishHTML([allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: '\\target\\surefire-reports\\', reportFiles: 'emailable-report.html', reportName: 'Sanity report', reportTitles: ''])
   emailext mimeType: 'text/html', body: 'Here is your Kumonium Report for build: $BUILD_URL ${FILE,path="myKumProj/target/surefire-reports/emailable-report.html"}', subject: 'Kumonium Report for Build # $BUILD_NUMBER - $JOB_NAME', to: 'anassiry@salesforce.com'
   publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
  }
  
  failure {
      script {
        withCredentials([usernamePassword(credentialsId: 'hmnassiry_github', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
        def fail_resp =["curl", "-s", "-X", "POST", "-H", "authorization: Bearer ${PASSWORD}", "-d", "{\"state\": \"failure\",\"context\": \"Build Status\"}", "https://github.com/api/v3/repos/hmnassiry/simple-java-maven-app/statuses/$GIT_COMMIT"].execute().text
        print(fail_resp)
       } //credentials
      } //script
      mail to: "${NOTIFY_EMAIL}", subject: "Failed Pipeline: ${currentBuild.fullDisplayName}", body: "This build failed: ${env.BUILD_URL}"
  } //failure
  
  success {
      script {
        withCredentials([usernamePassword(credentialsId: 'hmnassiry_github', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
        def success_resp = ["curl", "-s", "-X", "POST", "-H", "authorization: Bearer ${PASSWORD}", "-d", "{\"state\": \"success\", \"context\": \"Build Status\"}", "https://github.com/api/v3/repos/hmnassiry/simple-java-maven-app/statuses/$GIT_COMMIT"].execute().text
        print(success_resp)
       } //credentials
      } //script
      cleanWs cleanWhenSuccess: true, deleteDirs: true
   } //success
  
  
 } //post
} //pipeline
