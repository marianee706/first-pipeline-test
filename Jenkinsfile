pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // เปลี่ยน git branch เป็น main
                git branch: 'main', url: 'https://github.com/marianee706/first-pipeline-test.git'
                // เปลี่ยน bat เป็น sh เพื่อรันบน Linux
                sh "npm install" 
            }
        }

        stage('Scan') {
            steps {
                withSonarQubeEnv(installationName: 'sq1') {
                    // เปลี่ยน bat เป็น sh เพื่อรันบน Linux
                    sh "npm install sonar-scanner"
                    sh 'npx sonar-scanner -X -X -Dsonar.projectKey=mywebapp'
                }
            }
        }
    }
}