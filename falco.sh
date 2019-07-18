#!/bin/bash 

run () {
		echo 'Running: '$*
		echo '...'
		$*
		sleep 5
}

echo "Running booth demo!"

feh -F -Z -D 6 --on-last-slide quit screenshot_k8s_view.png

ibmcloud ks cluster config nibz-falco-demo

run ibmcloud ks cluster get nibz-falco-demo

run ibmcloud ks workers nibz-falco-demo

run kubectl get node

run kubectl get pod 

run kubectl logs --tail=10 -l app=falco-example

echo " kubectl exec -it nginx-deployment-76bf4969df-4sv8n -- /usr/bin/touch /etc/secondtest"
kubectl exec -it nginx-deployment-76bf4969df-4sv8n -- /usr/bin/touch /etc/secondtest
sleep 5


echo "kubectl logs --tail=1 -l app=falco-example | jq '.'"
echo "..."
sleep 1
kubectl logs --tail=1 falco-daemonset-gzrz9 | jq '.'
sleep 15


feh -F -Z -D 12 --on-last-slide quit falco_plus_ibmcloud.png

feh -F -Z -D 6 --on-last-slide quit ibm-cloud-data-centers.png

