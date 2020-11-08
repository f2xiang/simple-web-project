pipeline {
    agent any

    stages {
        stage('pull code') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/${branch}']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'daf655ca-f6fa-4a3d-bcb6-88cc0a1db748', url: 'https://github.com/f2xiang/simple-web-project.git']]])
            }
        }

        stage('maven build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('to tomcat') {
            steps {
                deploy adapters: [tomcat8(credentialsId: '286c4839-0f9d-4c15-b821-34b436714168', path: '', url: 'http://192.168.0.101:8088')], contextPath: null, war: 'target/*.war'
            }
        }
    }
}
