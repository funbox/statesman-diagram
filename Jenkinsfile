/* https://jenkins.io/doc/book/pipeline/syntax/ */

pipeline {
    agent any

    stages {
        stage('Setup') {
            steps {
                sh '''
                    ruby -v
                    gem -v

                    gem install bundler
                    bundle
                '''
            }
        }

        stage('Test') {
            parallel {
                stage('RSpec') {
                    steps {
                        sh 'bundle exec rake --trace'
                    }
                }

                stage('RuboCop') {
                    steps {
                        sh 'bundle exec rubocop --format=json --out=rubocop-result.json'
                    }
                }
            }
        }

        stage('SonarQube analysis') {
            steps {
                script {
                    def scannerHome = tool 'latest';
                    withSonarQubeEnv('funbox') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
    }
}
