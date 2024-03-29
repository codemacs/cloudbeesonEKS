pipeline {
 agent {
  kubernetes {
   label 'CD-Team'
   defaultContainer 'jnlp'
   yamlFile 'KubernetesPod.yaml'
  }
 }

 options {
  timeout(time: 2, unit: 'HOURS')
  disableConcurrentBuilds()
 }

 parameters {
  string(name: 'SFOrgCredentials', defaultValue: 'DevHubOrg')
 }
 
 stages {
  
  stage('Java') {
     steps {
      sh '''
      which java
      java -version 
      pwd
      '''
     }
  } //stage
  
  stage('CD Team Docker Image') {
   parallel {
    
    stage('Git') {
     steps {
      sh 'git --version'
     } //steps
    } //stage
    
    stage('Maven') {
     steps {
      sh 'mvn --version'
      sh 'pwd'
     }
    }
    
    stage('Salesforce Ant') {
     when {
      expression {
       false
      }
     }
     steps {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: params.SFOrgCredentials, usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
         sh 'which ant'
         sh 'ant -verbose -Dsf.username=${USERNAME} -Dsf.password=${PASSWORD} -Dsf.serverurl=https://itdevhub.lightning.force.com -Ddev.directory=src -Dsf.maxPoll=1000 deployCheckOnly'
      }

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
         sh '''
         sfdx --version
         which sfdx
         '''
     }
    } 
    
   stage('Jmeter') {
     steps {
      sh 'jmeter -n -t my_test_plan.jmx -l log.jtl'
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
    
    stage('Heroku') {
     steps {
      sh '''
      heroku --version
      which heroku
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
      sleep 1
      '''
     }
  }

 } //stages
} //pipeline
