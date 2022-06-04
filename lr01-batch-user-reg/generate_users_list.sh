#!/bin/bash

dir=`dirname $0`

result_file="$dir/users_list.txt"

if [ $# -ne 0 ];
then
count_users=$1
else
count_users=100
fi

if [ -f $result_file ];
then
rm $result_file
fi

for i in $(seq -w 1 $count_users);
do

login="user$i"
password=$(pwgen -s 8 1)

line="$login,$password"

echo "$line" >> $result_file
#[ $i -eq 10 ] && exit 1

done

