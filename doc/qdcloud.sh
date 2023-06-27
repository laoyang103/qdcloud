#!/bin/bash

# 判断是否有计算节点主机地址
if [ -z "$(echo $1 | grep ',')" ]; then
  echo "请输入计算节点IP地址，用,隔开"
  exit
fi

echo "                                                控制节点全局设定                                          "
echo "=========================================================================================================="

# 更改主机名为jxvpn 
hostnamectl set-hostname jxvpn

# 内网加速资源网站下载磁盘模板，外网不用执行
echo "192.168.1.66 stu.jxit.net.cn" >> /etc/hosts 

# 增加/etc/rc.local文件的可执行权限，后面开机自启动命令写入此文件
chmod + /etc/rc.local

# 永久关闭防火墙和selinux
systemctl stop firewalld
systemctl disable firewalld
sed -i "s/enforcing/disabled/g" /etc/sysconfig/selinux
setenforce 0

read -p "请按任意键继续"

echo "                                                安装控制节点软件                                          "
echo "=========================================================================================================="

# 安装基础工具
yum -y install wget

# 下载软件包
wget http://stu.jxit.net.cn:88/qdcloud/rpm-vpn.tar.gz -O /opt/rpm-vpn.tar.gz
tar -zxf /opt/rpm-vpn.tar.gz -C /opt

