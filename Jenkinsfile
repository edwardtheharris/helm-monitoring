stage('Build') {
    steps {
        echo('Building jobs')
        build(wait: false,
              job: '../kube-state-metrics')
    }
}
stage('Test') {
    steps {
        echo 'Testing..'
    }
}
stage('Deploy') {
    steps {
        echo 'Deploying....'
    }
}
