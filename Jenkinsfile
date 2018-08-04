/* https://jenkins.io/doc/book/pipeline/syntax/ */

pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh '''#!/bin/bash
                    source /var/jenkins_home/.rvm/scripts/rvm
                    rvm use 2.5.1
                    bundle
                    bundle exec rake --trace || true
                    bundle exec rubocop --format=json --out=rubocop-result.json || true
                '''

                script {
                    def scannerHome = tool 'latest';
                    withSonarQubeEnv('local') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
    }
}
