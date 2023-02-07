#!/bin/bash
#
#

kubectl apply -f test.yaml

kubectl scale deployment ddb-sort-key --replicas=20

sleep 960


for i in {1..10}
do
	sleep 60
	#rep=$(echo "8+$i*1.5"|bc)
	rep=$(printf %.0f $(echo "20+$i*2"|bc))
	echo -n `date +"%T"` " - "
	echo "$i minute elapsed. the total replicas will be $rep"
	kubectl scale deployment ddb-sort-key --replicas=$rep
done
sleep 60
echo -n `date +"%T"` " - "
echo "finished"
kubectl delete -f test.yaml
