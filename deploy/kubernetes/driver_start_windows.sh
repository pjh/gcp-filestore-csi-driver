#!/bin/bash

set -x
set -o nounset
set -o errexit

mydir="$(dirname $0)"

source "$mydir/../common.sh"

kubectl apply -f "$mydir/manifests/windows-node.yaml"
# kubectl apply -f "$mydir/manifests/controller.yaml"
