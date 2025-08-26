pipeline {
  // Task 2, Exercise: เพิ่ม parameters สำหรับเลือก environment
  parameters {
    booleanParam(name: 'RUN_DEPLOY', defaultValue: true, description: 'Should we deploy?')
    string(name: 'ENVIRONMENT', defaultValue: 'dev', description: 'Select the target environment (dev, staging, prod)')
  }
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building application...'
      }
    }

    // Task 1, Exercise: Parallel stages เพื่อจำลองการทดสอบบนระบบต่างๆ
    stage('Test in Parallel') {
      parallel {
        stage('Unit Tests') {
          // Exercise: Unit Tests runs only if Build succeeds.
          // Note: ใน Declarative Pipeline stage จะไม่รันหาก stage ก่อนหน้าล้มเหลวอยู่แล้ว
          // ดังนั้น condition นี้จะถูกทำโดยอัตโนมัติ
          steps {
            echo 'Running unit tests...'
            sh 'sleep 5'
          }
        }
        stage('Integration Tests') {
          steps {
            echo 'Running integration tests...'
            sh 'sleep 5'
          }
        }
        // Exercise: เพิ่มการจำลองการทดสอบบน OS ที่ต่างกัน
        stage('Simulate Linux Test') {
          steps {
            echo 'Simulating tests on Linux...'
          }
        }
        stage('Simulate Windows Test') {
          steps {
            echo 'Simulating tests on Windows...'
          }
        }
      }
    }
    
    // Task 3: สร้างและจัดเก็บ Artifacts
    stage('Archive') {
      steps {
        echo 'Creating and archiving artifacts...'
        sh 'echo "All tests passed!" > results.txt'
        archiveArtifacts artifacts: 'results.txt', fingerprint: true
      }
    }

    // Task 4: เพิ่มขั้นตอนการอนุมัติด้วยมือ
    // Exercise: เพิ่ม timeout สำหรับ approval stage (ข้อที่คุณถาม)
    stage('Approval for Deployment') {
      // Exercise: Deploy runs only after manual approval
      // Note: ขั้นตอนนี้จะถูก skipped หาก RUN_DEPLOY เป็น false
      when {
        expression { return params.RUN_DEPLOY }
      }
      steps {
        timeout(time: 2, unit: 'MINUTES') {
          input message: "Do you want to proceed with deployment to ${params.ENVIRONMENT}?"
        }
      }
    }

    // Task 2: Stage การ Deploy ที่ใช้ Parameter และ Conditional Logic
    stage('Deploy') {
      // Exercise: Deploy runs only after manual approval
      // Note: การกำหนด "when" ใน stage นี้จะซ้ำซ้อนกับ stage "Approval"
      // แต่เราจะเก็บไว้เพื่อแสดงให้เห็นการใช้ conditional logic
      when {
        expression { return params.RUN_DEPLOY }
      }
      steps {
        echo "Deploying application to the ${params.ENVIRONMENT} environment..."
        sh 'sleep 5' // Simulate deployment
      }
    }
  }

  // Task 5: เพิ่ม post conditions
  post {
    always {
      echo 'Pipeline completed (success or failure).'
    }
    success {
      echo '✅ Pipeline finished successfully!'
    }
    failure {
      echo '❌ Pipeline failed. Check logs!'
    }
  }
}
