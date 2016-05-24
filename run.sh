# !/bin/sh
#
while [ 0 -eq 0 ]; do
	while [[ `ps -ef | grep 'TEST.jar' | grep -v 'grep' | wc -l` == 0 ]]; do   #test running
		echo "`date`: Run TEST.jar" >> ./logs.log		
		sudo java -jar TEST.jar &                 #Run app
		echo -n "Proces: " >> ./logs.log
		ps -e | grep 'TEST.jar' >> ./logs.log
    sleep 60
	done

	if [[ `ps -ef | grep 'TEST.jar' | grep -v 'grep' | wc -l` > 1 ]]; then   # if more instances
		sudo pkill -9 -e -f TEST.jar 
	fi
done
