# jps -lv
echo "> Check the currently running spring server pid "
CURRENT_PID=$(ps -ef| grep java| grep target* | awk '{print $2}')
echo "$CURRENT_PID"
if [ -z $CURRENT_PID ]; then
	echo "> No applications are currently running and will not be shut down." 
else
	echo "> kill -9 $CURRENT_PID" 
	kill -9 $CURRENT_PID
	sleep 10
fi
	echo "> Deploy new spring application!!" 
	nohup java -jar /var/lib/jenkins/workspace/Test1/target/*.jar >> /var/lib/jenkins/workspace/Test1/target/SpringLog.txt &
