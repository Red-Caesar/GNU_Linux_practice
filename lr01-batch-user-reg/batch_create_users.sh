#!/bin/bash

dir=`dirname $0`
source_file="$dir/users_list.txt"

for user_data in $(cat "$source_file");
do

login=$(echo "$user_data" | awk -F ',' {'print $1'})
password=$(echo "$user_data" | awk -F ',' {'print $2'})

echo "Creating $login"

adduser "$login" &>> /dev/null << EOF
$password
$password





Y
EOF

if [ $? -ne 0 ];
then
echo "error: $login alredy exists"
else
echo "done"
fi
echo ""

done
