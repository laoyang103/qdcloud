#!/bin/bash

# sql="select user_id from lab_user"
# idlist=$(mysql -uroot -p123456 jxcms -e "$sql" | grep -v user_id)
# for id in ${idlist[@]}; do
#   ./mkstu.sh $id
# done

# for ((id=251;id<=260;id++)); do
#   ./mkstu.sh $id
# done

source head.sh

startvm 3  jx00000003 jx00000003
startvm 10 jx00000010 jx00000010
# startvm 230 jx23010010 jx23010010
# startvm 231 jx23010001 jx23010001
# startvm 232 jx23010002 jx23010002
# startvm 233 jx23010003 jx23010003
# startvm 234 jx23010004 jx23010004
# startvm 235 jx23010005 jx23010005
# startvm 236 jx23010006 jx23010006
# startvm 237 jx23010007 jx23010007
# startvm 238 jx23010008 jx23010008
# startvm 239 jx23010009 jx23010009
# startvm 241 jx23010011 jx23010011
# startvm 242 jx23010012 jx23010012
# startvm 243 jx23010013 jx23010013
# startvm 251 jx23020001 jx23020001
# startvm 252 jx23020002 jx23020002
# startvm 253 jx23020003 jx23020003
# startvm 254 jx23020004 jx23020004
# startvm 255 jx23020005 jx23020005
# startvm 256 jx23020006 jx23020006
# startvm 257 jx23020007 jx23020007
# startvm 258 jx23020008 jx23020008
# startvm 259 jx23020009 jx23020009
# startvm 260 jx23020010 jx23020010
