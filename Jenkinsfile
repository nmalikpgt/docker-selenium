pipeline{

    agent any

    stages{
    stage('Build Jar')
    {
        steps{
        script {
        sh "mvn clean package -DskipTests"
        }
        }
    }

    stage('Build Image')
    {
        steps{
        script
        {
        sh "docker build -t=nmalik1986/selenium ."
        }
        }
    }
    stage('Push Image')
        {
            steps{

            sh "docker push nmalik1986/selenium"

          }
        }

    }

}