node {
    checkout scm

    stage('Build') {
        sh  'chmod 755 gradlew'
        sh './gradlew clean build'
        archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
    }

    stage('Deploy') {
        def jar_name = "sample-0.0.1-SNAPSHOT.jar"
        sh """
        if [ \$(pgrep -f ${jar_name} | wc -l) -gt 0 ]; then
            pkill -9 -f ${jar_name}
            echo "stop application"
        fi
        JENKINS_NODE_COOKIE=DONTKILLME nohup java -jar build/libs/${jar_name} &
        """
    }
}