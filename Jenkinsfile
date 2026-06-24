pipeline {
    agent any

    stages {
        stage('Environment Check') {
            steps {
                echo 'Checking software environments...'
                sh 'ruby -v'
                sh 'node -v'
                sh 'java -version'
            }
        }
        stage('Mock Build') {
            steps {
                echo 'Repository clone successful. Ready for configuration!'
            }
        }
    }
}
