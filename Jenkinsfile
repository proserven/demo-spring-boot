node {
    def mvnHome = tool 'MyMaven'
    def dockerImageTag = "proserven/dockerhub{env.BUILD_NUMBER}"
    stage("clone repo"){
        git 'https://github.com/proserven/demo-service.git'
        mvnHome = tool 'MyMaven'
    }
    stage('Build demoservice project'){
        //use sh in case is a linux env
        bat "C:\\Maven\\bin\\mvn clean install -DskipTests=true"
        //jar file will be generated
    }
    stage('Build Docker image'){
        dockerImage = docker.build("proserven/dockerhub:${env.BUILD_NUMBER}")
    }
        stage('Build Docker deploy'){
        echo "Docker Image Tag name : ${dockerImageTag}"
        //docker-hub-credentials - we have to create in jenkins credentials
        docker.withRegistry('https://registry.hub.docker.com','docker-hub-credentials') {
            dockerImage.push("${env.BUILD_NUMBER}")
            dockerImage.push("latest")
    }
}
}