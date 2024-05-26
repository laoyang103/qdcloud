#!/bin/bash

# 使用rancher镜像安装k3s1.28.8
export INSTALL_K3S_VERSION=v1.28.8+k3s1
export INSTALL_K3S_MIRROR=cn

# 安装时去掉默认网络插件flannel，去掉默认ingress-controller traefik
# 将kubeconfig保存到~/.kube/config
wget https://rancher-mirror.rancher.cn/k3s/k3s-install.sh 
sh k3s-install.sh --flannel-backend=none --disable-network-policy --disable=traefik --write-kubeconfig-mode=644 --write-kubeconfig=~/.kube/config --service-node-port-range=60-59000 --kubelet-arg=max-pods=5000

# 下载kube-ovn安装脚本（已经将pod网络改为10.42.0.0/16，svc改为10.43.0.0/16）
wget http://stu.jxit.net.cn:88/qdcloud/kube-ovn-1.12-k3s-1.28.8-install.sh
bash -x kube-ovn-1.12-k3s-1.28.8-install.sh

# 下载kube-ovn安装脚本（已经将pod网络改为10.42.0.0/16，svc改为10.43.0.0/16）
kubectl apply -f src/main/webapp/WEB-INF/cgi/yml/public/multus-daemonset-thick.yml 

# 下载intel多网卡CNI插件multus，并安装到/opt/cni/bin
wget http://stu.jxit.net.cn:88/k8s/kube-ovn/multus-cni_4.0.2_linux_amd64.tar.gz 
tar -zxf multus-cni_4.0.2_linux_amd64.tar.gz 
cp multus-cni_4.0.2_linux_amd64/multus* /opt/cni/bin/

# 开启kube-ovn的VPC网关支持
kubectl apply -f src/main/webapp/WEB-INF/cgi/yml/public/enable-vpc-nat-gw.yml 

# 让multus桥接到物理网络，注意要修改里面的物理网卡名和IP地址段
#       ...
#       cidrBlock: 10.16.0.0/16 # 外部网络的网段
#       gateway: 10.16.255.254  # 外部网络的物理网关的地址
#       ...
#       "type": "macvlan",
#       "master": "enp1s0",
#       "mode": "bridge",
#       ...
kubectl apply -f src/main/webapp/WEB-INF/cgi/yml/public/external-network.yml 

# 本地安装mysql客户端连接到服务器获取用户数据
apt -y install mariadb-client mariadb-client tree net-tools

# 命令补全
mv /usr/local/bin/kubectl-ko /opt/
echo "source /usr/share/bash-completion/bash_completion" >> ~/.bashrc
echo "source <(kubectl completion bash)" >> ~/.bashrc
source ~/.bashrc
