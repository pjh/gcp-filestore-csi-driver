#!/bin/bash

mydir="$(dirname $0)"
kubectl delete -f "$mydir/manifests/windows-node.yaml"
