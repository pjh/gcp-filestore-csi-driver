#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

kubectl delete -f $DIR/nettest-pod.yaml
kubectl delete -f $DIR/filestore-pvc.yaml
kubectl delete -f $DIR/filestore-pv.yaml
kubectl delete -f $DIR/secrets.yaml
kubectl delete -f $DIR/filestore-csidriver.yaml