#!/bin/bash

date_for_b=$(date | awk -F ' ' {'print $1"_"$2"_"$3"_"$4"_"$5'})

dir=`dirname $0`
source_file="$dir/users_list.txt"

i=1

for user_data in $(cat "$source_file");
do

login=$(echo "$user_data" | awk -F ',' {'print $1'})

if [ "$1" == "with-backup" ];
then
back_dir="/opt/backup_$date_for_b"
tar -cf "$back_dir.tar" "/home/$login"
echo "did backup"
else
echo "del without backup"
fi
echo ""

deluser --remove-home "$login" &>> /dev/null

#[ $i -eq 1 ] && exit 1
#i=$((i+1))

if [ $? -ne 0 ];
then
echo "error: $login does not exist"
else
echo "done"
fi
echo ""

done
