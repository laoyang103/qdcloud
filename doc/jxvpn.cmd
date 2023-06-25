    1  ip a
    2  ls
    3  ip a
    4  nmcli --help
    5  nmcli d
    6  ls
    7  vim /etc/NetworkManager/system-connections/ens33.nmconnection 
    8  vi /etc/NetworkManager/system-connections/ens33.nmconnection 
    9  ls
   10  cd /etc/NetworkManager/system-connections/
   11  ls
   12  ip a
   13  cp ens33.nmconnection ens37.nmconnection 
   14  ls
   15  vim ens37.nmconnection 
   16  yum -y install vim
   17  ls
   18  vim ens37.nmconnection 
   19  ls
   20  ip a
   21  nmcli c reload
   22  ip a
   23  nmcli c up ens37
   24  ip a
   25  vim ens37.nmconnection 
   26  ip a
   27  nmcli c reload
   28  ip a
   29  vim ens37.nmconnection 
   30  ls
   31  vim ens33.nmconnection 
   32  ls
   33  nmcli c reload
   34  ip a
   35  reboot 
   36  ip a
   37  hostnamectl set-hostname jxvpn
   38  ip a
   39  ls
   40  ip a
   41  mkdir /data/vdisk -p
   42  yum install -y nfs-utils rpcbind
   43  echo "/data/vdisk *(rw,no_root_squash,sync)" >> /etc/exports
   44  systemctl restart nfs-server rpcbind
   45  systemctl enable rpcbind && systemctl enable nfs-server
   46  ip a
   47  iptables-save 
   48  systemctl stop firewalld
   49  setenforce 0
   50  systemctl disable firewalld
   51  vim /etc/sysconfig/selinux 
   52  sed -i "s/SELINUX=..*$/SELINUX=disabled" /etc/sysconfig/selinux 
   53  sed -i "s/SELINUX=..*$/SELINUX=disabled/g" /etc/sysconfig/selinux 
   54  vim /etc/sysconfig/selinux 
   55  setenforce 0
   56  ls
   57  cd /data/vdisk/
   58  ls
   59  wget http://stu.jxit.net.cn:88/qdcloud/mbvm.tar.gz
   60  yum -y install wget
   61  wget http://stu.jxit.net.cn:88/qdcloud/mbvm.tar.gz
   62  ping stu.jxit.net.cn
   63  wget http://192.168.1.66:88/qdcloud/mbvm.tar.gz
   64  ls
   65  rm mbvm.tar.gz -rf
   66  wget http://10.64.1.254:88/qdcloud/mbvm.tar.gz
   67  ls
   68  rm mbvm.tar.gz -rf
   69  wget http://10.64.1.254:88/qdcloud/mbvm.tar.gz
   70  wget http://stu.jxit.net.cn:88/qdcloud/stuvm.zip
   71  vim /etc/hosts 
   72  wget http://stu.jxit.net.cn:88/qdcloud/stuvm.zip
   73  wget http://stu.jxit.net.cn:88/qdcloud/stuenv.tar.gz
   74  ls
   75  tar -zxf mbvm.tar.gz 
   76  unzip stuvm.zip 
   77  yum -y install unzip
   78  ls
   79  unzip stuvm.zip 
   80  ls
   81  tar -zxf stuenv.tar.gz 
   82  yum -y install guestfs-tools
   83  yum -y install guestfs-tools tcpdump httpd ansible rsync openvpn
   84  yum -y install epel*
   85  yum -y install guestfs-tools tcpdump httpd ansible rsync openvpn
   86  yum -y install bc git java-1.8.0-openjdk mariadb-server dhcp-server tftp-server bind vsftpd
   87  yum -y install bc git java-1.8.0-openjdk mariadb-server dhcp-server tftp-server bind vsftpd tree nload rsync
   88  yum -y install bc git java-1.8.0-openjdk mariadb-server dhcp-server tftp-server bind vsftpd tree nload rsync libvirt-client nginx lrzsz
   89  history 
   90  cat /proc/cpuinfo 
   91  cat /proc/cpuinfo | grep vmx
   92  yum -y install git qemu-img wget libvirt virt-install qemu-kvm
   93  systemctl restart libvirtd
   94  top
   95  ls
   96  git clone https://gitee.com/laoyang103/laboratory
   97  cd /opt/
   98  ls
   99  wget http://stu.jxit.net.cn:88/jxfiles/apache-maven-3.6.3.tar.gz
  100  ls
  101  tar -zxf apache-maven-3.6.3.tar.gz 
  102  ls
  103  rm apache-maven-3.6.3.tar.gz -rf
  104  ls
  105  cd apache-maven-3.6.3/
  106  ls
  107  cd bin/
  108  ls
  109  pwd
  110  vim /etc/profile
  111  ls
  112  yum provides "*bin/javac"
  113  yum -y install java-1.8.0-openjdk-devel
  114  ls
  115  cd laboratory/
  116  ls
  117  yum -y install java-1.8.0-openjdk-devel
  118  ls
  119  cat instjar.cmd 
  120  mvn package -Dmaven.test.skip=true
  121  cat instjar.cmd 
  122  systemctl restart mariadb
  123  mysqladmin -uroot password 123456
  124  mysql -uroot -p123456
  125  mysql -uroot -p123456 jxcms < doc/jxcms.sql 
  126  ls
  127  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
  128  ls
  129  ls /opt/
  130  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
  131  cd /data/
  132  ls
  133  cd vdisk/
  134  ls
  135  rm *.tar.gz -rf
  136  ls
  137  rm *.zip -rf
  138  ls
  139  mv mbvm/mbvm* .
  140  ls
  141  rm mbvm -rf
  142  ls
  143  ls /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
  144  crontab -e
  145  vim /etc/profile
  146  ip a
  147  cd /opt/
  148  ls
  149  wget http://stu.jxit.net.cn:88/k8s/tomcat8-cgi.tar.gz
  150  ls
  151  tar -zxf tomcat8-cgi.tar.gz 
  152  ls
  153  rm tomcat8-cgi.tar.gz -rf
  154  ls
  155  ls
  156  ls /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
  157  crontab -e
  158  ls /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
  159  ls
  160  poweroff 
  161  ansible jxkvm -m shell -a "yum -y install vim net-tools bridge-utils psmisc epel-release tcpdump net-tools psmisc"
  162  ls
  163  arp -an
  164  yum -y install net-tools
  165  arp -an
  166  ls
  167  ls ~/.ssh/
  168  cd laboratory/
  169  ls
  170  cd doc/
  171  ls
  172  cd conf/
  173  ls
  174  cd ssh-key/
  175  ls
  176  cp * ~/.ssh/
  177  ssh-copy-id root@10.16.255.1
  178  ssh-copy-id root@10.16.255.2
  179  ls
  180  vim /etc/ansible/hosts 
  181  cat > /etc/ansible/hosts << EOF
  182  [jxkvm]
  183  10.16.255.1
  184  10.16.255.2
  185  EOF
  186  vim /etc/ansible/hosts 
  187  ansible jxkvm -m shell -a "sed -i 's/#UseDNS..*$/UseDNS no/g' /etc/ssh/sshd_config"
  188  ssh root@10.16.255.1
  189  chmod 600 /root/.ssh/id_rsa
  190  ssh root@10.16.255.1
  191  ansible jxkvm -m shell -a "sed -i 's/#UseDNS..*$/UseDNS no/g' /etc/ssh/sshd_config"
  192  ansible jxkvm -m shell -a "sed -i 's/#UseDNS..*$/UseDNS no/g' /etc/ssh/sshd_config" -vv
  193  vim /etc/ansible/ansible.cfg 
  194  ssh root@10.16.255.1
  195  ssh root@10.16.255.2
  196  ansible jxkvm -m shell -a "sed -i 's/#UseDNS..*$/UseDNS no/g' /etc/ssh/sshd_config" -vv
  197  ansible jxkvm -m shell -a "ls /tm;p" -vv
  198  ansible jxkvm -m shell -a "ls /tmp" -vv
  199  ansible jxkvm -m shell -a "ls /tmp" -vvv
  200  ansible jxkvm -m shell -a "ls /tmp"
  201  ansible jxkvm -m shell -a "ls /tmp" -vvv
  202  vim /etc/ansible/hosts 
  203  ping stu.jxit.net.cn
  204  ping 10.16.255.1
  205  ping 10.16.255.2
  206  ssh root@10.16.255.2
  207  ssh root@10.16.255.2 ls
  208  ansible jxkvm -m shell -a "ls /tmp" -vvv
  209  ansible jxkvm -m shell -a "ls /tmp" 
  210  ansible jxkvm -m shell -a "ls /tmp" -vvv
  211  vim /etc/ansible/hosts 
  212  ansible jxkvm -m shell -a "ls /tmp" -vvv
  213  vim /etc/ansible/hosts 
  214  ansible jxkvm -m shell -a "ls /tmp" 
  215  ansible jxkvm -m shell -a "sed -i 's/#UseDNS..*$/UseDNS no/g' /etc/ssh/sshd_config" -vv
  216  ansible jxkvm -m shell -a "cat /etc/ssh/sshd_config | grep DNS" 
  217  ansible jxkvm -m shell -a "systemctl restart sshd" 
  218  cd ..
  219  ls
  220  cd ..
  221  ls
  222  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh 
  223  vim /etc/named.conf 
  224  sed -e "s/127.0.0.1/any/g" /etc/named.conf 
  225  sed -e "s/localhost/any/g" /etc/named.conf 
  226  sed -i "s/127.0.0.1/any/g" /etc/named.conf 
  227  sed -i "s/localhost/any/g" /etc/named.conf 
  228  vim /etc/named.rfc1912.zones 
  229  cat >> /etc/named.rfc1912.zones << EOF
  230  cat /etc/named.rfc1912.zones 
  231  cat >> /etc/named.rfc1912.zones << EOF
  232  zone "jxit.net.cn" IN {
  233  type master;
  234  file "named.jxit.net.cn";
  235  allow-update { none; };
  236  };
  237  EOF
  238  history 
  239  vim /etc/named.rfc1912.zones 
  240  cd ..
  241  ls
  242  cp doc/conf/named.jxit.net.cn /var/named/
  243  chown root:named /var/named/named.jxit.net.cn 
  244  systemctl restart named
  245  iptables-save 
  246  systemctl stop firewalld
  247  setenforce 0
  248  iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j MASQUERADE
  249  iptables -t nat -A POSTROUTING -s 10.64.0.0/16 -j MASQUERADE
  250  iptables -t nat -A POSTROUTING -s 10.32.0.0/16 -j MASQUERADE
  251  iptables-save 
  252  echo 1 > /proc/sys/net/ipv4/ip_forward
  253  ansible jxkvm -m shell -a "yum -y install vim net-tools bridge-utils psmisc epel-release tcpdump net-tools psmisc"
  254  ansible jxkvm -m shell -a "yum -y install vim net-tools bridge-utils psmisc epel-release tcpdump net-tools psmisc" -vvv
  255  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh 
  256  ansible jxkvm -m shell -a "yum -y install qemu-kvm qemu-img libvirt libvirt-python python-virtinst libvirt-client virt-install" -vvv
  257  ansible jxkvm -m shell -a "rpm -qa | grep bridge"
  258  ansible jxkvm -m shell -a "rpm -qa | grep kvm"
  259  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh 
  260  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh | head -n 10
  261  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh | head -n 20
  262  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh | head -n 22
  263  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh | head -n 23
  264  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh | head -n 25
  265  ansible jxkvm -m shell -a "sed -i "s/#listen_tls/listen_tls/g" /etc/libvirt/libvirtd.conf"
  266  ansible jxkvm -m shell -a "sed -i "s/#listen_tcp/listen_tcp/g" /etc/libvirt/libvirtd.conf"
  267  ansible jxkvm -m shell -a "sed -i "s/#tcp_port/tcp_port /g" /etc/libvirt/libvirtd.conf"
  268  ansible jxkvm -m shell -a "sed -i 's/#tcp_port/tcp_port /g' /etc/libvirt/libvirtd.conf"
  269  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh | head -n 25
  270  ansible jxkvm -m shell -a "sed -i 's/#listen_addr..*$/listen_addr = \"0.0.0.0\"/g' /etc/libvirt/libvirtd.conf"
  271  ansible jxkvm -m shell -a "sed -i 's/#auth_tcp..*$/auth_tcp = \"none\"/g' /etc/libvirt/libvirtd.conf"
  272  ansible jxkvm -m shell -a "sed -i 's/#LIBVIRTD_ARGS/LIBVIRTD_ARGS/g' /etc/sysconfig/libvirtd"
  273  ansible jxkvm -m shell -a "sed -i "s/enforcing/disabled/g" /etc/sysconfig/selinux"
  274  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh | head -n 35
  275  ansible jxkvm -m shell -a "systemctl restart libvirtd"
  276  ansible jxkvm -m shell -a "systemctl enable libvirtd"
  277  ansible jxkvm -m shell -a "systemctl stop firewalld; systemctl disable firewalld; setenforce 0"
  278  ansible jxkvm -m shell -a 'echo -e "10.16.255.254:/data/vdisk/\t/var/lib/libvirt/images\tnfs\tdefaults\t0\t0" >> /etc/fstab'
  279  cat /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/node.sh 
  280  ansible jxkvm -m shell -a "mount -a"
  281  ansible jxkvm -m shell -a "df"
  282  ls
  283  ansible jxkvm -m copy -a src=doc/conf/name
  284  git pull --all
  285  git pull -u origin master
  286  ls
  287  git status .
  288  git pull -u origin master
  289  ls
  290  cd ..
  291  ls
  292  rm laboratory/ -rf
  293  git clone https://gitee.com/laoyang103/laboratory
  294  ls
  295  cd laboratory/
  296  ls
  297  ansible jxkvm -m copy -a "src=doc/conf/nic/ifcfg-br-vmr dest=/etc/sysconfig/network-scripts/"
  298  ansible jxkvm -m copy -a "src=doc/conf/nic/ifcfg-enp1s0 dest=/etc/sysconfig/network-scripts/"
  299  ansible jxkvm -m copy -a "ls /etc/sysconfig/network-scripts/"
  300  ansible jxkvm -m shell -a "ls /etc/sysconfig/network-scripts/"
  301  ansible jxkvm -m shell -a "cat /etc/sysconfig/network-scripts/enp1s0 > /etc/sysconfig/network-scripts/ens33"
  302  ansible jxkvm -m shell -a "cat /etc/sysconfig/network-scripts/ifcfg-enp1s0 > /etc/sysconfig/network-scripts/ens33"
  303  ansible jxkvm -m shell -a "cat /etc/sysconfig/network-scripts/ifcfg-enp1s0 > /etc/sysconfig/network-scripts/ifcfg-ens33"
  304  ansible jxkvm -m shell -a "sed -i "s/enp1s0/ens33/g" /etc/sysconfig/network-scripts/ifcfg-ens33"
  305  ansible jxkvm -m shell -a ""
  306  ansible jxkvm -m shell -a "ls /etc/sysconfig/network-scripts/"
  307  ansible jxkvm -m shell -a "rm /etc/sysconfig/network-scripts/ifcfg-enp1s0"
  308  ansible jxkvm -m shell -a "ls /etc/sysconfig/network-scripts/"
  309  ansible jxkvm -m shell -a "systemctl restart network"
  310  上面命令IP冲突了
  311  echo "上面命令IP冲突了，都是255.1"
  312  history 
  313  ansible jxkvm -m shell -a "virsh net-destroy default"
  314  ansible jxkvm -m shell -a "virsh net-undefine default"
  315  ls
  316  lls
  317  ls
  318  mysql -uroot -p123456 jxcms
  319  systemctl restart mariadb
  320  systemctl enable mariadb
  321  mysql -uroot -p123456 jxcms
  322  mysql -uroot -p123456 jxcms -e "delete from lab_hpv"
  323  mysql -uroot -p123456 jxcms -e "insert into lab_hpv values(1, "jxkvm1", "10.16.255.1")"
  324  mysql -uroot -p123456 jxcms -e "insert into lab_hpv values(1, 'jxkvm1', '10.16.255.1')"
  325  mysql -uroot -p123456 jxcms -e "insert into lab_hpv values(1, 'jxkvm2', '10.16.255.2')"
  326  mysql -uroot -p123456 jxcms -e "insert into lab_hpv values(2, 'jxkvm2', '10.16.255.2')"
  327  mysql -uroot -p123456 jxcms -e "select *from lab_hpv"
  328  bash -x mkstu.sh 1
  329  ls
  330  cd /data/vdisk/
  331  ls
  332  rm jx00000001/ -rf
  333  ls
  334  cd /var/lib/libvirt/
  335  ls
  336  rm images/ -rf
  337  ln -sf /data/vdisk/ images
  338  ls -al
  339  bash -x mkstu.sh 1
  340  bash -x mkstu.sh 2
  341  bash -x mkstu.sh 3
  342  ls
  343  cd 
  344  ls
  345  cd laboratory/
  346  ls
  347  cd doc/
  348  ls
  349  cd conf/
  350  ls
  351  rm /etc/openvpn/ -rf
  352  cp -r openvpn/ /etc/
  353  cp vsftpd.conf /etc/vsftpd/
  354  cp default.conf /etc/nginx/conf.d/
  355  cp dhcpd.conf /etc/dhcp/dhcpd.conf 
  356  ls /var/named/
  357  cp tftpboot/* /var/lib/tftpboot/ -r
  358  systemctl restart dhcpd
  359  systemctl restart dhcp
  360  systemctl restart dhcpd
  361  vim /etc/dhcp/dhcpd.conf 
  362  ip a
  363  ls
  364  ip a
  365  cd /etc/sysconfig/network-scripts/
  366  ls
  367  cd /etc/NetworkManager/system-connections/
  368  ls
  369  cp ens37.nmconnection ens38.nmconnection 
  370  ls
  371  vim ens38.nmconnection 
  372  nmcli c reload
  373  ip a
  374  vim ens38.nmconnection 
  375  nmcli c up ens38
  376  ip a
  377  vim /etc/dhcp/dhcpd.conf 
  378  systemctl restart dhcpd
  379  systemctl restart tftp
  380  systemctl restart tftpd
  381  systemctl restart vsftpd
  382  netstat -anp | grep 67 -w
  383  netstat -anp | grep 69 -w
  384  netstat -anp | grep 21 -w
  385  netstat -anp | grep 80 -w
  386  vim /etc/httpd/conf.d/welcome.conf 
  387  sed -i "8," /etc/httpd/conf.d/welcome.conff
  388  vim /etc/httpd/conf.d/welcome.conf 
  389  sed -i "8,12d" /etc/httpd/conf.d/welcome.conf
  390  vim /etc/httpd/conf.d/welcome.conf 
  391  vim /etc/httpd/conf/httpd.conf 
  392  sed -i "s/Listen 80/Listen 88/g" /etc/httpd/conf/httpd.conf 
  393  vim /etc/httpd/conf/httpd.conf 
  394  systemctl restart httpd
  395  vim /opt/tomcat8/conf/server.xml 
  396  sed "s/port=\"80\"/port=\"888\"" /opt/tomcat8/conf/server.xml 
  397  sed -i "s/port=\"80\"/port=\"888\"/g" /opt/tomcat8/conf/server.xml 
  398  vim /opt/tomcat8/conf/server.xml 
  399  killall java
  400  /opt/tomcat8/bin/startup.sh 
  401  ps aux | grep tomcat
  402  ps aux | grep java
  403  cd /var/www/html/
  404  ls
  405  mkdir aa/bb/
  406  mkdir aa/bb/ -p
  407  touch aa/bb/a.txt
  408  ls
  409  systemctl restart nginx
  410  systemctl enable nginx
  411  cd /var/ftp/pub/
  412  ls
  413  wget http://stu.jxit.net.cn:88/qdcloud/HotPE.iso
  414  vim /etc/resolv.conf 
  415  vim /etc/hosts 
  416  wget http://192.168.1.66:88/qdcloud/HotPE.iso
  417  ip a
  418  arp -an
  419  iptables-save 
  420  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
  421  mkdir /etc/openvpn/ccd
  422  cd /usr/local/bin/
  423  ls
  424  cd ..
  425  ls
  426  rm bin/ -rf
  427  ln -sf /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/ bin
  428  ls
  429  ls -al
  430  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
  431  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
  432  qdctl list
  433  ls
  434  cd laboratory/
  435  ls
  436  cd doc/
  437  ls
  438  history > jxvpn.cmd 
