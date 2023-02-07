#!/bin/bash
#
#

kubectl apply -f bursting.yaml
echo -n `date +"%T"` " - "
echo "first exhaust burstable"
sleep 600

kubectl delete -f bursting.yaml
echo -n `date +"%T"` " - "
echo "sleep 10 minutes to see how burstable after 10 minutes"
sleep 600

kubectl apply -f bursting.yaml
echo -n `date +"%T"` " - "
echo "run 10 minutes how burstable continues"
sleep 600

kubectl delete -f bursting.yaml
echo -n `date +"%T"` " - "
echo "sleep 20 minutes to see how burstable after 10 minutes"
sleep 1200

kubectl apply -f bursting.yaml
echo -n `date +"%T"` " - "
echo "run 10 minutes how burstable continues"
sleep 600

kubectl delete -f bursting.yaml
echo -n `date +"%T"` " - "
echo "sleep 30 minutes to see how burstable after 10 minutes"
sleep 1800

kubectl apply -f bursting.yaml
echo -n `date +"%T"` " - "
echo "run 10 minutes how burstable continues"
sleep 600

kubectl delete -f bursting.yaml
echo -n `date +"%T"` " - "
echo "sleep 60 minutes to see how burstable after 10 minutes"
sleep 3600

kubectl apply -f bursting.yaml
echo -n `date +"%T"` " - "
echo "run 10 minutes how burstable continues"
sleep 600


kubectl delete -f bursting.yaml
echo -n `date +"%T"` " - "
echo "test complete"
