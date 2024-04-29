# 起点教学云

## VPC多租户隔离，支持虚拟机和容器，使用Kubernetes统一管理
1. 每个学生固定分配18台容器、1台虚拟机、1台路由器，可以自由开启、关闭、重置。
2. 基于[B站教学视频](https://space.bilibili.com/621002172/channel/series)模拟搭建实际生产环境，适合Linux运维培训学习
3. 体验地址：[http://oa.jxit.net.cn](http://oa.jxit.net.cn) 账号：jx21080001密码：qdcloud
4. 进入后点击视频或文字教程，通过 **[微劈恩]** 连接虚拟机

![学生操作主页面](http://stu.jxit.net.cn:88/mianshi/image/shuoci2.png)

## 软件架构
1. 系统最低为两台服务器，VPN管理+K8S集群，其中VPN管理节点至少两个网卡。
2. 每个学生创建一个VPC和子网，作为该学生的虚拟交换机（网段10.10.10.0/24）。
3. 每个学生都有一个路由器，LAN口接入该学生的VPC，WAN口桥接到K8S集群物理交换机（网段10.16.0.0/16），并根据学号分配固定IP。
3. 每个学生都要通过 **[微劈恩]** 连接到管理节点，根据学生为 **[微劈恩]** 客户端分配固定IP（网段10.32.0.0/16）。
4. VPN管理通过iptables对每个学生的每个虚拟机进行22和80端口映射，学生在客户端即可连接虚拟机。
5. 如果有公网IP，只需在光猫上映射管理节点的1194端口，即可实现外网连接
![架构图](http://stu.jxit.net.cn:88/qdcloud/qdcloud.png)


## 安装基础环境
1.  安装VPN管理节点，使用Centos7.9，VPN管理节点相当于K8S集群的路由器，WAN口IP随意，能上网即可， **LAN口IP必须为10.16.255.254/16！** 
2.  K8S集群节点统一安装Ubuntu22.04，IP地址为10.16.255.1/16、10.16.255.2/16、...，网关为10.16.255.254，并保证和VPN管理的LAN口在同一交换机
3.  保证VPN管理节点能够上网，能够与K8S集群节点通信，在VPN管理节点添加iptables SNAT规则，让K8S集群能够上网
```shell
# 开启内核转发，让10.16.0.0/16通过SNAT共享上网
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j MASQUERADE
```
## 部署起点云

见视频：http://dl.jxit.net.cn/mp4/shizhan/qdcloud/20231102_qdcloud_deploy.mp4

## 日常维护命令
### 获取所有学生Pod状态
```shell
[root@master jx00000003]# kubectl get pod -A | gre jx
kube-system     vpc-nat-gw-gateway-jx00000001-0           1/1     Running   0          47h
ns-jx00000001   jx00000001-mysql-master-36                1/1     Running   0          46h
ns-jx00000001   jx00000001-mysql-slave-37                 1/1     Running   0          46h
ns-jx00000001   jx00000001-ops-81                         1/1     Running   0          46h
ns-jx00000001   jx00000001-mysql-proxy-31                 1/1     Running   0          45h
ns-jx00000001   jx00000001-redis-26                       1/1     Running   0          7h22m
ns-jx00000001   jx00000001-redis-27                       1/1     Running   0          7h22m
ns-jx00000001   jx00000001-redis-28                       1/1     Running   0          7h22m
kube-system     vpc-nat-gw-gateway-jx00000003-0           1/1     Running   0          35m
ns-jx00000003   jx00000003-ops-81                         1/1     Running   0          33m
```

## 有任何问题+V：553069938
