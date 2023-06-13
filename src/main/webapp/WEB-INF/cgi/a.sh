#!/bin/bash

# sql="select user_id from lab_user"
# idlist=$(mysql -uroot -p123456 jxcms -e "$sql" | grep -v user_id)
# for id in ${idlist[@]}; do
#   ./mkstu.sh $id
# done

for ((id=251;id<=260;id++)); do
  ./mkstu.sh $id
done
