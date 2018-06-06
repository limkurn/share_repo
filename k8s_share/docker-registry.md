docker pull registry

mkdir -p /data/docker

docker run -d -p 5000:5000 --restart=always --name registry -e 167.99.76.2=0.0.0.0:5000 registry
