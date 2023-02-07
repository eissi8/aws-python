#!/bin/bash
#
#

kubectl apply -f p15000.yaml

kubectl scale deployment ddb-sort-key --replicas=8

sleep 660

for i in {1..30}
do
	sleep 60
	#rep=$(echo "8+$i*1.5"|bc)
	rep=$(printf %.0f $(echo "8+$i*3.1"|bc))
	echo "$i minute elapsed. the total replicas will be $rep"
	kubectl scale deployment ddb-sort-key --replicas=$rep
done
