dashboard 权限使用 dashbooad-rbac.yaml 配置
然后
http://docs.shippable.com/platform/tutorial/integration/howto-create-kubeconfig/ 参照这篇构建新的config file
或者
kubectl describe ServiceAccounts dashboard --namespace=kube-system
kubectl describe secrets dashboard-token-c4np7 --namespace=kube-system  
这一步拿到token 直接用token认证
