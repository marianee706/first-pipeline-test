pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building the application...'
      }
    }
    stage('Test') {
      steps {
        echo 'Running tests...'
      }
    }
    stage('Package') {
      steps {
        sh 'zip -r my-app.zip .'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying the application...'
      }
    }
  }
}