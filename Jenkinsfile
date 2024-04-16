pipeline{

    agent any
    tools{
    maven 'maven3'
    jdk 'jdk21'
    }

    stages{
    stage('Build Jar')
    {
        steps{

        bat 'cd E:\schinna\DemoProject\jenkins-ci-cd\volumes\node\workspace\SELENIUM_DOCKER_BUILDER'
        bat 'mvn clean package -DskipTests'


        }
    }

    stage('Build Image')
    {
        steps{

        bat 'docker build -t=nmalik1986/selenium .'

    }
    }
    stage('Push Image')
        {
        steps{
         script{
            bat 'docker push nmalik1986/selenium'
                }
     }

    }

}
}