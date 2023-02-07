#!/bin/bash
#
#
for j in {1..5}
do
kubectl apply -f p1000.yaml

kubectl scale deployment p1000 --replicas=10

sleep 600

for i in {1..10}
do
	sleep 60
	#rep=$(echo "8+$i*1.5"|bc)
	rep=$(printf %.0f $(echo "10+$i*1"|bc))
	echo -n `date +"%T"` " - "
	echo "$i minute elapsed. the total replicas will be $rep"
	kubectl scale deployment p1000 --replicas=$rep
done

for i in {1..10}
do
	sleep 60
	#rep=$(echo "8+$i*1.5"|bc)
	rep=$(printf %.0f $(echo "20+$i*2"|bc))
	echo -n `date +"%T"` " - "
	echo "$i minute elapsed. the total replicas will be $rep"
	kubectl scale deployment p1000 --replicas=$rep
done
for i in {1..10}
do
	sleep 60
	#rep=$(echo "8+$i*1.5"|bc)
	rep=$(printf %.0f $(echo "40+$i*4"|bc))
	echo -n `date +"%T"` " - "
	echo "$i minute elapsed. the total replicas will be $rep"
	kubectl scale deployment p1000 --replicas=$rep
done
sleep 120
kubectl delete -f p1000.yaml

sleep 600

done
