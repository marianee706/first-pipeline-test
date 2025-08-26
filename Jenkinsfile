// Jenkinsfile ที่สมบูรณ์และมี Post block
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
        echo 'Creating package...'
        // คำสั่ง zip -r my-app.zip . จะบีบอัดไฟล์ทั้งหมดใน directory ปัจจุบัน
        sh 'zip -r my-app.zip .'
        // แสดงไฟล์ใน workspace เพื่อให้เห็นว่า my-app.zip ถูกสร้างขึ้น
        sh 'ls -l'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying the application...'
      }
    }
  }
  // บล็อก post เพื่อจัดการการแจ้งเตือนหลังจาก Pipeline จบ
  post {
    // บล็อกนี้จะทำงานเสมอ ไม่ว่า Pipeline จะสำเร็จหรือล้มเหลว
    always {
      echo 'This will always run after the pipeline finishes.'
    }
    // บล็อกนี้จะทำงานเฉพาะเมื่อ Pipeline สำเร็จ
    success {
      echo 'Pipeline completed successfully 🎉'
    }
    // บล็อกนี้จะทำงานเฉพาะเมื่อ Pipeline ล้มเหลว
    failure {
      echo 'Pipeline failed ❌'
    }
    // ทางเลือก: ใช้ cleanup เพื่อลบไฟล์ที่สร้างขึ้นหลัง Pipeline จบ
    // cleanup {
    //   echo 'Cleaning up generated files...'
    //   sh 'rm -f my-app.zip'
    // }
  }
}
