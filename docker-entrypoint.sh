#!/bin/bash
failure=0
for file in zones/*.zone ; do
    zoneName=`ls $file | sed 's/\.[^.]*$//' | awk -F'/' '{print $2}'`
    if [ $? -ne 0 ]; then
      failure=1
    else
        named-checkzone $zoneName $file
        if [ $? -ne 0 ]; then
        failure=1
        fi
done
exit $failure