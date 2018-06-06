#!/bin/bash
# Replace this with the token
TOKEN=cfd086.2bb50528c8acaa36

apt-get update
apt-get install -y docker.io

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y --allow-unauthenticated kubelet kubeadm kubectl kubernetes-cni

kubeadm join 167.99.76.2:6443 --token cfd086.2bb50528c8acaa36 --discovery-token-ca-cert-hash sha256:9e44a60b6b31dfcdf4961d9129474de1fa7c22cf46955e2315e2fd26e5228798
# Install DigitalOcean monitoring agent
# curl -sSL https://agent.digitalocean.com/install.sh | sh
