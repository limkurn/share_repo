#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Replace this with the token
#  import random; print "%0x.%0x" % (random.SystemRandom().getrandbits(3*8), random.SystemRandom().getrandbits(8*8))
# TOKEN=cfd086.2bb50528c8acaa36

apt-get update
apt-get install -y docker.io

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y --allow-unauthenticated kubelet kubeadm kubectl kubernetes-cni


export MASTER_IP=167.99.76.2
kubeadm init --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address 167.99.76.2 --token cfd086.2bb50528c8acaa36
# kubeadm init --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address $MASTER_IP

# cp /etc/kubernetes/admin.conf $HOME/
# chown $(id -u):$(id -g) $HOME/admin.conf
# export KUBECONFIG=$HOME/admin.conf
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml --namespace=kube-system
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml --namespace=kube-system

# Install DigitalOcean monitoring agent
# curl -sSL https://agent.digitalocean.com/install.sh | sh
