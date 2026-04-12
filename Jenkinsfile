pipeline {
    agent any
   
    environment {
        AWS_DEFAULT_REGION = 'us-west-2'
        TF_IN_AUTOMATION   = 'true'
        SNYK_ORG           = credentials('snyk-org-slug')
    }

    stages {

        stage('Verify AWS Identity') {
            steps {
                sh '''
                echo "Verifying IAM Role authentication..."
                aws sts get-caller-identity
                '''
            }
        }
        stage('Snyk IaC Scan Test') {
            steps {
                withCredentials([string(credentialsId: 'snyk-api-token-string', variable: 'SNYK_TOKEN')]) {
                    sh '''
                        export PATH=$PATH:/var/lib/jenkins/tools/io.snyk.jenkins.tools.SnykInstallation/snyk
                        snyk-linux auth $SNYK_TOKEN
                        snyk-linux iac test --org=$SNYK_ORG --severity-threshold=high || true
                    '''
                }
            }
        } 
        
         stage('Snyk IaC Scan Monitor') {
            steps {
                snykSecurity(
                    snykInstallation: 'snyk',
                    snykTokenId: 'snyk-api-token',
                    additionalArguments: '--iac --report --org=$SNYK_ORG --severity-threshold=high',
                    failOnIssues: true,
                    monitorProjectOnBuild: false
                )
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/cquaye/AAron_McDonald_jenkins-s3-test'
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan Terraform') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply Terraform') {
            steps {
                input message: "Approve Terraform Apply?", ok: "Deploy"
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Destroy Terraform') {
            steps {
                input message: " Confirm DESTROY of all resources?", ok: "Destroy"
                sh 'terraform destroy -auto-approve'
            }
        }
    }
    
    post {
        success {
            echo 'Terraform process completed successfully!'
        }
        failure {
            echo 'Terraform process failed!'
        }
    }
}