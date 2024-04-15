pipeline{

    agent any

    stages{
    stage('Build Jar')
    {
        steps{

        bat 'mvn clean package -DskipTests'

        }
    }
    stage('Build Image')
    {
        steps{

               bat "docker build -t=nmalik1986/selenium ."

        }
    }
    stage('Push Image')
        {
            steps{

            bat "docker push nmalik1986/selenium"

          }
        }

    }

}