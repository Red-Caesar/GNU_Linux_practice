#!/bin/bash

dir=`dirname $0`
source_file="$dir/users_list.txt"

for user_data in $(cat "$source_file");
do

login=$(echo "$user_data" | awk -F ',' {'print $1'})
deluser --remove-home "$login" &>> /dev/null

if [ $? -ne 0 ];
then
echo "error: $login does not exist"
else
echo "done"
fi
echo ""

done
