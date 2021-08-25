#!/bin/bash
interval=0
number=0
command=""
Counter=0

while getopts "i:n:c:" options;do
        case "${options}" in
                i)
                        interval=${OPTARG};;
                n)
                        number=${OPTARG};;
                c)
                        command=${OPTARG};;
        esac
done

env > env.txt

if [ -z $command ];then
	command=`cat env.txt | grep TRY_COMMAND`
	break
	if [ $? != 0 ];then
		echo "hichja commandi nadari"
		exit
	fi
fi



if [ $number == 0  ];then
	number=2
fi


if [ $interval == 0 ];then
	interval=3
fi




for ((j=0;j<$number;j++));do
        ((Counter++))
        comm=`${command}`
        if [ $? == 0 ];then
                echo "bad az $Counter test ok shod "
                break
        fi

        sleep $interval
        echo $comm
done

if [ -z $comm ];then
        echo "bad az $number talash faile shod !!"
fi

