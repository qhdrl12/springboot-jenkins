#!/bin/bsh

LIB_PATH=build/libs
JAR_FILE=sample-0.0.1-SNAPSHOT.jar
PID_NAME=application.pid

function stop() {
    echo " "
    echo "Stopping process on read pid."

    if [ -f $PID_NAME ]; then
        PID=`cat $PID_NAME`

        if [[ -n $PID ]]; then
            echo $PID
            `kill $PID`
            rm $PID_NAME
        else
            echo "PID IS EMPTY"
        fi
    else
        echo "$PID_NAME not found"
    fi

    echo " "
}

function start() {
    echo " "
    echo "java -jar $LIB_PATH/$PROJECT_NAME"
    `chmod 755 ./gradlew`
    `java -jar $LIB_PATH/$JAR_FILE &`
    echo " "
}

stop

start
