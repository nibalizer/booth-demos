#!/bin/bash 

run () {
		echo 'Running: '$*
		echo '...'
		$*
		sleep 5
}

echo "Running booth demo!"

feh -Z -D 6 --on-last-slide quit screenshot_k8s_view.png

ibmcloud ks cluster config k8s.nibalizer.net

export KUBECONFIG=/home/nibz/.bluemix/plugins/container-service/clusters/k8s.nibalizer.net/kube-config-wdc06-k8s.nibalizer.net.yml

run ibmcloud ks cluster get k8s.nibalizer.net

run ibmcloud ks workers k8s.nibalizer.net

run kubectl get node

run kubectl get pod -n clean
run kubectl get deploy -n clean
run kubectl get rs -n clean
run kubectl get ing -n clean

run kubectl -n clean logs --tail=20 -l app=watson-twitch-tone-analysis

run kubectl get -n clean -o yaml deploy/watson-twitch-tone-analysis

run kubectl describe -n clean ing/main-ingress

run host apps.nibalizer.net

feh -Z -D 6 --on-last-slide quit watson_twitch.png 

