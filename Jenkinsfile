pipeline {
    agent any
    tools {
            maven 'MAVEN 3.9.4'
            jdk 'JDK 17.0.8.0.7'
        }
        stages {
            stage('Test') {
                steps {
                    sh "mvn clean verify"
                }
        	post{
                    always{
                        publishHTML([allowMissing: false,
                        alwaysLinkToLastBuild: false,
                        keepAll: false,
                        reportDir: 'target/karate-reports/',
                        reportFiles: 'karate-summary.html',
                        reportName: 'Test Result Report',
                        useWrapperFileDirectly: true])
                    }
            }
            }
        }
}