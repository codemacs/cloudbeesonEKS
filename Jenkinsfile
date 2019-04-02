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

 stages {
  stage('Test CJOC Tools') {
   parallel {
   
    stage('Java') {
     steps {
      sh '''
      which java
      java -version 
      pwd
      '''
     }
    }

    stage('Maven') {
     steps {
      sh "mvn --version"
      sh "pwd"
     }
    }

   } //parallel
  } //stage


  stage('Test CDTeam Base Agent Image') {
   parallel {
    
    stage('Salesforce Ant') {
     steps {
      sh 'ant -v'
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
      pwd
      '''
     }
    }

    stage('Python2') {
     steps {
      sh '''
      python --version
      pwd
      '''
     }
    }

    stage('Selenium') {
     steps {
      sh '''
      pip freeze
      pwd
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
      pwd
      '''
     }
    }

    stage('aws-cli') {
     steps {
      sh '''
      aws help
      pwd
      '''
     }
    }
    
     stage('SFDX') {
     steps {
      // sh 'npm install sfdx-cli --global'
      // sh 'sfdx plugins --core'
         sh 'sfdx --version'
      // sh 'sfdx update'
     //  sh 'sfdx --version'
       sh 'pwd'
       sh 'id'
     }
    } 
    
   stage('Jmeter') {
     steps {
      sh '/opt/jmeter/bin/jmeter -n -t my_test_plan.jmx -l log.jtl'
      sh 'pwd'
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
  } //Test

  stage('3rd party Docker Images') {
   parallel {
    stage('Ruby') {
     steps {
      container('ruby') {
       sh 'ruby -v'
       sh 'pwd'
      } //container
     } //steps
    } //stage

   } //parallel
  } //stage 
  
  stage('list contents of the workspace') {
   steps {
      sh '''
      tree 
      hostname
      pwd
      sleep 1000
      '''
     }
  }

 } //stages
} //pipeline
