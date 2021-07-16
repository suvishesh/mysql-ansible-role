#! /bin/bash

STATUS=`systemctl show -p ActiveState mysql | cut -d'=' -f2`
#SubState=`systemctl show -p SubState mysql | cut -d'=' -f2`

SIZE=`mysql -usuvishesh -psuvi@123 < /tmp/db.sql 2> /dev/null | grep june | awk '{printf "%.0f",$2}'`
#echo $SIZE

#ww=${SIZE%.*}
#echo $ww

service_check () {

	if [[ $STATUS == 'inactive' ]] || [[ $SIZE -ge  150 ]]
	then
	mail
	fi
}

mail() {

echo "SIZE: $SIZE"
echo "mysql: $STATUS"
#echo "MySql is $STATUS, db size is $SIZE" |  mail -s "Alert" root@localhost
#things can be modified to send mail with smtp settings
}

service_check

