

# Script to print the packets per second on a specified ESXi pNIC. This script is handy when running performance tests and if you want to print packets per second.

pNic=vmnic4

count=0

while [ $count -le 120 ]
 do
    tx1=`vsish -e cat /net/pNics/$pNic/stats | grep  Tx\ Packets | awk -F ':' '{print $2}'`
    sleep 1
    tx2=`vsish -e cat /net/pNics/$pNic/stats | grep  Tx\ Packets | awk -F ':' '{print $2}'`
    txpps=`expr $tx2 - $tx1`
    echo "TX PPS: $txpps"
    count=$(( count + 1 ))
  done



