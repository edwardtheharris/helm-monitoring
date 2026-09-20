parallel {

  stages {
    stage('prometheus') {
      echo("Build, test and deploy Prometheus.")
      build("helm/monitoring/prometheus")
    }
        stage('Test') {
                echo 'Testing..'
        }
        stage('Deploy') {
                echo 'Deploying....'
        }
    }
  }
