pipeline{

    agent any
    tools{
    maven "maven3"
    jdk "jdk21"
    }

    stages{
    stage('Build Jar')
    {
        steps{
        script {
        bat "mvn clean package -DskipTests"
        }
        }
    }

    stage('Build Image')
    {
        steps{
        script
        {
        bat "docker build -t=nmalik1986/selenium ."
        }
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