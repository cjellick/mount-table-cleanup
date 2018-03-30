#!/bin/bash

ret=$(mysql -u $SQL_FIX_USER  -p$SQL_FIX_PASSWORD -h $SQL_FIX_HOST -P $SQL_FIX_PORT --skip-column-names $SQL_FIX_DB < count.sql)
echo "Initial row count: $ret"

while [ $ret -gt 0 ]
do
  echo "Rows left: $ret"
  mysql -u $SQL_FIX_USER -p$SQL_FIX_PASSWORD -h $SQL_FIX_HOST -P $SQL_FIX_PORT --skip-column-names $SQL_FIX_DB < delete.sql
  ret=$(mysql -u $SQL_FIX_USER -p$SQL_FIX_PASSWORD -h $SQL_FIX_HOST -P $SQL_FIX_PORT --skip-column-names $SQL_FIX_DB < count.sql)
done
