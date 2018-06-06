Helm是一个kubernetes应用的包管理工具，用来管理charts——预先配置好的安装包资源，有点类似于Ubuntu的APT和CentOS中的yum。

Helm chart是用来封装kubernetes原生应用程序的yaml文件，可以在你部署应用的时候自定义应用程序的一些metadata，便与应用程序的分发。

Helm和charts的主要作用：

应用程序封装
版本管理
依赖检查
便于应用程序分发

brew install kubernetes-helm

master 最简单 helm init (安装的时候 本地的 ~/.kube/ 目录配置对 可以直接跑了)

本地类似这样直接发布应用： helm install --name npm stable/verdaccio --tiller-namespace helm --namespace helm -f helm.yaml
https://blog.qikqiak.com/post/first-use-helm-on-kubernetes/
