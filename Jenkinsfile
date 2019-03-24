def NOTIFY_EMAIL = 'anassiry@salesforce.com'

pipeline {
 agent {
    kubernetes {
      label 'CD-Team-Test'
      defaultContainer 'jnlp'
      yamlFile 'KubernetesPod.yaml'
    }
 }
 
 tools {	
  maven 'CJOC-Maven3.6.0'	
  jdk 'CJOC-JDK8202'	
 }

options {
  timeout(time: 2, unit: 'HOURS')
  disableConcurrentBuilds()
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
  
  stage('Test Python2') {
   steps {
      sh '''
        python --version
      '''
   }
  }
    
  stage('Test Python3') {
   steps {
      sh '''
        python3 --version
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
  
   stage('Test perl') {
   steps {
      sh '''
        perl -v
      '''
    }
  }
    
  stage('Test gcc') {
   steps {
      sh '''
        gcc -v
      '''
    }
  }
   
   } //parallel
  } //Test
  
  stage('Test 2') {
   parallel {
    
    stage('Test sfdx') {
      steps {
        container('sfdx') {
          sh 'sfdx --version'
        } //container
       } //steps
     } //stage
     
     stage('Test ruby') {
      steps {
        container('ruby') {
          sh 'ruby -v'
        } //container
       } //steps
     } //stage
    
    stage('Test jmeter') {
      steps {
          sh '/opt/jmeter/bin/jmeter -n -t my_test_plan.jmx -l log.jtl'
       } //steps
     } //stage
    
    stage('Test aws-cli') {
    steps {
      sh '''
        aws help
      '''
    }
  }
     
    } //parallel
   } //stage 
  
   stage('tree command') {
    steps {
      sh '''
        tree
      '''
      script {
        sleep 1
      } //script
     } //steps
   } //stage
  
 } //stages
} //pipeline
