pipeline {
    agent any

    stages {
        stage('Build') {
    steps {
        git branch: 'main', url: 'https://github.com/marianee706/first-pipeline-test.git'
        bat "npm install"
    }
}

        stage('Scan') {
            steps {
                withSonarQubeEnv(installationName: 'sq1') {
                    bat "npm install sonar-scanner"
                    bat 'npx sonar-scanner -X -X -Dsonar.projectKey=mywebapp'
                }
            }
        }
    }
}