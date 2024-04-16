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
        script
        {
        sh 'mvn clean package -DskipTests'
        }

     }
    }

    stage('Build Image')
    {
        steps{

        sh "docker build -t=nmalik1986/selenium ."

    }
    }
    stage('Push Image')
        {
        steps{
         script{
            sh "docker push nmalik1986/selenium"
                }
     }

    }

}
}