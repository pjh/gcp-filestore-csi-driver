#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

kubectl apply -f $DIR/filestore-csidriver.yaml
kubectl apply -f $DIR/secrets.yaml
kubectl apply -f $DIR/filestore-pv.yaml
kubectl apply -f $DIR/filestore-pvc.yaml
sleep 5
kubectl apply -f $DIR/nettest-pod.yaml