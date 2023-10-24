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
                    sh "cd /home/luisrestrepo/Documentos/CrudNodeJs"
                    sh "json-server --watch users.json"
                }
        	post{
                    always{
                        publishHTML([allowMissing: false,
                        alwaysLinkToLastBuild: false,
                        keepAll: false,
                        reportDir: 'target/site/serenity',
                        reportFiles: 'index.html',
                        reportName: 'Test Result Report',
                        useWrapperFileDirectly: true])
                    }
            }
            }
        }
}