# 安装kvm虚拟化软件包，用于更改虚拟磁盘
# 安装NFS存储、OpenVPN、JDK、数据库，用于运行存储和管理
# 安装dhcp、tftp、dns、ftp、httpd、nginx用于客户端网启和代理访问
yum -y install /opt/rpm-vpn/*.rpm

systemctl restart libvirtd && systemctl enable libvirtd

read -p "请按任意键继续"

echo "                                      部署存储目录和虚拟磁盘模板                                          "
echo "=========================================================================================================="

# /data/vdisk目录是虚拟硬盘存储，通过NFS共享给计算节点
mkdir /data/vdisk -p
echo "/data/vdisk *(rw,no_root_squash,sync)" >> /etc/exports
systemctl restart nfs-server rpcbind
systemctl enable rpcbind && systemctl enable nfs-server

# 管理节点将KVM虚拟磁盘目录指向存储目录/data/vdisk，用于修改创建路由器
cd /var/lib/libvirt/ && rm images -rf
ln -sf /data/vdisk/ images

# 下载路由器和虚拟机的模板虚拟磁盘
cd /data/vdisk
wget http://stu.jxit.net.cn:88/qdcloud/mbvm.tar.gz
wget http://stu.jxit.net.cn:88/qdcloud/stuvm.zip
wget http://stu.jxit.net.cn:88/qdcloud/stuenv.tar.gz
tar -zxf mbvm.tar.gz && tar -zxf stuenv.tar.gz && unzip stuvm.zip 
# 虚拟磁盘模板文件和虚拟机定义（xml）模板文件要放到存储根目录
mv mbvm/mbvm* . && rm mbvm -rf

read -p "请按任意键继续"

echo "                                      部署管理系统数据库                                                  "
echo "=========================================================================================================="

# 克隆管理系统的代码到/root/qdcloud
cd /root
git clone https://gitee.com/laoyang103/qdcloud
cd qdcloud/

# 导入管理系统数据库文件
systemctl restart mariadb
mysqladmin -uroot password 123456
mysql -uroot -p123456 -e "create database jxcms"
mysql -uroot -p123456 jxcms < doc/jxcms.sql 

# 根据脚本参数，写入计算节点IP列表
hpvList=$1
hpvList=$(echo $hpvList | sed "s/,/ /g")
mysql -uroot -p123456 jxcms -e "delete from lab_hpv"
for hpv in ${hpvList[@]}; do
  iplast=$(echo $hpv | awk -F "." '{print $4}')
  hpvname="jxkvm"$iplast
  mysql -uroot -p123456 jxcms -e "insert into lab_hpv values($iplast, \"$hpvname\", \"$hpv\")"
done

read -p "请按任意键继续"

echo "                                      源码编译部署管理系统                                                "
echo "=========================================================================================================="

# 安装maven编译管理系统源码，打war包
cd /opt/
wget http://stu.jxit.net.cn:88/jxfiles/apache-maven-3.6.3.tar.gz
tar -zxf apache-maven-3.6.3.tar.gz 
rm apache-maven-3.6.3.tar.gz -rf
echo "export PATH=\$PATH:/opt/apache-maven-3.6.3/bin/" >> /etc/profile
source /etc/profile

# 安装tomcat用于运行管理系统
cd /opt/
wget http://stu.jxit.net.cn:88/k8s/tomcat8-cgi.tar.gz
tar -zxf tomcat8-cgi.tar.gz 
rm tomcat8-cgi.tar.gz -rf

# 配置tomcat监听888端口，便于后面nginx做代理
sed -i "s/port=\"80\"/port=\"888\"/g" /opt/tomcat8/conf/server.xml 

# 开机自启动tomcat
echo "/opt/tomcat8/bin/startup.sh" >> /etc/rc.local

# 编译管理系统源码，拷贝到tomcat
cd /root/qdcloud/
mvn install:install-file -Dfile=lib/tangyuan-0.9.0.jar -DgroupId=org.xson -DartifactId=tangyuan -Dversion=0.9.0 -Dpackaging=jar
mvn install:install-file -Dfile=lib/rpc-util-1.0.jar -DgroupId=cn.gatherlife -DartifactId=rpc-util -Dversion=1.0 -Dpackaging=jar
mvn install:install-file -Dfile=lib/patchca-0.5.0-SNAPSHOT.jar -DgroupId=net.pusuo -DartifactId=patchca -Dversion=0.5.0-SNAPSHOT -Dpackaging=jar
mvn install:install-file -Dfile=lib/common-object-0.0.1-SNAPSHOT.jar -DgroupId=org.xson -DartifactId=common-object -Dversion=0.0.1-SNAPSHOT -Dpackaging=jar
mvn package -Dmaven.test.skip=true
cp target/qdcloud.war /opt/tomcat8/webapps/ROOT.war

# 启动tomcat
/opt/tomcat8/bin/startup.sh

# 因为war包解压出来脚本没有执行权限，所以每分钟执行一次加权限，把脚本目录加入PATH
echo "* * * * * chmod +x /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/*" > /tmp/exec.cron
crontab /tmp/exec.cron
echo "export PATH=\$PATH:/opt/tomcat8/webapps/ROOT/WEB-INF/cgi/" >> /etc/profile
source /etc/profile

read -p "请按任意键继续"

echo "                                    部署httpd资源网站和nginx代理                                          "
echo "=========================================================================================================="
cd /root/qdcloud/doc/conf/

# 删除Httpd默认欢迎文件，资源网站根目录为/var/www/html/
sed -i "8,12d" /etc/httpd/conf.d/welcome.conf

# 资源网站服务监听端口88
sed -i "s/Listen 80/Listen 88/g" /etc/httpd/conf/httpd.conf 
systemctl restart httpd && systemctl enable httpd

# 拷贝nginx配置文件，代理上面的管理系统（888端口），资源网站（88端口）
cp default.conf /etc/nginx/conf.d/
systemctl restart nginx && systemctl enable nginx

read -p "请按任意键继续"

echo "                                    部署OpenVPN服务端                                                     "
echo "=========================================================================================================="
cd /root/qdcloud/doc/conf/

# 删除OpenVPN的默认配置目录，拷贝密钥配置文件等过去
rm /etc/openvpn/ -rf && cp -r openvpn/ /etc/

# 创建每个VPN客户端的IP网关配置目录，每个客户端账号一个文件，文件名就是账号名，里面是IP和网关
mkdir /etc/openvpn/ccd

# 开机自启动openvpn
echo "nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &" >> /etc/rc.local
nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &

read -p "请按任意键继续"

echo "                                    配置教室无盘客户端网启服务                                            "
echo "=========================================================================================================="
cd /root/qdcloud/doc/conf

# 拷贝DHCP配置文件，里面包含教室（10.64.1.254/24）网段的分配
cp dhcpd.conf /etc/dhcp/dhcpd.conf 
systemctl restart dhcpd && systemctl enable dhcpd

# 拷贝TFTP网启程序和启动菜单
cp tftpboot/* /var/lib/tftpboot/ -r
systemctl restart tftp && systemctl enable tftp

# 拷贝FTP配置文件（匿名访问呢），下载客户端PE镜像
cp vsftpd.conf /etc/vsftpd/
wget http://stu.jxit.net.cn:88/qdcloud/HotPE.iso -O /var/ftp/pub/HotPE.iso
systemctl restart vsftpd && systemctl enable vsftpd

# 配置DNS服务，增加jxit.net.cn的域名定义
sed -i "s/127.0.0.1/any/g" /etc/named.conf 
sed -i "s/localhost/any/g" /etc/named.conf 
cat >> /etc/named.rfc1912.zones << EOF
zone "jxit.net.cn" IN {
type master;
file "named.jxit.net.cn";
allow-update { none; };
};
EOF

# 把解析记录拷贝到对应目录，里面的oa dl www都解析到10.16.255.254（管理节点LAN口IP）
cp named.jxit.net.cn /var/named/
chown root:named /var/named/named.jxit.net.cn 
systemctl restart named && systemctl enable named

# 开启共享IP上网，让计算集群16、VPN客户端32、教室64都能上网
echo "echo 1 > /proc/sys/net/ipv4/ip_forward" >> /etc/rc.local
echo "iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j MASQUERADE" >> /etc/rc.local
echo "iptables -t nat -A POSTROUTING -s 10.32.0.0/16 -j MASQUERADE" >> /etc/rc.local
echo "iptables -t nat -A POSTROUTING -s 10.64.0.0/16 -j MASQUERADE" >> /etc/rc.local
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.32.0.0/16 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.0.0/16 -j MASQUERADE

read -p "请按任意键继续"

echo "                                    用ansible与计算集群建立免密登录                                             "
echo "=========================================================================================================="

# 将预先生成的公钥和私钥拷贝到管理节点
cp /root/qdcloud/doc/conf/ssh-key/id_rsa* ~/.ssh/
chmod 600 ~/.ssh/id_rsa*
# 与所有计算节点建立信任，这里需要输入密码
for hpv in ${hpvList[@]}; do
  ssh-copy-id root@$hpv
done

# 生成ansible的hosts文件，定义计算集群IP
echo "[jxkvm]" >> /etc/ansible/hosts
for hpv in ${hpvList[@]}; do
  echo $hpv >> /etc/ansible/hosts
done

# 计算节点ssh登录不用DNS验证，加速ansible执行
ansible jxkvm -m shell -a "sed -i 's/#UseDNS yes/UseDNS no/g' /etc/ssh/sshd_config"
ansible jxkvm -m shell -a "systemctl restart sshd"

read -p "请按任意键继续"

echo "                                    用ansible安装计算集群软件                                             "
echo "=========================================================================================================="

# 下载计算节点软件包
wget http://stu.jxit.net.cn:88/qdcloud/rpm-kvm.tar.gz -O /opt/rpm-kvm.tar.gz

# 拷贝到所有计算节点
ansible jxkvm -m copy -a "src=/opt/rpm-kvm.tar.gz dest=/opt/rpm-kvm.tar.gz"
ansible jxkvm -m shell -a "tar -zxf /opt/rpm-kvm.tar.gz -C /opt/"

# 所有计算节点安装常用工具
# 所有计算节点安装KVM虚拟化软件
ansible jxkvm -m shell -a "yum -y install /opt/rpm-kvm/*.rpm"

read -p "请按任意键继续"

echo "                                    用ansible配置计算节点KVM网络监听                                      "
echo "=========================================================================================================="

# 配置libvirtd服务监听网络端口，让管理节点对其进行操控
ansible jxkvm -m shell -a "sed -i 's/#listen_tls/listen_tls/g' /etc/libvirt/libvirtd.conf"
ansible jxkvm -m shell -a "sed -i 's/#listen_tcp/listen_tcp/g' /etc/libvirt/libvirtd.conf"
ansible jxkvm -m shell -a "sed -i 's/#tcp_port/tcp_port /g' /etc/libvirt/libvirtd.conf"
ansible jxkvm -m shell -a "sed -i 's/#listen_addr..*$/listen_addr = \"0.0.0.0\"/g' /etc/libvirt/libvirtd.conf"
ansible jxkvm -m shell -a "sed -i 's/#auth_tcp..*$/auth_tcp = \"none\"/g' /etc/libvirt/libvirtd.conf"
ansible jxkvm -m shell -a "sed -i 's/#LIBVIRTD_ARGS/LIBVIRTD_ARGS/g' /etc/sysconfig/libvirtd"
ansible jxkvm -m shell -a "systemctl restart libvirtd"
ansible jxkvm -m shell -a "systemctl enable libvirtd"

# 所有计算节点都销毁默认KVM网桥virbr0
ansible jxkvm -m shell -a "virsh net-destroy default"
ansible jxkvm -m shell -a "virsh net-undefine default"

read -p "请按任意键继续"

echo "                                    用ansible配置计算节点关闭防火墙selinux                                "
echo "=========================================================================================================="

# 所有计算节点关闭防火墙和selinux
ansible jxkvm -m shell -a "sed -i "s/enforcing/disabled/g" /etc/sysconfig/selinux"
ansible jxkvm -m shell -a "systemctl stop firewalld; systemctl disable firewalld; setenforce 0"

read -p "请按任意键继续"

echo "                                    用ansible配置计算节点挂载NFS存储目录到虚拟磁盘目录                    "
echo "=========================================================================================================="

# 所有计算节点挂载存储节点的/data/vdisk到KVM虚拟磁盘目录/var/lib/libvirt/images
ansible jxkvm -m shell -a 'echo -e "10.16.255.254:/data/vdisk/\t/var/lib/libvirt/images\tnfs\tdefaults\t0\t0" >> /etc/fstab'
ansible jxkvm -m shell -a "mount -a"
ansible jxkvm -m shell -a "df | grep images"

read -p "请按任意键继续"

echo "                   拷贝网卡和网桥配置样例文件到所有计算节点/tmp，此处需要自己去每个计算节点配置桥接       "
echo "                   配置好后用 systemctl restart network重启生效，远程操作有风险！                         "
echo "=========================================================================================================="

cd /root/qdcloud/
ansible jxkvm -m copy -a "src=doc/conf/nic/ifcfg-br-vmr dest=/tmp/ifcfg-br-vmr"
ansible jxkvm -m copy -a "src=doc/conf/nic/ifcfg-enp1s0 dest=/tmp/ifcfg-nic"

read -p "请按任意键继续"
