pipeline{
    agent any
    environment{
        DOCKERHUB_USERNAME="raju26"
        APP_NAME="Argocd_CI"
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
    }
}