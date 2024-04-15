pipeline{

    agent any
    environment
    {
        NUMBER=100
    }
    stages{
    stage('stage-1')
    {
        steps{
        echo "NUMBER = ${NUMBER}"
        }
    }
    stage('stage-2')
    {
    environment{
    NUMBER=10
    }
        steps{
        echo "NUMBER = ${NUMBER}"
        }
    }
    stage('stage-3')
        {
            steps{
            echo "NUMBER = ${NUMBER}"
            }
        }

    }
    post()
    {
        always{
        echo "This is post method"
        }
    }
}