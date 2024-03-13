pipeline {
  agent any

  environment {
    NGINX_IMAGE = 'my-nginx-app'
    NGINX_DOCKERFILE_PATH = './Dockerfile'
    NGINX_PORT = '80'
    NGINX_CONTAINER_NAME = 'my-nginx-container'
    NGINX_CONF_PATH = 'path/to/nginx/conf'
    NGINX_HTML_PATH = 'path/to/html'
    DOCKER_REGISTRY_CREDS = 'dockerhub'
  }

  stages {
    stage('Build') {
      steps {
        sh "docker build -t $NGINX_IMAGE -f $NGINX_DOCKERFILE_PATH ."
      }
    }
    stage('Test') {
      steps {
        // You can add test steps here if necessary
        // Example: sh 'docker run ...'
      }
    }
    stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
          sh "docker run -d -p $NGINX_PORT:80 --name $NGINX_CONTAINER_NAME -v $NGINX_CONF_PATH:/etc/nginx/conf.d -v $NGINX_HTML_PATH:/usr/share/nginx/html $NGINX_IMAGE"
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
