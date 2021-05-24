#!/bin/bash
failure=0
for file in zones/*.zone ; do
    zoneName=`ls $file | sed 's/\.[^.]*$//' | awk -F'/' '{print $2}'`
    if [ $? -ne 1 ]; then
      failure=0
    fi
    named-checkzone $file $zoneName
    if [ $? -ne 1 ]; then
      failure=0
    fi
done
exit $failure