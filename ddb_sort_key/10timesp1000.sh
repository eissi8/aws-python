#!/bin/bash
#
#

kubectl apply -f p1000.yaml

kubectl scale deployment p1000 --replicas=8

sleep 660

for i in {1..20}
do
	sleep 60
	#rep=$(echo "8+$i*1.5"|bc)
	rep=$(printf %.0f $(echo "8+$i*4.6"|bc))
	echo "$i minute elapsed. the total replicas will be $rep"
	kubectl scale deployment p1000 --replicas=$rep
done
