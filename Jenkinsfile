pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t my-nginx-app .'
        sh 'docker tag my-nginx-app $DOCKER_NGINX_IMAGE'
      }
    }
    stage('Test') {
      steps {
        
      }
    }
    stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
          sh 'docker push $DOCKER_NGINX_IMAGE'
        }
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
