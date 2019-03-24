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
  string(name: 'credentialId', defaultValue: 'github', description: 'github write access')
 }

 stages {

  stage('Test CJOC Tools') {
   parallel {
    stage('Java') {
     steps {
      sh '''
      which java
      java -version 
      '''
     }
    }

    stage('Maven') {
     steps {
      sh "mvn --version"
     }
    }

   } //parallel
  } //stage


  stage('Test CloudBees Base Agent Image') {
   parallel {
    stage('Git') {
     steps {
      sh '''
      git clone https://github.com/forcedotcom/cli.git
      '''
     }
    }

    stage('NodeJS') {
     steps {
      sh 'node -v'
     }
    }

    stage('JQ') {
     steps {
      sh '''
      curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0]'
      '''
     }
    }

    stage('Python2') {
     steps {
      sh '''
      python --version
      '''
     }
    }

    stage('Selenium') {
     steps {
      sh '''
      pip freeze
      '''
     }
    }

    stage('Perl') {
     steps {
      sh '''
      perl - v 
      '''
     }
    }

    stage('GCC') {
     steps {
      sh '''
      gcc -v 
      '''
     }
    }

    stage('aws-cli') {
     steps {
      sh '''
      aws help
      '''
     }
    }

   } //parallel
  } //Test

  stage('3rd party Docker Images') {
   parallel {

    stage('SFDX') {
     steps {
      container('sfdx') {
       sh 'sfdx --version'
      } //container
     } //steps
    } //stage

    stage('Ruby') {
     steps {
      container('ruby') {
       sh 'ruby -v'
      } //container
     } //steps
    } //stage

    stage('Jmeter') {
     steps {
      sh '/opt/jmeter/bin/jmeter -n -t my_test_plan.jmx -l log.jtl'
     } //steps
    } //stage

    stage('Python3') {
     steps {
      sh '''
      python3 --version
      '''
     }
    }

   } //parallel
  } //stage 

 } //stages
} //pipeline
