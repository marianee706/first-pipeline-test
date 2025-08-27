pipeline {
    agent any

    stages {
        stage('Clone and Prepare') {
            steps {
                // ขั้นตอนนี้สมมติว่าคุณมี Git Repository
                // ให้ใช้คำสั่ง Git เพื่อ clone repository ของคุณ
                git branch: 'master', url: 'https://github.com/jabedhasan21/java-hello-world-with-maven.git'
            }
        }
        
        stage('Maven Build & SonarQube Analysis') {
            steps {
                // รันคำสั่งทั้งหมดใน Docker Container เดียวกัน
                sh '''
                docker run --rm \
                  -v "$PWD:/usr/src/mymaven" \
                  -w /usr/src/mymaven maven:3.9.9 \
                  mvn clean verify sonar:sonar \
                  -Dsonar.projectKey=Myapp \
                  -Dsonar.projectName="Myapp" \
                  -Dsonar.host.url=http://172.17.0.3:9000 \
                  -Dsonar.token=sqa_875067b06ba40fae4116c3054a1708882d00b15c
                '''
            }
        }
    }
}