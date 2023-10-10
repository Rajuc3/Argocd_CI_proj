pipeline{
    agent any
    environment{
        DOCKERHUB_USERNAME="rajuc26"
        APP_NAME="argocd_ci"
        IMAGE_TAG="${BUILD_NUMBER}"
        IMAGE_NAME="${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
        REGISTRY_CREDS="dockerhub"
    }
    stages{
        stage("clean-up workspace"){
            steps{
                script{
                    cleanWs()
                }
            }
        }
        stage("checkout SCM"){
            steps{
                script{
                    git credentialsId: 'github',
                    url: 'https://github.com/Rajuc3/Argocd_CI_proj.git',
                    branch: 'master'
                }
            }
        }
        stage("Build docker image"){
            steps{
                script{
                    docker_image=docker.build"${IMAGE_NAME}"
                }
            }
        }
        stage("Push docker image"){
            steps{
                script{
                    docker.withRegistry('',REGISTRY_CREDS){
                    docker_image.push("$BUILD_NUMBER")
                    docker_image.push('latest')
                    }
                }
            }
        }
        stage("Delete docker image"){
            steps{
                script{
                    sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "docker rmi ${IMAGE_NAME}:latest"
                }
            }
        }
        stage("Updating the eks file"){
            steps{
                script{
                    sh """
                     cat eks.py
                     sed -i 's/${APP_NAME}.*/${APP_NAME}:${IMAGE_TAG}/g' deployment.yml
                     cat eks.py
                    """
                }
            }
        }
        stage("Push the updated deployment yaml file to Github"){
            steps{
                script{
                    sh """
                      git config --global user.name "Rajuc3"
                      git config --global user.email "raju.cheviti26@gmail.com"
                      git add eks.py
                      git commit -m "adding the eks file"

                    """
                    withCredentials([gitUsernamePassword(credentialsId: 'github', gitToolName: 'Default')]) {
                    sh "git push https://github.com/Rajuc3/Argocd_CI_proj.git master"    
}
                }
            }
        }
    }
}