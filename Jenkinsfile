pipeline{
agent any
    stages{

    stage('Build Jar')
    {
        steps{
        script
        {
        bat 'mvn clean package -DskipTests'
        }
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
         script{
            bat "docker push nmalik1986/selenium"
                }
     }

    }

    stage('Run Selenium Grid')
        {
            steps{
            script
            {
            bat "docker-compose -f grid.yml up -d"
            }
          }
        }

        stage('Run Test Cases')
        {
            steps{
            bat "docker-compose -f test-suites.yml up"
        }
        }
    }

    post{
       always{
       bat "docker-compose -f grid.yml down"
       bat "docker-compose -f test-suites.yml down"
        }
       }
}