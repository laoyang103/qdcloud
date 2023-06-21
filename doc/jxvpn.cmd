    1  netstat -anp | grep 80 -w
    2  systemctl stop firewalld
    3  setenforce 0
    4  systemctl disable firewalld
    5  vim /etc/sysconfig/selinux 
    6  iptables-save 
    7  iptables -F
    8  ls
    9  mkdir shell
   10  ls
   11  cd shell/
   12  ls
   13  vim jxvpn.sh
   14  cd ..
   15  ls
   16  git add shell/ instjar.cmd 
   17  git status .
   18  git commit -m '检查规则脚本'
   19  git config --global user.email "553069938@qq.com"
   20  git config --global user.name "laoyang103"
   21  ls
   22  yum -y install ocserv
   23  yum -y install epel*
   24  yum -y install ocserv
   25  ls
   26  cd /etc/ocserv/
   27  ls
   28  scp 192.168.1.6:/etc/ocserv/ocserv.conf .
   29  ls
   30  vim ocserv.conf 
   31  ls
   32  scp -r 192.168.1.6:/etc/ocserv/config-per-user .
   33  scp -r 192.168.1.6:/etc/ocserv/ocpasswd .
   34  ls
   35  systemctl restart ocserv
   36  ps aux | grep ocserv
   37  journalctl -u ocserv
   38  ls
   39  vim ocserv.conf 
   40  systemctl restart ocserv
   41  journalctl -u ocserv
   42  ps aux | grep ocserv
   43  ls
   44  cd config-per-user/
   45  ls
   46  cat wangpeng 
   47  ls
   48  rm * -rf
   49  ls
   50  cd ..
   51  ls
   52  vim ocpasswd 
   53  ls
   54  cd config-per-user/
   55  ls
   56  pwd
   57  ls
   58  cat *
   59  ls
   60  mysql -uroot -p123456 jxcms -e "select *from lab_user where role_id=2"
   61  mysql -uroot -p123456 jxcms -e "select *from lab_user where role_id=1"
   62  mysql -uroot -p123456 jxcms -e "select user_id,user_namefrom lab_user where role_id=1"
   63  mysql -uroot -p123456 jxcms -e "select user_id,user_name from lab_user where role_id=1"
   64  mysql -uroot -p123456 jxcms -e "select user_id,user_name from lab_user where role_id=1" | grep -v user_id
   65  mysql -uroot -p123456 jxcms -e "select user_id from lab_user where role_id=1" | grep -v user_id
   66  mysql -uroot -p123456 jxcms -e "select inet_ntoa('10.11.0.1')"
   67  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.1')"
   68  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.0')"
   69  mysql -uroot -p123456 jxcms -e "select inet_aton('10.12.0.0')"
   70  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.2')"
   71  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.6')"
   72  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.10')"
   73  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.10')" | grep -v inet
   74  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.2')" | grep -v inet
   75  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.6')" | grep -v inet
   76  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.10')" | grep -v inet
   77  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.18')" | grep -v inet
   78  ls
   79  cd laboratory/
   80  ls
   81  cd shell/
   82  ls
   83  bash jxvpn.sh 
   84  yum -y install bc
   85  bash jxvpn.sh 
   86  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.0.0')" | grep -v inet
   87  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.1.146')" | grep -v inet
   88  bash jxvpn.sh 
   89  iptables-save 
   90  iptables-save | wc -l
   91  bash jxvpn.sh 
   92  iptables-save | wc -l
   93  top
   94  grep aa jxvpn.sh 
   95  grep stu jxvpn.sh 
   96  iptables-save | wc -l
   97  bash jxvpn.sh 
   98  cat /tmp/iptables-curr.txt 
   99  bash jxvpn.sh 
  100  mysql -uroot -p123456 jxcms -e "select inet_aton('10.11.1.146')" | grep -v inet
  101  mysql -uroot -p123456 jxcms -e "select user_id from lab_user where role_id=1" | grep -v user_id
  102  mysql -uroot -p123456 jxcms -e "select user_id,user_name from lab_user where role_id=1" | grep -v user_id
  103  mysql -uroot -p123456 jxcms -e "select user_id,user_name from lab_user where role_id=1" | grep -v user_id | sed "s/\t/@/g"
  104  ls
  105  bash jxvpn.sh 
  106  ls
  107  iptables-save | grep 10.12.1.146
  108  iptables-save | grep 10.12.1.150
  109  iptables-save | grep 10.12.1.151
  110  env
  111  echo $PATH
  112  mvn
  113  ls
  114  yum -y install git
  115  ls
  116  git clone https://gitee.com/laoyang103/laboratory
  117  ls
  118  cd la
  119  cd laboratory/
  120  ls
  121  bash -x instjar.cmd 
  122  vim /opt/apache-maven-3.6.3/conf/settings.xml 
  123  bash -x instjar.cmd 
  124  ls
  125  vim instjar.cmd 
  126  cat instjar.cmd 
  127  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
  128  javac
  129  java
  130  yum search java-1.8.0
  131  yum -y install java-1.8.0-openjdk-devel
  132  javac
  133  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
  134  yum -y install mariadb-server
  135  mysqladmin -uroot password 123456
  136  systemctl restart mariadb
  137  mysqladmin -uroot password 123456
  138  mysql -uroot -p123456
  139  ls
  140  mysql -uroot -p123456 jxcms < jxcms.sql 
  141  ls
  142  cd shell/
  143  ls
  144  vim jxvpn.sh 
  145  ls
  146  git add jxvpn.sh 
  147  cd ..
  148  ls
  149  git status .
  150  git add instjar.cmd shell/jxvpn.sh 
  151  git status .
  152  git commit -m '生成vpn和iptables脚本'
  153  git push -u origin master
  154  ls
  155  crontab -e
  156  cd shell/
  157  ls
  158  pwd
  159  crontab -e
  160  crontab -l
  161  df
  162  yum -y install dhcpd xinetd tftp-server vsftpd 
  163  yum -y install dhcp xinetd tftp-server vsftpd 
  164  yum -y install dhcp xinet tftp-server vsftpd 
  165  yum -y install dhcp
  166  yum search dhcp
  167  yum search dhcp-server
  168  yum -y install dhcp-server
  169  vim /etc/dhcp/dhcpd.conf 
  170  yum search xinetd
  171  yum search tftp
  172  yum -y install tftp-server
  173  yum search xinet
  174  yum search xinetd
  175  cd /var/lib/tftpboot/
  176  ls
  177  scp -r 192.168.1.6://var/lib/tftpboot/* . 
  178  ls
  179  cd pxelinux.cfg/
  180  l
  181  ls
  182  vim default 
  183  ls
  184  find /etc/ -name *tftp*
  185  find /etc/ -name *ftp*
  186  yum -y install vsftpd
  187  cd /var/ftp/pub/
  188  ls
  189  scp -r 192.168.1.6://var/ftp/pub/HotPE.iso .
  190  ls
  191  systemctl restart vsftpd
  192  systemctl enable vsftpd
  193  ps aux | grep vsftpd
  194  systemctl enable dhcpd
  195  yum -y install bind bind-utils
  196  systemctl enable --now tftp.socket
  197  systemctl restart tftp
  198  netstat -anp | grep 67
  199  netstat -anp | grep 68
  200  netstat -anp | grep 69
  201  vim /usr/lib/systemd/system/tftp.service 
  202  systemctl enable tftp
  203  ls
  204  vim /etc/named.conf 
  205  vim /etc/named.rfc1912.zones 
  206  cd /var/named/
  207  ls
  208  cp named.localhost named.jxit.net.cn
  209  ls
  210  ls -al
  211  chown root:named named.jxit.net.cn 
  212  ls -al
  213  vim named.jxit.net.cn 
  214  systemctl enable named
  215  systemctl enable --now named
  216  ps aux | grep named
  217  history | grep enable
  218  reboot 
  219  systemctl enable ocserv
  220  ip a
  221  netstat -anp | grep 67 -w
  222  netstat -anp | grep 69 -w
  223  netstat -anp | grep 21 -w
  224  netstat -anp | grep 53 -w
  225  netstat -anp | grep 443 -w
  226  reboot 
  227  netstat -anp | grep 443 -w
  228  netstat -anp | grep 67 -w
  229  netstat -anp | grep 69 -w
  230  netstat -anp | grep 53 -w
  231  netstat -anp | grep 443 -w
  232  ls
  233  poweroff 
  234  ls
  235  ip a
  236  cd /etc/sysconfig/network-scripts/
  237  ls
  238  vim ifcfg-enp1s0
  239  ifdown
  240  yum provides "*bin/ifdown"
  241  yum -y install NetworkManager
  242  yum -y install NetworkManager-initscripts-updown
  243  ifdown enp1s0;ifup enp1s0
  244  ip a
  245  ip r
  246  ls
  247  ip a
  248  ls
  249  cp ifcfg-enp1s0 ifcfg-enp2s0 
  250  ip a
  251  ls
  252  vim ifcfg-enp2s0 
  253  ifdown enp2s0; ifup enp2s0
  254  ip a
  255  ip r
  256  vim /etc/dhcp/dhcpd.conf 
  257  systemctl restart dhcpd
  258  journalctl -u dhcpd
  259  netstat -anp | grep 67 -w
  260  systemctl restart dhcpd
  261  systemctl start dhcpd
  262  systemctl start dhcp
  263  systemctl start dhcpd
  264  journalctl -xeu dhcpd
  265  journalctl -xeu dhcpd --no-pager
  266  ls
  267  vim ifcfg-enp2s0 
  268  ls
  269  ip a
  270  vim ifcfg-enp2s0 
  271  ping qq.com
  272  ip a | less
  273  ethtool enp2s0
  274  ls
  275  ls
  276  ip a
  277  yum -y remove ocserv
  278  ls
  279  cd /etc/
  280  ls
  281  cd ocserv/
  282  ls
  283  rm * -rf
  284  ls
  285  cd ..
  286  ls
  287  rm ocserv/ -rf
  288  ls
  289  yum search openvpn
  290  yum -y install openvpn
  291  ls
  292  cd /etc/openvpn/
  293  ls
  294  tree
  295  yum -y install tree
  296  tree
  297  ls
  298  mv /tmp/_data/ .
  299  ls
  300  cd _data/
  301  ld
  302  ls
  303  mv checkpsw.sh ../chkpasswd.sh
  304  ls
  305  ls -al
  306  cat server.conf 
  307  mv openvpn.conf ..
  308  ls
  309  mv ccd/ crl.pem ..
  310  ls
  311  c d..
  312  ls
  313  cd ..
  314  ls
  315  cd ccd/
  316  ls
  317  cd ..
  318  ls
  319  cd client/
  320  ls
  321  cd ..
  322  ls
  323  rm client/ server/ -rf
  324  ls
  325  cat openvpn.conf 
  326  ls
  327  vim openvpn.conf 
  328  ls
  329  mv _data/pki/ ..
  330  ls
  331  mv _data/pki/ .
  332  ls
  333  tree _data/
  334  ls
  335  ls _data/
  336  rm _data/ -rf
  337  ls
  338  vim openvpn.conf 
  339  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
  340  ls
  341  mysql -uroot -p123456 -e "select inet_aton('10.16.0.0')"
  342  mysql -uroot -p123456 -e "select inet_aton('10.32.0.0')"
  343  ls
  344  cat openvpn.conf 
  345  ps aux | grep named
  346  ps aux | grep openvpn
  347  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
  348  mysql -uroot -p123456 -e "select inet_aton('10.32.0.0')"
  349  mysql -uroot -p123456 -e "select inet_ntoa('10.32.0.0')"
  350  mysql -uroot -p123456 -e "select inet_ntoa('1231231')"
  351  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
  352  mysql -uroot -p123456 jxcms -e "select user_id from lab_user where user_name="dsafasd" and 
  353  mysql -uroot -p123456 jxcms -e  select user_id from lab_user where user_name="dsafasd" and password="fadsfsadf"
  354  mysql -uroot -p123456 jxcms -e  "select user_id from lab_user where user_name="dsafasd" and password="fadsfsadf""
  355  mysql -uroot -p123456 jxcms -e  'select user_id from lab_user where user_name="dsafasd" and password="fadsfsadf"'
  356  mysql -uroot -p123456 jxcms -e  "select user_id from lab_user where user_name="dsafasd" and password="fadsfsadf""
  357  mysql -uroot -p123456 jxcms -e  'select user_id from lab_user where user_name="dsafasd" and password="fadsfsadf"'
  358  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
  359  ip a
  360  vim openvpn.conf 
  361  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
  362  ip a
  363  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
  364  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
  365  ip a
  366  setenforce 0
  367  tcpdump -i enp3s0 port 21 -nn
  368  vim /etc/vsftpd/vsftpd.conf 
  369  systemctl restart vsftpd
  370  nload
  371  yum -y install nload
  372  nload 
  373  i pa
  374  ip a
  375  ls
  376  cd laboratory/
  377  ls
  378  cd shell/
  379  ls
  380  vim jxvpn.sh 
  381  mv /etc/openvpn/chkpasswd.sh .
  382  ls
  383  ln -sf /root/laboratory/shell/chkpasswd.sh /etc/openvpn/chkpasswd.sh
  384  vim chkpasswd.sh 
  385  ls
  386  ip a
  387  ls
  388  vim chkpasswd.sh 
  389  vim jxvpn.sh 
  390  iptables-save 
  391  ls
  392  vim jxvpn.sh 
  393  chmod +x *.sh
  394  ls
  395  vim chkpasswd.sh 
  396  ln -sf /root/laboratory/shell/head.sh /etc/openvpn/head.sh
  397  ls
  398  git mv jxvpn.sh chkvpn.sh
  399  ls
  400  ln -sf /root/laboratory/shell/chkvpn.sh /etc/openvpn/chkvpn.sh
  401  ls
  402  vim chkvpn.sh 
  403  vim chkpasswd.sh 
  404  vim chkvpn.sh 
  405  vim chkpasswd.sh 
  406  ls
  407  cd ..
  408  ls
  409  cd -
  410  cat /tmp/aa.txt 
  411  echo 169869312 + 1*4 - 2 | bc
  412  mysql -uroot -p123456 -e 'select inet_aton(169869314)'
  413  mysql -uroot -p123456 -e 'select inet_ntoa(169869314)'
  414  ls
  415  cd ..
  416  ls
  417  cd /etc/openvpn/
  418  ls
  419  cd ccd/
  420  ls
  421  cat jx000001 
  422  vim jx00000
  423  vim jx000001 
  424  vim jx000002
  425  openvpn --show-valid-subnets
  426  ip a
  427  cd ..
  428  ls
  429  vim openvpn.conf 
  430  ip a
  431  ls
  432  cd ccd/
  433  ls
  434  vim jx000001 
  435  vim jx000002
  436  vim jx000001 
  437  vim jx000002
  438  ls
  439  vim ../openvpn.conf 
  440  vim jx000001 
  441  ip a
  442  mysql -uroot -p123456 jxcms 
  443  systemctl start mariadb
  444  systemctl enable mariadb
  445  mysql -uroot -p123456 jxcms 
  446  ls
  447  cd /etc/openvpn/
  448  ls
  449  cd ccd/
  450  ls
  451  ip a
  452  ls
  453  cd /etc/openvpn/
  454  ls
  455  cd ccd/
  456  ls
  457  cd ..
  458  ls
  459  vim head.sh 
  460  ls
  461  vim chkpasswd.sh 
  462  ls
  463  vim openvpn.conf 
  464  cd ccd/
  465  ls
  466  vim jx000001 
  467  vim jx000002 
  468  ls
  469  cd 
  470  ls
  471  cd laboratory/shell/
  472  ls
  473  vim chkpasswd.sh 
  474  systemctl enable httpd
  475  df
  476  df -hT
  477  tail -f nohup.out 
  478  vim /etc/sysconfig/network-scripts/ifcfg-enp2s0 
  479  cd /etc/sysconfig/network-scripts/
  480  ls
  481  cp ifcfg-enp2s0 ifcfg-enp3s0
  482  vim ifcfg-enp3s0 
  483  ls
  484  ip a
  485  vim /etc/httpd/conf/httpd.conf 
  486  systemctl restart httpd
  487  yum -y install rsync
  488  cd /var/www/html/
  489  ls
  490  du -sh *
  491  nload
  492  du -sh *
  493  cd ..
  494  ls
  495  du -sh *
  496  ip a
  497  tail -f nohup.out 
  498  whereis iptables
  499  echo $PATH
  500  ls
  501  cd laboratory/
  502  cd shell/
  503  ls
  504  vim head.sh 
  505  echo $LANG
  506  vim head.sh 
  507  tail -f nohup.out 
  508  iptables-save 
  509  arp -an
  510  iptables-save 
  511  ls
  512  df
  513  df -hT
  514  ip a
  515  iptables-save 
  516  iptables -t nat -A POSTROUTING -s 10.32.0.0/16 -j MASQUERADE
  517  iptables-save 
  518  tcpdump -i enp3s0 port 21 -nn
  519  tcpdump -i enp3s0 host 8.8.8.8 -nn
  520  ls
  521  cd la
  522  cd laboratory/
  523  ls
  524  vim jxcms.sql 
  525  mysql -uroot -p123456 jxcms < jxcms.sql 
  526  df
  527  df -hT
  528  cd /var/wh
  529  yum -y install httpd
  530  cd /var/www/html/
  531  ls
  532  cd /etc/
  533  ls
  534  vim /var/named/named.jxit.net.cn 
  535  systemctl restart named
  536  vim /var/named/named.jxit.net.cn 
  537  ip a
  538  vim /var/named/named.jxit.net.cn 
  539  ip a
  540  cd /etc/sysconfig/network-scripts/
  541  ls
  542  mv ifcfg-enp2s0 ifcfg-enp3s0
  543  ls
  544  vim ifcfg-enp3s0 
  545  ip a
  546  vim ifcfg-enp3s0 
  547  ls
  548  ip a
  549  ifdown enp3s0;ifup enp3s0
  550  ip a
  551  iptables-save 
  552  cd 
  553  ls
  554  vim a.sh 
  555  iptables-save 
  556  iptables -t nat -D POSTROUTING -s 10.32.0.0/16 -j MASQUERADE
  557  iptables-save 
  558  vim a.sh 
  559  cat a.
  560  cat a.sh 
  561  vim a.sh 
  562  iptables -t nat -A POSTROUTING -s 10.32.0.0/16 -j MASQUERADE
  563  iptables-save 
  564  ls
  565  mv a.sh iptables.sh
  566  ls
  567  mv iptables.sh laboratory/shell/
  568  ls
  569  vim /etc/rc.local 
  570  cd /etc/
  571  ls
  572  chmod +x /root/laboratory/shell/iptables.sh 
  573  ln -sf /root/laboratory/shell/iptables.sh rc.local
  574  ls -al
  575  ls -al | grep rc.local
  576  cd 
  577  ls
  578  iptables-save 
  579  ls
  580  cd laboratory/
  581  ls
  582  cd shell/
  583  ls
  584  vim chkpasswd.sh 
  585  ls
  586  rm .chkpasswd.sh.swp 
  587  ls
  588  vim chkpasswd.sh 
  589  ip a
  590  cd /etc/sysconfig/network-scripts/
  591  ls
  592  mv ifcfg-enp3s0 ifcfg-enp2s0 
  593  ls
  594  vim ifcfg-enp2s0 
  595  iptables-save 
  596  ip a
  597  iptables-save 
  598  cd /var/www/html/
  599  ls
  600  du -sh *
  601  cd ..
  602  ls
  603  df
  604  du -sh *
  605  ls
  606  iptables-save 
  607  ip a
  608  tcpdump -i tun0 host 8.8.8.8 -nn
  609  ls
  610  vim /var/named/named.jxit.net.cn 
  611  vim /etc/openvpn/openvpn.conf 
  612  ps aux | grep open
  613  killall openvpn
  614  netstat -anp | grep 53 -w
  615  vim /etc/named.conf 
  616  systemctl restart named
  617  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
  618  ip a
  619  systemctl restart named
  620  netstat -anp | grep 53 -w
  621  vim /etc/openvpn/openvpn.conf 
  622  killall openvpn
  623  history 
  624  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
  625  ip a
  626  vim /etc/openvpn/openvpn.conf 
  627  killall openvpn
  628  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
  629  ip a
  630  vim /etc/openvpn/openvpn.conf 
  631  ls
  632  ip a
  633  ls
  634  cd laboratory/
  635  ls
  636  vim jxcms.sql 
  637  ip a
  638  ip a add 192.168.1.4/24 dev enp1s0
  639  ip a
  640  ip r
  641  ip r add default via 192.168.1.
  642  ip r add default via 192.168.1.1
  643  i r
  644  ip r
  645  ip a
  646  ip a add 192.168.5.254/24 dev enp1s0
  647  ip a
  648  killall openvpn
  649  ip a
  650  ip a del 192.168.5.254/24 dev enp1s0
  651  ip a
  652  ip a add 192.168.5.254/24 dev enp3s0
  653  ip a
  654  ping qq.com
  655  iptables-save 
  656  ssh root@192.168.1.6 iptables-save > a.txt
  657  vim a.txt 
  658  ls
  659  vim a.sh 
  660  bash a.sh 
  661  iptables-save 
  662  echo 1 > /proc/sys/net/ipv4/ip_forward
  663  cat /proc/sys/net/ipv4/ip_forward
  664  ip a
  665  ipa
  666  ip a
  667  ip a del 192.168.5.185/24 dev enp1s0
  668  ip a del 192.168.5.185/24 dev enp3s0
  669  ip a
  670  ip a add 192.168.5.254/24 dev enp3s0
  671  ip a
  672  netstat -nap | grep 67
  673  netstat -nap | grep 69
  674  netstat -nap | grep 21
  675  yum -y install tcpdump
  676  ip a
  677  tcpdump -i enp3s0 net 192.168.5.0/24 -nn
  678  tcpdump -i enp3s0 net 192.168.5.0/24 and not port 80 and not port 443 -nn
  679  ls
  680  cd /var/lib/tftpboot/
  681  ls
  682  mv lpxelinux.0 5
  683  ls
  684  tcpdump -i enp3s0 port 69 -nn
  685  ip a
  686  ip a del 192.168.5.254/24 dev enp3s0
  687  ip a
  688  ip a add 10.64.5.254/24 dev enp3s0
  689  ip a
  690  iptables-save 
  691  vim a.sh
  692  ls
  693  cd 
  694  ls
  695  vim a.sh 
  696  bash a.sh
  697  ls
  698  iptables-save 
  699  vim a.sh 
  700  ls
  701  bash a.sh 
  702  iptables-save 
  703  ip a
  704  dmesg
  705  ip a
  706  dmesg 
  707  ip a
  708  ethtool tun0
  709  ip a
  710  ethtool enp3s0
  711  ethtool enp2s0
  712  rsync -av 192.168.1.6:/var/www/html/* /var/www/html/
  713  ip a
  714  killall openvpn
  715  ip a
  716  ifdown enp2s0; ifup enp2s0
  717  ip a
  718  systemctl restart dhcpd
  719  netstat -anp | grep 67 -w
  720  ip a
  721  cat /proc/sys/net/ipv4/ip_forward
  722  iptables -F
  723  tcpdump -i enp2s0 host 192.168.1.6 -nn
  724  iptables-save 
  725  iptables -t -A POSTROUTING -s 10.16.0.0/24 -j MASQUERADE
  726  iptables -t nat -A POSTROUTING -s 10.16.0.0/24 -j MASQUERADE
  727  iptables-save 
  728  iptables -F
  729  ip a
  730  ping 192.168.1.6
  731  ip r
  732  ip a
  733  iptables-save 
  734  vim a.sh
  735  bash a.sh 
  736  ip a
  737  iptables-save 
  738  iptables -t nat -D POSTROUTING -s 10.64.5.0/24 -j MASQUERADE
  739  iptables -t nat -D POSTROUTING -s 10.32.0.0/16 -j MASQUERADE
  740  iptables-save 
  741  tcpdump -i enp1s0 host 192.168.1.6 -nn
  742  iptables-save 
  743  iptables -t nat -D POSTROUTING -s 10.16.0.0/24 -j MASQUERADE
  744  iptables -t nat -A POSTROUTING -s 10.16.0.0/24 -j SNAT --to-source 192.168.1.4
  745  iptables-save 
  746  tcpdump -i enp1s0 host 192.168.1.6 -nn
  747  ip a
  748  iptables-save 
  749  iptables -t nat -D POSTROUTING -s 10.16.0.0/24 -j SNAT --to-source 192.168.1.4
  750  iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j SNAT --to-source 192.168.1.4
  751  iptables-save 
  752  ip a
  753  iptables-save 
  754  tcpdump -i enp1s0 host 192.168.1.6 -nn
  755  iptables -F
  756  tcpdump -i enp1s0 host 192.168.1.6 -nn
  757  iptables-save 
  758  -j MASQUERADE
  759  iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j MASQUERADE
  760  iptables-save 
  761  iptables -t nat -D POSTROUTING -s 10.16.0.0/16 -j SNAT --to-source 192.168.1.4
  762  ipta
  763  iptables-save 
  764  tcpdump -i enp1s0 host 192.168.1.6 -nn
  765  history 
  766  ip a
  767  cd /etc/sysconfig/network-scripts/
  768  ls
  769  vim ifcfg-enp2s0 
  770  vim /etc/dhcp/dhcpd.conf 
  771  systemctl restart dhcpd
  772  journalctl -u dhcpd
  773  ls
  774  ip a
  775  ssh root@10.16.255.3
  776  ssh root@10.16.255.2
  777  ssh root@10.16.255.1
  778  ip a
  779  ip a del 192.168.5.185/24 dev enp3s0
  780  ip a del 192.168.5.185/24 dev enp1s0
  781  ifdown enp2s0; ifup enp2s0
  782  ip a del 192.168.5.185/24 dev enp1s0
  783  ip a
  784  ssh root@10.16.255.1
  785  ip a
  786  ip a del 192.168.5.185/24 dev enp3s0
  787  ip a del 192.168.5.185/24 dev enp1s0
  788  ifdown enp2s0; ifup enp2s0
  789  ip a del 192.168.5.185/24 dev enp1s0
  790  ip a
  791  ssh root@10.16.255.2
  792  ssh root@10.16.255.3
  793  ssh root@10.16.255.2
  794  ssh root@10.16.255.3
  795  ip a
  796  ssh root@10.16.255.3
  797  ssh root@10.16.255.2
  798  ssh root@10.16.255.1
  799  ls
  800  cd laboratory/
  801  ls
  802  git status .
  803  ls
  804  rm target/ -rf
  805  ls
  806  du -sh *
  807  git add *
  808  git status .
  809  git commit -m '整理脚本'
  810  lls
  811  ls
  812  cd shell/
  813  ls
  814  vim chkvpn.sh 
  815  cp chkvpn.sh chkstu.sh
  816  vim chkstu.sh 
  817  ssh root@10.16.255.1 "brctl show jx00000001"
  818  ssh root@10.16.255.1 "brctl show jx00000001" | wc -l
  819  ssh root@10.16.255.1 "brctl show jx00000001" | head -n 1 | wc -l
  820  ssh root@10.16.255.1 "ip br-jx00000001" | head -n 1 | wc -l
  821  ssh root@10.16.255.1 "brctl show br-jx00000001" | head -n 1 | wc -l
  822  ssh root@10.16.255.1 "brctl show br-jx00000001" | head -n 1 
  823  ssh root@10.16.255.1 "brctl show br-jx00000001"
  824  ssh root@10.16.255.1 "brctl show br-jx00000001" | wc -l
  825  ssh root@10.16.255.1 "brctl show br-jx00000001 | grep vx-jx00000001"
  826  ssh root@10.16.255.1 "brctl show br-jx00000001 | grep vx-jx00000001" | wc -l
  827  ls
  828  cd laboratory/
  829  ls
  830  cd shell/
  831  ls
  832  bash -x chkstu.sh 
  833  bash chkstu.sh 
  834  bash -x chkstu.sh 
  835  ls
  836  cd laboratory/
  837  ls
  838  ssh-copy-id root@10.16.255.1
  839  cd ~/.ssh/
  840  ls
  841  scp 192.168.1.6:/root/.ssh/id_rsa* .
  842  ls
  843  cd 
  844  ssh-copy-id root@10.16.255.1
  845  ssh-copy-id root@10.16.255.2
  846  ssh-copy-id root@10.16.255.3
  847  ssh 'root@10.16.255.3'
  848  yum -y install ansible
  849  ls
  850  cd laboratory/
  851  ls
  852  cd shell/
  853  ls
  854  vim chkstu.sh 
  855  virsh
  856  yum provides "*bin/virsh"
  857  yum -y install libvirt-client
  858  virsh -c qemu+tcp://10.16.255.3/system list 
  859  virsh -c qemu+tcp://10.16.255.1/system list 
  860  virsh -c qemu+tcp://10.16.255.2/system list 
  861  virsh -c qemu+tcp://10.16.255.2/system list --all
  862  virsh -c qemu+tcp://10.16.255.1/system list --all
  863  virsh -c qemu+tcp://10.16.255.2/system list --all
  864  ssh root@10.16.255.2
  865  ssh root@10.16.255.3
  866  ssh root@10.16.255.2
  867  ssh root@10.16.255.1
  868  ssh root@10.16.255.2
  869  ssh root@10.16.255.1
  870  ssh root@10.16.255.3
  871  df
  872  df -hT
  873  cd /var/
  874  ls
  875  du -sh *
  876  cd www/
  877  ls
  878  df -hT
  879  rm /dafsadsf
  880  mkdir /data/vdisk
  881  mkdir /data/vdisk -p
  882  ls
  883  cd /data/vdisk/
  884  ls
  885  cd 
  886  ls
  887  cd 
  888  ls
  889  cd laboratory/
  890  ls
  891  cd shell/
  892  ls
  893  cp chkstu.sh mkstu.sh
  894  ls
  895  vim mkstu.sh 
  896  ls
  897  cd ..
  898  ls
  899  vim jxcms.sql 
  900  mysql -uroot -p123456 jxcms < jxcms.sql 
  901  vim jxcms.sql 
  902  mysql -uroot -p123456 jxcms < jxcms.sql 
  903  vim jxcms.sql 
  904  date
  905  vim jxcms.sql 
  906  mysql -uroot -p123456 jxcms < jxcms.sql 
  907  vim jxcms.sql 
  908  mysql -uroot -p123456 jxcms < jxcms.sql 
  909  vim jxcms.sql 
  910  mysql -uroot -p123456 jxcms < jxcms.sql 
  911  vim jxcms.sql 
  912  mysql -uroot -p123456 jxcms < jxcms.sql 
  913  git diff jxcms.sql 
  914  ls
  915  cd /data/vdisk/
  916  ls
  917  scp -r 192.168.1.6:/var/lib/libvirt/images/mbvm01.qcow2 .
  918  ls
  919  scp -r 192.168.1.6:/var/lib/libvirt/images/stuvm .
  920  ls
  921  cd stuvm/
  922  ls
  923  ls -al
  924  cd ..
  925  ls
  926  传递
  927  cd 
  928  ls
  929  cd laboratory/
  930  ls
  931  vim jxcms.sql 
  932  ls
  933  cd -
  934  ls
  935  cd /data/vdisk/
  936  ls
  937  cd stuvm/
  938  ls
  939  ls -al
  940   libguestfs-tools
  941  yum -y install libguestfs-tools
  942  virt-filesystems
  943  yum provides "*bin/virt-filesystems"
  944  yum -y install guestfs-tools
  945  ls
  946  cd ..
  947  ls
  948  scp -r 192.168.1.6:/var/lib/libvirt/images/*0321* .
  949  echo $HISTSIZE
  950  vim ~/.bashrc 
  951  source ~/.bashrc 
  952  echo $HISTSIZE
  953  ls
  954  mv mbstu11-0321.qcow2 mbstu11.qcow2 
  955  ls
  956  qemu-img create -b mbstu11.qcow2 -f qcow2 test.qcow2
  957  ls
  958  qemu-img create -b mbstu11.qcow2 -f qcow2 test.qcow2
  959  qemu-img create
  960  qemu-img create --help
  961  qemu-img create -b mbstu11.qcow2 -F qcow2 -f qcow2 test.qcow2
  962  ls
  963  ls -al
  964  virt-filesystems test.qcow2 
  965  virt-filesystems -a test.qcow2 
  966  systemctl restart libvirtd
  967  yum -y install libvirtd
  968  yum -y install libvirt-bin
  969  yum search libvirt
  970  yum -y install virt-manager
  971  systemctl restart libvirtd
  972  systemctl restart libvirt
  973  virt-filesystems -a test.qcow2 
  974  virsh list
  975  systemctl restart libvirtd
  976  qemu-img create -b mbstu11.qcow2 -f qcow2 test.qcow2
  977  systemctl restart libvirtd
  978  yum list installed qemu-img wget libvirt virt-install qemu-kvm
  979  yum -y install qemu-img wget libvirt virt-install qemu-kvm
  980  systemctl restart libvirtd
  981  virt-filesystems -a test.qcow2 
  982  guestmount -a test.qcow2 -m /dev/sda1 /mnt
  983  df
  984  cd /mnt/
  985  ls
  986  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
  987  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth1
  988  cd 
  989  ls
  990  cd /data/vdisk/
  991  ls
  992  umount /mnt
  993  df
  994  ls
  995  ls -al
  996  du -sh *
  997  guestmount -a test.qcow2 -m /dev/sda1 /mnt
  998  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth1
  999  ls
 1000  vim /etc/profile
 1001  history 
 1002  echo $HISTSIZE
 1003  ls
 1004  history > histcmd-0609.cmd
 1005  ls
 1006  rm a* -rf
 1007  ls
 1008  df
 1009  virsh list 
 1010  umount /mnt
 1011  virsh list 
 1012  top
 1013  ping 10.16.255.1
 1014  ping 10.16.255.2
 1015  ping 10.16.255.3
 1016  ssh root@10.16.255.1
 1017  ssh root@10.16.255.2
 1018  ssh root@10.16.255.3
 1019  mysql -uroot -p123456 jxcms -e "select *from lab_vm"
 1020  mysql -uroot -p123456 jxcms -e "select ipaddr from lab_vm"
 1021  mysql -uroot -p123456 jxcms -e "select ipaddr from lab_vm" | grep -v ipaddr
 1022  mysql -uroot -p123456 jxcms -e "select ipaddr from lab_hpv" | grep -v ipaddr 
 1023  cd /data/vdisk/
 1024  ls
 1025  history | grep virt
 1026  history | grep qemu
 1027  history | grep virt
 1028  history | grep qemu
 1029  history | grep mount
 1030  ls
 1031  rm test.qcow2 -rf
 1032  qemu-img create -b mbstu11.qcow2 -f qcow2 test.qcow2
 1033  qemu-img create -b mbstu11.qcow2 -F qcow2 -f qcow2 test.qcow2
 1034  ls
 1035  guestmount -a test.qcow2 -m /dev/sda1 /mnt
 1036  cat /mnt/etc/sysconfig/network-scripts/ifcfg-eth1 
 1037  sed -e "s/IPADDR=192.168.10.11/IPADDR=10.16.0.2/g" /mnt/etc/sysconfig/network-scripts/ifcfg-eth1 
 1038  sed -e "s/IPADDR=..*$/IPADDR=10.16.0.2/g" /mnt/etc/sysconfig/network-scripts/ifcfg-eth1 
 1039  df
 1040  umount /mnt
 1041  virsh list 
 1042  virsh list --all
 1043  ls
 1044  cd laboratory/
 1045  ls
 1046  cd shell/
 1047  ls
 1048  vim mkstu.sh 
 1049  ls
 1050  vim mkstu.sh 
 1051  grep num2ip -rwn 
 1052  grep num2ip -rwn .
 1053  vim chkvpn.sh 
 1054  vim chkpasswd.sh 
 1055  vim head.sh 
 1056  vim mkstu.sh 
 1057  ls
 1058  ping 10.16.255.3
 1059  ping 10.16.255.2
 1060  ping 10.16.255.1
 1061  ping 10.16.255.3
 1062  ls
 1063  cd laboratory/
 1064  ls
 1065  mysql -uroot -p123456 jxcms "select *from lab_vm"
 1066  mysql -uroot -p123456 jxcms -e "select *from lab_vm"
 1067  ls
 1068  vim jxcms.sql 
 1069  mysql -uroot -p123456 jxcms < jxcms.sql 
 1070  ip a
 1071  poweroff 
 1072  ls
 1073  cd laboratory/
 1074  ls
 1075  cd ..
 1076  ls
 1077  mv laboratory/ jxcloud
 1078  ls
 1079  cd jxcloud/
 1080  ls
 1081  cd shell/
 1082  ls
 1083  vim mkstu.sh 
 1084  lsblk 
 1085  cd /data/
 1086  ls
 1087  du -sh *
 1088  cd vdisk/
 1089  ls
 1090  du -sh 
 1091  du -sh *
 1092  ls
 1093  cd ..
 1094  ls
 1095  mv vdisk/ /tmp/
 1096  ls
 1097  fdisk /dev/sdb
 1098  mkfs.xfs /dev/sdb
 1099  mount /dev/sdb /data/
 1100  ls
 1101  df
 1102  df -hT
 1103  cd /data/
 1104  ls
 1105  mv /tmp/vdisk/ .
 1106  ls
 1107  du -sh *
 1108  cd vdisk/
 1109  ls
 1110  du -sh *
 1111  vim /etc/fstab 
 1112  df
 1113  lsblk 
 1114   
 1115  ls
 1116  rm test.qcow2 -rf
 1117  ls
 1118  cd jxcloud/
 1119  ls
 1120  cd /data/vdisk/
 1121  ls
 1122  mv /tmp/jx-2210-45.xml .
 1123  ls
 1124  vim jx-2210-45.xml 
 1125  cp jx-2210-45.xml jxvmr.xml
 1126  ls
 1127  cp jxvmr.xml jxvm.xml 
 1128  ls
 1129  rm jx-2210-45.xml -rf
 1130  ls
 1131  vim jxvmr.xml 
 1132  ls
 1133  vim jxvm.xml 
 1134  ls
 1135  mv jxvmr.xml mbvmr.xml
 1136  ls
 1137  mv jxvm.xml mbvm.xml
 1138  ls
 1139  mv mbstu11.qcow2 mbvmr.qcow2 
 1140  mv mbvm01.qcow2 mbvm.qcow2
 1141  ls
 1142  ls -al
 1143  ls
 1144  mv mbvm.qcow2 mbvm01.qcow2
 1145  ls
 1146  ls -al
 1147  ls
 1148  echo $RANDOM | md5sum | sed 's/../&:/g' | cut -c 1-17
 1149  ls
 1150  cd 
 1151  ls
 1152  cd jxcloud/
 1153  ls
 1154  cd shell/
 1155  ls
 1156  bash -x mkstu.sh 101
 1157  ln -sf /root/jxcloud/shell/head.sh /etc/openvpn/head.sh
 1158  ln -sf /root/jxcloud/shell/chkpasswd.sh /etc/openvpn/chkpasswd.sh
 1159  ln -sf /root/jxcloud/shell/chkvpn.sh /etc/openvpn/chkvpn.sh
 1160  ls -al
 1161  bash -x mkstu.sh 101
 1162  ls
 1163  bash -x mkstu.sh 101
 1164  ls
 1165  bash -x mkstu.sh 101
 1166  ls
 1167  cd /data/vdisk/
 1168  ls
 1169  cd jx21080001/
 1170  ls
 1171  vim jx21080001.xml 
 1172  ls
 1173  cd ..
 1174  ls
 1175  cd jx21080001/
 1176  ls
 1177  vim jx21080001.xml 
 1178  lsls
 1179  ls
 1180  cd ..
 1181  ls
 1182  cd jx21080001/
 1183  ls
 1184  vim jx21080001nginx-11.xml
 1185  ls
 1186  cd ..
 1187  ls
 1188  cd jx21080001/
 1189  ls
 1190  vim jx21080001.xml 
 1191  vim jx21080001-nginx-11.xml 
 1192  virsh define jx21080001-nginx-11.xml 
 1193  echo 08:00:27:$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//')
 1194  cd ..
 1195  ls
 1196  cd jx21080001/
 1197  ls
 1198  virsh define jx21080001-nginx-11.xml 
 1199  cd ..
 1200  ls
 1201  cd jx21080001/
 1202  ls
 1203  du -sh *
 1204  ls
 1205  virsh define jx21080001-nginx-11.xml 
 1206  virsh list 
 1207  yum -y install nfs-utils rpcbind
 1208  showmount -e localhost
 1209  systemctl restart rpcbind nfs
 1210  systemctl restart rpcbind nfsd
 1211  systemctl restart rpcbind
 1212  showmount -e localhost
 1213  systemctl restart nfsd
 1214  vim /etc/exports
 1215  systemctl restart nfsd
 1216  systemctl restart nfs
 1217  systemctl restart rpcbind
 1218  showmount -e localhost
 1219  systemctl restart nfs-server rpcbind
 1220  systemctl enable rpcbind && systemctl enable nfs-server
 1221  showmount -e localhost
 1222  cd jxcloud/
 1223  ls
 1224  cd shell/
 1225  ls
 1226  vim mkstu.sh 
 1227  ls -al
 1228  ls
 1229  vim mkstu.sh 
 1230  ls
 1231  vim mkstu.sh 
 1232  cd jxcloud/
 1233  ls
 1234  vim jxcms.sql 
 1235  mysql -uroot -p123456 jxcms < jxcms.sql 
 1236  vim jxcms.sql 
 1237  mysql -uroot -p123456 jxcms < jxcms.sql 
 1238  vim jxcms.sql 
 1239  ls
 1240  cd /data/vdisk/
 1241  ls
 1242  du -sh *
 1243  cd 
 1244  ls
 1245  cd jxcloud/
 1246  ls
 1247  vim jxcms.sql 
 1248  ls
 1249  cd jxcloud/
 1250  ls
 1251  cd shell/
 1252  ls
 1253  cd chk
 1254  vim chkstu.sh 
 1255  bash -x chkstu.sh 
 1256  vim chkstu.sh 
 1257  bash -x chkstu.sh 
 1258  vim chkstu.sh 
 1259  bash -x chkstu.sh 
 1260  vim head.sh 
 1261  ls /data/vdisk//jx21080001/jx21080001.qcow2
 1262  cd /data/vdisk/jx21080001/
 1263  ls
 1264  ls jx21080001.qcow2 
 1265  ls
 1266  iptables-save 
 1267  iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j MASQUERADE
 1268  ip a
 1269  iptables-save 
 1270  iptables -F
 1271  iptables-save 
 1272  cat /proc/sys/net/ipv4/ip_forward
 1273  echo 1 /proc/sys/net/ipv4/ip_forward
 1274  echo 1 > /proc/sys/net/ipv4/ip_forward
 1275  ls
 1276  cd ..
 1277  ls
 1278  vim mbvm.xml 
 1279  vim mbvmr.xml 
 1280  ls
 1281  cd 
 1282  ls
 1283  cd jxcloud/
 1284  ls
 1285  vim jxcms.sql 
 1286  mysql -uroot -p123456 jxcms < jxcms.sql 
 1287  ls
 1288  cd /data/vdisk/
 1289  ls
 1290  cd jx21080001/
 1291  ls
 1292  cd 
 1293  ls
 1294  cd jxcloud/shell/
 1295  ls
 1296  vim mkstu.sh 
 1297  bash -x mkstu.sh 101
 1298  ls
 1299  vim mkstu.sh 
 1300  bash -x mkstu.sh 101
 1301  ls
 1302  ln -sf /data/vdisk/mbvmr.qcow2 /var/lib/libvirt/images/mbvmr.qcow2
 1303  ls -al /var/lib/libvirt/images/
 1304  vim mkstu.sh 
 1305  bash -x mkstu.sh 101
 1306  ls
 1307  vim mkstu.sh 
 1308  bash -x mkstu.sh 101
 1309  vim mkstu.sh 
 1310  bash -x mkstu.sh 101
 1311  vim mkstu.sh 
 1312  bash -x mkstu.sh 101
 1313  cd jxcloud/shell/
 1314  ls
 1315  bash -x chkstu.sh 
 1316  ls
 1317  ls
 1318  ssh root@10.16.255.1
 1319  iptables-save 
 1320  echo 1 > /proc/sys/net/ipv4/ip_forward
 1321  ls
 1322  cd jxcloud/
 1323  ls
 1324  cd shell/
 1325  ls
 1326  vim chkstu.sh 
 1327  bash chkstu.sh 
 1328  bash -x chkstu.sh 
 1329  ls
 1330  vim chkstu.sh 
 1331  bash -x chkstu.sh 
 1332  ls
 1333  cd ..
 1334  ls
 1335  git status .
 1336  it add shell/ jxcms.sql 
 1337  git add shell/ jxcms.sql 
 1338  git status .
 1339  git commit -m '创建学生环境脚本'
 1340  git push -u origin master
 1341  ping qq.com
 1342  ip a
 1343  tcpdump -i enp1s0 port 53 -nn
 1344  ls
 1345  cd shell/
 1346  ls
 1347  vim mkstu.sh 
 1348  virsh -c qemu+tcp://10.16.255.1/system info jx21080001-nginx-11
 1349  virsh help
 1350  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080001-nginx-11
 1351  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080001-nginx-12
 1352  ls
 1353  vim mkstu.sh 
 1354  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080001-nginx-12
 1355  echo $?
 1356  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080001-nginx-11
 1357  echo $?
 1358  vim mkstu.sh 
 1359  bash -x mkstu.sh 101
 1360  ls
 1361  vim mkstu.sh 
 1362  bash -x mkstu.sh 101
 1363  ls
 1364  vim mkstu.sh 
 1365  vim a.sh
 1366  bash a.sh 
 1367  vim a.sh
 1368  bash a.sh 
 1369  ls
 1370  vim mkstu.sh 
 1371  ./mkstu.sh 101
 1372  ping 10.16.1.146
 1373  ssh -p 1122 root@10.16.1.146
 1374  ls
 1375  vim mkstu.sh 
 1376  vim a.sh 
 1377  ./mkstu.sh 101
 1378  ssh -p 1122 root@10.16.1.146
 1379  ssh -p 8122 root@10.16.1.146
 1380  ls
 1381  bash a.sh 
 1382  ls
 1383  vim chkstu.sh 
 1384  bash -x chkstu.sh 
 1385  iptables-save 
 1386  ls
 1387  vim iptables.sh 
 1388  vim chkvpn.sh 
 1389  bash -x chkvpn.sh 
 1390  iptables-save 
 1391  ls
 1392  vim chkvpn.sh 
 1393  bash chkvpn.sh 
 1394  iptables-save 
 1395  vim chkvpn.sh 
 1396  vim head.sh 
 1397  vim chkvpn.sh 
 1398  bash chkvpn.sh 
 1399  iptables-save 
 1400  iptables-save > a.sh
 1401  vim a.sh 
 1402  bash a.sh 
 1403  iptables-save 
 1404  vim a.sh 
 1405  bash -x a.sh 
 1406  iptables-save 
 1407  vim a.sh 
 1408  bash -x a.sh 
 1409  iptables-save | less
 1410  iptables-save > a.sh
 1411  vim a.sh 
 1412  bash -x a.sh 
 1413  iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j MASQUERADE
 1414  ls
 1415  vim chkvpn.sh 
 1416  bash -x chkvpn.sh 
 1417  vim chkvpn.sh 
 1418  bash -x chkvpn.sh 
 1419  ls
 1420  vim chkvpn.sh 
 1421  ls
 1422  vim chkvpn.sh 
 1423  bash -x chkvpn.sh 
 1424  vim chkvpn.sh 
 1425  bash -x chkvpn.sh 
 1426  ls
 1427  vim head.sh 
 1428  bash -x chkvpn.sh 
 1429  ls
 1430  vim chkvpn.sh 
 1431  bash -x chkvpn.sh 
 1432  iptables-save | head -n 10
 1433  cd /etc/openvpn/ccd/
 1434  ls
 1435  vim jx00000001 
 1436  mv jx00000001 jx21080001
 1437  ls
 1438  rm jx00000* -rf
 1439  ls
 1440  vim jx21080001 
 1441  ip a
 1442  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 1443  killall openvpn
 1444  cd 
 1445  ls
 1446  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 1447  ls
 1448  tail -f nohup.out 
 1449  ip a
 1450  cd /data/vdisk/
 1451  ls
 1452  guestmount -a mbvmr.qcow2 -m /dev/sda1 /mnt
 1453  cd /mnt/
 1454  ls
 1455  vim etc/rc.local 
 1456  ls
 1457  cd etc/
 1458  ls
 1459  find . -name *.target
 1460  cd systemd/system
 1461  ls
 1462  cd multi-user.target.wants/
 1463  ls
 1464  cd ..
 1465  ls
 1466  cd ..
 1467  ls
 1468  cd ..
 1469  ls
 1470  cd /etc/
 1471  ls
 1472  vim sysctl.d/99-sysctl.conf 
 1473  vim rc.local 
 1474  ls
 1475  pwd
 1476  cd /mnt/
 1477  ls
 1478  cd etc/
 1479  ls
 1480  vim rc.local 
 1481  pwd
 1482  cd ..
 1483  cd /data/vdisk/
 1484  ls
 1485  umount /mnt
 1486  ls
 1487  ls -al
 1488  ls
 1489  guestmount -a mbvmr.qcow2 -m /dev/sda1 /mnt
 1490  cd /mnt/etc/
 1491  vim rc.local 
 1492  umount /mnt
 1493  cd ..
 1494  ls
 1495  cd /data/vdisk/
 1496  ls
 1497  umount /mnt
 1498  ls -al
 1499  ls
 1500  ls | wc -l
 1501  iptables-save | grep POST
 1502  iptables -t nat -A POSTROUTING -s 10.32.0.0/16 -j MASQUERADE
 1503  iptables-save | grep POST
 1504  iptables-save | head -n 10
 1505  ip a
 1506  tcpdump -i tun0 host 10.32.1.146 -nn
 1507  iptables-save | head -n 10
 1508  ssh root@10.16.255.2
 1509  ssh root@10.16.255.3
 1510  iptables-save | head -n 10
 1511  ping 10.10.10.11
 1512  ip e
 1513  ip r
 1514  ip a
 1515  ip r
 1516  ip r del 10.10.10.0/24
 1517  ip r add 10.10.10.0/24 via 10.16.1.146
 1518  ip r
 1519  ping 10.10.10.11
 1520  ls
 1521  iptables-save | head -n 20
 1522  ls
 1523  vim a.sh
 1524  iptables-save | grep PRER > a.sh
 1525  vim a.sh 
 1526  bash -x a.sh 
 1527  iptables-save 
 1528  ls
 1529  cd jxcloud/
 1530  ls
 1531  cd shell/
 1532  ls
 1533  vim iptables.sh 
 1534  ls
 1535  vim chkvpn.sh 
 1536  bash -x chkvpn.sh 
 1537  iptables-save 
 1538  vim a.sh
 1539  bash -x a.sh 
 1540  iptables-save 
 1541  ip a
 1542  ip r
 1543  ip r del 10.10.10.0/24
 1544  ip r
 1545  ls
 1546  ssh root@10.16.255.3
 1547  ssh root@10.16.255.2
 1548  ssh root@10.16.255.1
 1549  ssh root@10.16.255.2
 1550  ssh root@10.16.1.146
 1551  ssh root@10.16.1.146
 1552  ip a
 1553  iptables-save 
 1554  ip a
 1555  tcpdump -i enp2s0 port 1122 -nn
 1556  ssh -p 1122 root@10.16.1.146
 1557  ssh -p 22 root@10.16.1.146
 1558  ssh -p 1122 root@10.16.1.146
 1559  tcpdump -i enp2s0 port 1122 -nn
 1560  iptables-save 
 1561  iptables -t nat -A PREROUTING -s 10.32.1.146/32 -d 10.10.10.12/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination 10.16.1.146:1222
 1562  iptables-save 
 1563  ip a
 1564  tcpdump -i tun0 port 22 -nn
 1565  iptables-save 
 1566  iptables -t nat -A PREROUTING -s 10.32.1.150/32 -d 10.10.10.11/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination 10.16.1.150:1122
 1567  iptables-save 
 1568  ssh -p 1122 root@10.16.1.150
 1569  ssh root@10.16.1.150
 1570  ssh -p 1122 root@10.16.1.150
 1571  ssh root@10.16.255.1
 1572  ssh root@10.16.255.2
 1573  ssh root@10.16.255.3
 1574  ssh root@10.16.255.2
 1575  ssh root@10.16.255.1
 1576  iptables-save 
 1577  ip r
 1578  ip a
 1579  ssh root@10.16.255.1
 1580  virsh -c qemu+tcp://10.16.255.2/system info jx21080002-nginx-11
 1581  virsh -c qemu+tcp://10.16.255.2/system dominfo jx21080002-nginx-11
 1582  virsh -c qemu+tcp://10.16.255.2/system dominfo jx21080002-nginx-11 | grep State
 1583  virsh -c qemu+tcp://10.16.255.2/system dominfo jx21080002-nginx-12 | grep State
 1584  virsh -c qemu+tcp://10.16.255.2/system dominfo jx21080002-nginx-13 | grep State
 1585  virsh -c qemu+tcp://10.16.255.2/system dominfo jx21080002-nginx-15 | grep State
 1586  virsh -c qemu+tcp://10.16.255.2/system dominfo jx21080002-nginx-12 | grep State
 1587  virsh -c qemu+tcp://10.16.255.2/system dominfo jx21080002-nginx-12 | grep State | awk '{print $2}'
 1588  virsh -c qemu+tcp://10.16.255.2/system dominfo jx21080002-ops-71 | grep State | awk '{print $2}'
 1589  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080002-ops-71 | grep State | awk '{print $2}'
 1590  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080002 | grep State | awk '{print $2}'
 1591  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080002
 1592  virsh -c qemu+tcp://10.16.255.1/system start jx21080002
 1593  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080002-ops-71 | grep State | awk '{print $2}'
 1594  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080002-ops-71 
 1595  ssh root@10.16.255.1
 1596  virsh -c qemu+tcp://10.16.255.1/system dominfo jx21080002-ops-81 
 1597  mysql -uroot -p123456 jxcms 
 1598  echo 169869714 - 169869312 | bc
 1599  echo 169869714 - 169869312 + 2| bc
 1600  echo (169869714 - 169869312 + 2) / 4| bc
 1601  echo (169869714 - 169869312 + 2)/4| bc
 1602  echo (169869714-169869312+2)/4| bc
 1603  echo (169869714-169869312+2)/4 | bc
 1604  echo "(169869714-169869312+2)/4" | bc
 1605  cd 
 1606  ls
 1607  cd jxcloud/
 1608  ls
 1609  vim jxcms.sql 
 1610  ssh root@10.16.255.1
 1611  ssh root@10.16.255.2
 1612  ls
 1613  cd shell/
 1614  ls
 1615  vim head.sh 
 1616  echo jx21080001-nginx-11 | sed "s/jx[0-9]{8}/jx-/g" | sed "s/$/.qcow2/g"
 1617  echo jx21080001-nginx-fff-11 | sed "s/jx[0-9]{8}/jx-/g" | sed "s/$/.qcow2/g"
 1618  echo jx21080001-nginx-11 | sed "s/jx[0-9]{8}/jx-/g" | sed "s/$/.qcow2/g"
 1619  echo jx21080001-nginx-11 | sed "s/jx[0-9]{7}/jx-/g" | sed "s/$/.qcow2/g"
 1620  echo jx21080001-nginx-11 | sed "s/jx[0-9]{7}-/jx-/g" | sed "s/$/.qcow2/g"
 1621  echo jx21080001-nginx-11 | sed "s/jx[0-9]{7}-/jx-/g""
 1622  echo jx21080001-nginx-11 | sed "s/jx[0-9]{7}-/jx-/g"
 1623  echo jx21080001-nginx-11 | sed "s/jx[0-9]{7}-/jx-/g""
 1624  echo jx21080001-nginx-11 | sed "s/jx[0-9][]-/jx-/g"
 1625  echo jx21080001-nginx-11 | sed "s/jx[0-9]{0-9}-/jx-/g""
 1626  echo jx21080001-nginx-11 | sed "s/jx[0-9]{0-9}-/jx-/g"
 1627  echo jx21080001-nginx-11 | sed 
 1628  echo jx21080001-nginx-11 | sed "s/jx[0-9]{0-9}-/jx-/g"
 1629  echo jx21080001-nginx-11 | sed "s/jx[0-9]-/jx-/g"
 1630  echo jx21080001-nginx-11 | sed "s/jx\[0-9\]-/jx-/g"
 1631  echo jx21080001-nginx-11 | sed "s/jx-/jx-/g"
 1632  echo jx21080001-nginx-11 | sed "s/jx-//g"
 1633  echo jx21080001-nginx-11 | sed "s/jx//g"
 1634  ssh root@10.16.255.2
 1635  ls
 1636  cd jxcloud/
 1637  ls
 1638  cd shell/
 1639  ls
 1640  vim chkpasswd.sh 
 1641  iptables-save 
 1642  vim a.sh
 1643  bash -x a.sh 
 1644  iptables-save 
 1645  vim a.sh
 1646  bash -x a.sh 
 1647  iptables-save 
 1648  ls
 1649  vim chkpasswd.sh 
 1650  ls
 1651  vim chkpasswd.sh 
 1652  ls
 1653  vim chkstu.sh 
 1654  git rm chkstu.sh 
 1655  git rm chkstu.sh  -f
 1656  ls
 1657  vim chkvpn.sh 
 1658  vim chkpasswd.sh 
 1659  git rm chkvpn.sh 
 1660  git rm chkvpn.sh -f
 1661  ls
 1662  vim iptables.sh 
 1663  ls
 1664  vim mkstu.sh 
 1665  vim head.sh 
 1666  vls
 1667  ls
 1668  vim chkpasswd.sh 
 1669  ls
 1670  bash -x chkpasswd.sh 
 1671  ls
 1672  vim chkpasswd.sh 
 1673  bash -x chkpasswd.sh 
 1674  ls
 1675  vim chkpasswd.sh 
 1676  bash -x chkpasswd.sh 
 1677  vim chkpasswd.sh 
 1678  vim head.sh 
 1679  bash -x chkpasswd.sh 
 1680  vim head.sh 
 1681  bash -x chkpasswd.sh 
 1682  vim head.sh 
 1683  vim chkpasswd.sh 
 1684  bash -x chkpasswd.sh 
 1685  vim chkpasswd.sh 
 1686  bash -x chkpasswd.sh 
 1687  vim chkpasswd.sh 
 1688  bash -x chkpasswd.sh 
 1689  vim chkpasswd.sh 
 1690  ls
 1691  vim listvm.sh
 1692  vi listvm.sh
 1693  cat > listvm.sh << EOF
 1694  #!/bin/bash 
 1695  # REMOTE_ADDR="192.168.10.98"
 1696  source head.sh
 1697  echo "<h1>虚拟系统管理器</h1>"
 1698  echo "<h2>学生机：$stuname</h2>"
 1699  echo "<table border=\"1\">"
 1700  echo "  <tr>"
 1701  echo "    <th>虚拟机名称</th>"
 1702  echo "    <th>状态</th>"
 1703  echo "    <th>操作</th>"
 1704  echo "  </tr>"
 1705  for vm in ${vmlist[@]}; do
 1706    state=$(virsh dominfo $vm | grep running)
 1707    echo "<tr>"
 1708    echo "<td>$vm</td>"
 1709    if [ -n "$state" ]; then
 1710      echo "<td><font color="green">已开启</font></td>"
 1711      echo "<td>"
 1712      echo "<a href="/cgi-bin/doVm.sh?action=destroy\&name=$vm">关闭</a>"
 1713      echo "<a href="/cgi-bin/doVm.sh?action=connect\&name=$vm">连接</a>"
 1714      echo "</td>"
 1715    else 
 1716      echo "<td><font color="red">已关闭</font></td>"
 1717      echo "<td>"
 1718      echo "<a href="/cgi-bin/doVm.sh?action=start\&name=$vm">开启</a>"
 1719      echo "<a href="/cgi-bin/doVm.sh?action=reset\&name=$vm">重置</a>"
 1720      echo "</td>"
 1721    fi
 1722    echo "</tr>"
 1723  done
 1724  echo "<a href="/cgi-bin/dhcp.sh">恢复11错误环境</a>"
 1725  echo "<a href="/cgi-bin/ping.sh">恢复21错误环境</a>"
 1726  echo "<a href="/cgi-bin/tftp.sh">恢复12错误环境</a>"
 1727  echo "</table>"
 1728  #!/bin/bash 
 1729  # REMOTE_ADDR="192.168.10.98"
 1730  source head.sh
 1731  echo "<h1>虚拟系统管理器</h1>"
 1732  echo "<h2>学生机：$stuname</h2>"
 1733  echo "<table border=\"1\">"
 1734  echo "  <tr>"
 1735  echo "    <th>虚拟机名称</th>"
 1736  echo "    <th>状态</th>"
 1737  echo "    <th>操作</th>"
 1738  echo "  </tr>"
 1739  for vm in ${vmlist[@]}; do
 1740    state=$(virsh dominfo $vm | grep running)
 1741    echo "<tr>"
 1742    echo "<td>$vm</td>"
 1743    if [ -n "$state" ]; then
 1744      echo "<td><font color="green">已开启</font></td>"
 1745      echo "<td>"
 1746      echo "<a href="/cgi-bin/doVm.sh?action=destroy\&name=$vm">关闭</a>"
 1747      echo "<a href="/cgi-bin/doVm.sh?action=connect\&name=$vm">连接</a>"
 1748      echo "</td>"
 1749    else 
 1750      echo "<td><font color="red">已关闭</font></td>"
 1751      echo "<td>"
 1752      echo "<a href="/cgi-bin/doVm.sh?action=start\&name=$vm">开启</a>"
 1753      echo "<a href="/cgi-bin/doVm.sh?action=reset\&name=$vm">重置</a>"
 1754      echo "</td>"
 1755    fi
 1756    echo "</tr>"
 1757  done
 1758  echo "<a href="/cgi-bin/dhcp.sh">恢复11错误环境</a>"
 1759  echo "<a href="/cgi-bin/ping.sh">恢复21错误环境</a>"
 1760  echo "<a href="/cgi-bin/tftp.sh">恢复12错误环境</a>"
 1761  echo "</table>"
 1762  EOF
 1763  ls
 1764  vim listvm.sh 
 1765  chmod +x listvm.sh 
 1766  ls
 1767  vim listvm.sh 
 1768  ls
 1769  vim listvm.sh 
 1770  ls
 1771  vim dovm.sh
 1772  vim dovm.txt
 1773  mv dovm.txt dovm.sh
 1774  ls
 1775  chmod +x dovm.sh 
 1776  ls
 1777  vim dovm.sh 
 1778  bash -x dovm.sh 
 1779  ls
 1780  vim dovm.sh 
 1781  bash -x dovm.sh 
 1782  vim dovm.sh 
 1783  bash -x dovm.sh 
 1784  vim dovm.sh 
 1785  ls
 1786  vim listvm.sh 
 1787  bash -x listvm.sh 
 1788  bash listvm.sh 
 1789  ls
 1790  vim listvm.sh 
 1791  bash listvm.sh 
 1792  ls
 1793  vim listvm.sh 
 1794  bash listvm.sh 
 1795  vim listvm.sh 
 1796  bash -x listvm.sh 
 1797  bash listvm.sh 
 1798  ls
 1799  vim head.sh 
 1800  bash listvm.sh 
 1801  ls
 1802  vim dovm.sh 
 1803  bash -x dovm.sh 
 1804  vim dovm.sh 
 1805  bash listvm.sh 
 1806  vim dovm.sh 
 1807  ls
 1808  vim listvm.sh 
 1809  ls
 1810  vim listvm.sh 
 1811  vim dovm.sh 
 1812  ls
 1813  vim head.sh 
 1814  ls
 1815  vim chkpasswd.sh 
 1816  vim head.sh 
 1817  ls
 1818  vim dovm.sh 
 1819  vim head.sh 
 1820  ls
 1821  vim listvm.sh 
 1822  ls
 1823  vim dovm.sh 
 1824  vim head.sh 
 1825  ls
 1826  vim dovm.sh 
 1827  bash -x dovm.sh 
 1828  vim dovm.sh 
 1829  bash -x dovm.sh 
 1830  vim dovm.sh 
 1831  vim head.sh 
 1832  ls
 1833  cd ~/.ssh/
 1834  ls
 1835  cd 
 1836  ls
 1837  cd jxcloud/
 1838  lv
 1839  vim jxcms.sql 
 1840  cd /data/vi
 1841  ls
 1842  cd /data/vdisk/
 1843  ls
 1844  ssh root@10.16.255.2
 1845  ssh root@10.16.1.150
 1846  ssh root@10.16.1.146
 1847  ip a
 1848  iptables-save 
 1849  ssh 10.16.1.146 -p 1122
 1850  ssh -p 1122 10.16.1.146
 1851  cd /etc/openvpn/
 1852  ls
 1853  cd ccd/
 1854  ls
 1855  cat jx21080001 
 1856  cat jx21080002
 1857  ls
 1858  rm * -rf
 1859  ls
 1860  ssh root@10.16.255.2
 1861  ssh root@10.16.255.1
 1862  ssh root@10.16.255.3
 1863  ssh root@10.16.255.2
 1864  ssh root@10.16.255.3
 1865  ssh root@10.16.255.1
 1866  echo jx21080001 | sed "s/jx[0-9]{8}/jx-/g" | sed "s/$/.qcow2/g"
 1867  echo jx21080001-nginx-11 | sed "s/jx[0-9]{8}/jx-/g" | sed "s/$/.qcow2/g"
 1868  echo jx21080001-nginx-11 | sed "s/jx[0-9]{8}/jx-/g"
 1869  echo jx21080001-nginx-11 | sed "s/^jx[0-9]{8}/jx-/g"
 1870  echo jx21080001-nginx-11 | sed "s/^jx[0-9]//g"
 1871  echo jx21080001-nginx-11 | sed "s/^jx[0-9]/jx-/g"
 1872  echo jx21080001-nginx-11 | sed "s/^jx[0-9][0-9]/jx-/g"
 1873  echo jx21080001-nginx-11 | sed "s/^jx[0-9]/jx-/g"
 1874  echo jx21080001-nginx-11 | sed "s/^jx[0-9]{8}/jx-/g"
 1875  echo jx21080001-nginx-11 | sed "s/^jx[0-9]\{8\}/jx-/g"
 1876  echo jx21080001-nginx-11 | sed "s/^jx[0-9]\{8\}-/jx-/g"
 1877  echo jx21080001-nginx-11 | sed "s/jx[0-9]\{8\}-/jx-/g" | sed "s/$/.qcow2/g"
 1878  echo jx21080001-nginx-aa-11 | sed "s/jx[0-9]\{8\}-/jx-/g" | sed "s/$/.qcow2/g"
 1879  netstat -anp | grep 80 -w
 1880  killall httpd
 1881  tail -f /opt/tomcat8/logs/catalina.out 
 1882  ls
 1883  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 1884  ls
 1885  ls -al
 1886  chmod +x *.sh
 1887  ls
 1888  cd 
 1889  cd -
 1890  ls
 1891  vim jxcms.sql 
 1892  chmod +x *.sh
 1893  ls
 1894  ps aux | grep ipm
 1895  ps aux | grep java
 1896  ip a
 1897  lls
 1898  ls
 1899  pwd
 1900  vim listvm.sh 
 1901  ls
 1902  vim dovm.sh 
 1903  vim listvm.sh 
 1904  ls
 1905  vim dovm.sh 
 1906  ls
 1907  vim listvm.sh 
 1908  vi listvm.sh 
 1909  bash -x listvm.sh 
 1910  ls
 1911  vim listvm.sh 
 1912  ls
 1913  vim vpnlogin.sh 
 1914  ls
 1915  ls
 1916  cd jxcloud/
 1917  ls
 1918  cd shell/
 1919  ls
 1920  vim dovm.sh 
 1921  ls
 1922  vim head.sh 
 1923  ls
 1924  vim dovm.sh 
 1925  bash -x dovm.sh 
 1926  vim dovm.sh 
 1927  vim head.sh 
 1928  bash -x dovm.sh 
 1929  vim head.sh 
 1930  vim dovm.sh 
 1931  bash -x dovm.sh 
 1932  vim dovm.sh 
 1933  vim head.sh 
 1934  bash -x dovm.sh 
 1935  ls
 1936  git mv chkpasswd.sh vpnlogin.sh
 1937  ls
 1938  cd ..
 1939  ls
 1940  cd src/main/webapp/WEB-INF/
 1941  ls
 1942  mkdir cgi
 1943  ls
 1944  vim web.xml 
 1945  cd cgi/
 1946  ls
 1947  vim a.sh
 1948  ls
 1949  cd ..
 1950  ls
 1951  git status .
 1952  mvn package
 1953  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
 1954  tail -f /opt/tomcat8/logs/catalina.out 
 1955  ls
 1956  ls target/
 1957  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
 1958  tail -f /opt/tomcat8/logs/catalina.out 
 1959  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
 1960  ls
 1961  rm src/main/webapp/WEB-INF/cgi/ -rf
 1962  ls
 1963  git mv shell/ src/main/webapp/WEB-INF/cgi
 1964  ls
 1965  git status .
 1966  cd /etc/openvpn/
 1967  ls
 1968  rm *.sh
 1969  ls
 1970  vim openvpn.conf 
 1971  killall openvpn
 1972  cd 
 1973  ls
 1974  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 1975  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 1976  ls
 1977  cd jxcloud/
 1978  ls
 1979  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
 1980  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 1981  ls /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/vpnlogin.sh
 1982  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 1983  ls
 1984  cd src/main/webapp/WEB-INF/cgi/
 1985  ls
 1986  ls -al
 1987  ls
 1988  cd 
 1989  ls
 1990  vim /etc/openvpn/openvpn.conf 
 1991  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 1992  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 1993  ls
 1994  cd jxcloud/
 1995  ls
 1996  cd src/main/webapp/WEB-INF/cgi/
 1997  ls
 1998  vim dovm.sh 
 1999  pwd
 2000  vim head.sh 
 2001  vim listvm.sh 
 2002  vim dovm.sh 
 2003  vim mkstu.sh 
 2004  vim vpnlogin.sh 
 2005  cd ..
 2006  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
 2007  ls
 2008  iptables-save 
 2009  ssh root@10.16.1.146
 2010  ip a
 2011  tcpdump -i tun0 port 22 -nn
 2012  ls
 2013  cd jxcloud/
 2014  ls
 2015  cd /etc/openvpn/
 2016  ls
 2017  cd ccd/
 2018  ls
 2019  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2020  ls
 2021  vim vpnlogin.sh 
 2022  iptables-save 
 2023  crontab -e
 2024  reboot 
 2025  ip a
 2026  ping 10.16.1.146
 2027  ping 10.16.255.1
 2028  ping 10.16.255.2
 2029  ping 10.16.255.3
 2030  ssh root@10.16.255.1
 2031  ls
 2032  ssh root@10.16.255.1
 2033  ssh root@10.16.255.2
 2034  ssh root@10.16.255.3
 2035  df
 2036  ls
 2037  ssh root@10.16.255.2
 2038  reboot 
 2039  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 2040  tail -f nohup.out 
 2041  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2042  ls
 2043  vim vpnlogin.sh 
 2044  iptables-save 
 2045  ssh root@10.16.255.2
 2046  ssh root@10.16.255.1
 2047  ssh root@10.16.255.3
 2048  ls
 2049  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2050  ls
 2051  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 2052  ls
 2053  vim vpnlogin.sh 
 2054  ping 10.16.255.3
 2055  ping 10.16.255.2
 2056  ping 10.16.255.1
 2057  ssh root@10.16.255.3
 2058  iptables-save 
 2059  ip r
 2060  ls
 2061  killall openvpn
 2062  ps aux | grep openvpn
 2063  tail -f nohup.out 
 2064  ip r
 2065  vim /etc/openvpn/openvpn.conf 
 2066  ip r
 2067  killall openvpn
 2068  killall openvpn -9
 2069  ssh root@10.16.255.3
 2070  ssh root@10.16.255.2
 2071  ssh root@10.16.255.1
 2072  iptables-save 
 2073  ls
 2074  vim vpnlogin.sh 
 2075  rm nohup.out  -rf
 2076  vim /etc/openvpn/openvpn.conf 
 2077  vim vpnlogin.sh 
 2078  ls
 2079  vim vpnlogin.sh 
 2080  ls
 2081  iptables-save 
 2082  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 2083  tail -f nohup.out 
 2084  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 2085  ip a
 2086  killall openvpn
 2087  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 2088  ls
 2089  cd /etc/openvpn/
 2090  ls
 2091  cd ccd/
 2092  ls
 2093  cat jx21080002 
 2094  ls
 2095  rm * -rf
 2096  ls
 2097  cat jx21080001 
 2098  ipr 
 2099  ip r
 2100  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 2101  tail -f nohup.out 
 2102  ls
 2103  vim /etc/openvpn/openvpn.conf 
 2104  cd /etc/openvpn/ccd/
 2105  ls
 2106  cat jx21080001 
 2107  tcpdump -i tun0 port 22 -nn
 2108  ssh root@10.16.1.146
 2109  tcpdump -i tun0 port 22 -nn
 2110  ip a
 2111  cat /proc/sys/net/ipv4/ip_forward
 2112  echo 1 > /proc/sys/net/ipv4/ip_forward
 2113  vim /etc/rc.local 
 2114  ssh root@10.16.1.146
 2115  cd /etc/openvpn/ccd/
 2116  ls
 2117  cat jx21080001 
 2118  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 2119  killall openvpn
 2120  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 2121  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2122  ls
 2123  vim vpnlogin.sh 
 2124  /opt/tomcat8/bin/startup.sh 
 2125  iptables-save 
 2126  ls
 2127  cat a.sh 
 2128  cp listvm.sh listall.sh
 2129  ls
 2130  vim listall.sh 
 2131  vim listvm.sh 
 2132  ls
 2133  vim dovm.sh 
 2134  ls
 2135  vim listall.sh 
 2136  listall.sh 
 2137  vim listall.sh 
 2138  listall.sh 
 2139  vim listall.sh 
 2140  listall.sh 
 2141  vim listall.sh 
 2142  listall.sh 
 2143  vim listall.sh 
 2144  listall.sh 
 2145  vim listall.sh 
 2146  listall.sh 
 2147  vim listall.sh 
 2148  listall.sh 
 2149  ls
 2150  ssh root@10.16.255.1
 2151  ssh root@10.16.255.2
 2152  ssh root@10.16.255.3
 2153  ls
 2154  cd /usr/local/bin/
 2155  ls
 2156  cd ..
 2157  ls
 2158  rm bin/ -rf
 2159  ln -sf /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/ bin
 2160  ls -al
 2161  cd 
 2162  ls
 2163  ip a
 2164  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 2165  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2166  ls
 2167  cp *.sh /root/jxcloud/src/main/webapp/WEB-INF/cgi/
 2168  ls
 2169  cd 
 2170  ls
 2171  cd jxxx
 2172  cd jxcloud/
 2173  ls
 2174  git staus .
 2175  git status .
 2176  git add src/
 2177  git status .
 2178  git commit -m '客户端可以登录'
 2179  git push -u origin master
 2180  cd 
 2181  ls
 2182  history 
 2183  ls
 2184  history > histcmd-0612.cmd 
 2185  ls
 2186  cd jxcloud/
 2187  ls
 2188  mkdir doc
 2189  ls
 2190  git add doc/
 2191  git mv jxcms.sql README.md instjar.cmd LICENSE doc/
 2192  ls
 2193  git status .
 2194  cd doc/
 2195  ls
 2196  cp /etc/openvpn/ . -r
 2197  ls
 2198  cd openvpn/
 2199  ls
 2200  rm ccd/ -rf
 2201  ls
 2202  cd ..
 2203  ls
 2204  git add openvpn/
 2205  cd ..
 2206  ls
 2207  git status .
 2208  git commit -m openvpn配置文件备份
 2209  git push -u origin master
 2210  ls
 2211  cd ..
 2212  ls
 2213  cd jxcloud/
 2214  ls
 2215  git status .
 2216  listall.sh 
 2217  ip a
 2218  vim doc/jxcms.sql 
 2219  listall.sh 
 2220  cd 
 2221  ls
 2222  tail -f nohup.out 
 2223  ls
 2224  listall.sh 
 2225  iptables-save 
 2226  tail -f nohup.out 
 2227  ip a
 2228  listall.sh 
 2229  iptables-save 
 2230  listall.sh 
 2231  ps aux | grep open
 2232  tail -f nohup.out 
 2233  listall.sh 
 2234  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2235  ls
 2236  vim vpnlogin.sh 
 2237  ip r
 2238  listall.sh 
 2239  ssh root@10.16.255.3
 2240  ls
 2241  vim vpnlogin.sh 
 2242  tail -f /var/log/messages
 2243  listall.sh 
 2244  ssh root@10.16.255.3
 2245  ls
 2246  vim vpnlogin.sh 
 2247  bash -x vpnlogin.sh 
 2248  ls
 2249  cd 
 2250  ls
 2251  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2252  ls
 2253  vim mkstu.sh 
 2254  mkstu.sh 10
 2255  listall.sh 
 2256  ls
 2257  for ((i=1;i<10;i++)); do ./mkstu.sh $1 done; ;
 2258  for ((i=1;i<10;i++)); do ./mkstu.sh $1 done
 2259  ./mkstu.sh 1
 2260  ./mkstu.sh 2
 2261  ./mkstu.sh 3
 2262  ./mkstu.sh 4
 2263  ./mkstu.sh 5
 2264  ./mkstu.sh 6
 2265  ./mkstu.sh 7
 2266  ./mkstu.sh 8
 2267  ./mkstu.sh 9
 2268  ls
 2269  cd jxcloud/
 2270  ls
 2271  vim doc/jxcms.sql 
 2272  ls
 2273  top
 2274  ls
 2275  listall.sh 
 2276  ls
 2277  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2278  ls
 2279  vim vpnlogin.sh 
 2280  vim head.sh 
 2281  listall.sh 
 2282  ls
 2283  cd /var/ftp/pub/
 2284  ls
 2285  ls
 2286  cd /var/ftp/pub/
 2287  ls
 2288  ps aux | grep openvpn
 2289  vim /etc/openvpn/openvpn.conf 
 2290  ps aux | grep openvpn
 2291  killall openvpn
 2292  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem --float
 2293  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 2294  cd /var/named/
 2295  ls
 2296  vim named.jxit.net.cn 
 2297  ls
 2298  systemctl restart named
 2299  ls
 2300  ls -al
 2301  ls
 2302  cd /data/vdisk/
 2303  ls
 2304  cd stuvm/
 2305  ls
 2306  virt-filesystems -a jx-nginx-11.qcow2 
 2307  systemctl restart libvirtd
 2308  systemctl enable libvirtd
 2309  virt-filesystems -a jx-nginx-11.qcow2 
 2310  df
 2311  virt-filesystems -a jx-nginx-11.qcow2 
 2312  virsh list 
 2313  virt-filesystems -a jx-nginx-11.qcow2 
 2314  export LIBGUESTFS_DEBUG=1
 2315  virt-filesystems -a jx-nginx-11.qcow2 
 2316  ln -sf /data/vdisk/ /var/lib/libvirt/images/
 2317  virt-filesystems -a jx-nginx-11.qcow2 
 2318  ls /var/lib/libvirt/images/
 2319  ln -sf /data/vdisk/mbvm01.qcow2 /var/lib/libvirt/mbvm01.qcow2
 2320  virt-filesystems -a jx-nginx-11.qcow2 
 2321  ls -al/var/lib/libvirt/images//mbvm01.qcow2
 2322  ls -al /var/lib/libvirt/images//mbvm01.qcow2
 2323  ls -al /var/lib/libvirt/images/
 2324  ln -sf /data/vdisk/mbvm01.qcow2 /var/lib/libvirt/images/mbvm01.qcow2
 2325  virt-filesystems -a jx-nginx-11.qcow2 
 2326  df
 2327  virsh list 
 2328  guestmount -a jx-nginx-11.qcow2 -m /dev/sda1 /mnt
 2329  export LIBGUESTFS_DEBUG=0
 2330  df
 2331  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 2332  sed -i "s/DNS1..*$/DNS1=10.16.255.254/g" /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 2333  echo MTU=1300 >> /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 2334  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 2335  history 
 2336  vim a.sh
 2337  ls
 2338  umount /mnt
 2339  ls
 2340  mv jx-nginx-11.qcow2  /tmp/
 2341  ls
 2342  bash -x a.sh 
 2343  vim a.sh 
 2344  bash a.sh 
 2345  ls
 2346  df
 2347  ls
 2348  mv /tmp/jx-nginx-11.qcow2 .
 2349  ls
 2350  guestmount -a jx-nginx-11.qcow2 -m /dev/sda1 /mnt
 2351  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 2352  ls
 2353  umount /mnt
 2354  ls
 2355  cd ..
 2356  ls
 2357  ls -al
 2358  guestmount -a mbvmr.qcow2 -m /dev/sda1 /mnt
 2359  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 2360  vim /mnt/etc/sysconfig/network-scripts/ifcfg-ethe
 2361  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth1
 2362  umount /mnt
 2363  ls
 2364  find . -name jx*.qcow2
 2365  find . -name jx*.qcow2 | wc -l
 2366  ls
 2367  rm jx* -rf
 2368  ls
 2369  cd /usr/local/bin/
 2370  ls
 2371  vim a.sh 
 2372  vim a.sh
 2373  ls
 2374  bash -x a.sh 
 2375  vim a.sh
 2376  bash -x a.sh 
 2377  vim a.sh
 2378  bash -x a.sh 
 2379  vim a.sh
 2380  bash -x a.sh 
 2381  vim mkstu.sh 
 2382  bash -x a.sh 
 2383  ls
 2384  ssh root@10.16.255.3
 2385  ssh root@10.16.255.2
 2386  ssh root@10.16.255.3
 2387  iptables-save 
 2388  virsh net-destroy default
 2389  virsh net-undefine default
 2390  iptables-save 
 2391  iptables -D POSTROUTING -j LIBVIRT_PRT
 2392  iptables -t nat -D POSTROUTING -j LIBVIRT_PRT
 2393  iptables-save 
 2394  vim /usr/local/bin/listall.sh 
 2395  listall.sh destroy
 2396  vim /usr/local/bin/listall.sh 
 2397  listall.sh destroy
 2398  vim /usr/local/bin/listall.sh 
 2399  listall.sh destroy
 2400  listall.sh 
 2401  listall.sh list
 2402  listall.sh destroy
 2403  cd /data/vdisk/
 2404  ls
 2405  tree
 2406  ls
 2407  tree
 2408  ls
 2409  mysql -uroot -p123456 jxcms 
 2410  ls
 2411  rm zhangsanlaoshi/ -rf
 2412  ls
 2413  ip a
 2414  vim /etc/sysconfig/network-scripts/ifcfg-enp3s0 
 2415  vim /etc/dhcp/dhcpd.conf 
 2416  systemctl restart dhcpd
 2417  netstat -anp | grep 67 -w
 2418  netstat -anp | grep 69 -w
 2419  netstat -anp | grep 21 -w
 2420  cd /var/lib/tftpboot/
 2421  ls
 2422  ls
 2423  cd jxcloud/
 2424  ls
 2425  vim doc/jxcms.sql 
 2426  ls
 2427  cd jxcloud/
 2428  ls
 2429  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
 2430  git staus .
 2431  git status .
 2432  git diff src/main/java/cn/gatherlife/wms/business/controller/TaskController.java
 2433  git checkout src/main/java/cn/gatherlife/wms/business/controller/TaskController.java
 2434  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
 2435  ls
 2436  vim a.sh 
 2437  env
 2438  vim a.sh 
 2439  ls
 2440  cd jxcloud/
 2441  ls
 2442  cd src/main/webapp/WEB-INF/cgi/
 2443  ls
 2444  cp /usr/local/bin/*.sh .
 2445  cd ..
 2446  git status .
 2447  git add src/ doc/
 2448  git commit -m '2302班学生'
 2449  git push -u origin master
 2450  vim /usr/local/bin/listvm.sh 
 2451  ls
 2452  cd /usr/local/bin/
 2453  ls
 2454  vim listvm.sh 
 2455  vim a.txt
 2456  vim listvm.sh 
 2457  ls
 2458  cp listvm.sh /tmp/
 2459  cd /opt/tomcat8/webapps/ROOT/view/
 2460  ls
 2461  cd studenttask/
 2462  ls
 2463  vim vmlist.jsp 
 2464  ls
 2465  cd jxcloud/
 2466  ls
 2467  vim doc/jxcms.sql 
 2468  mysql -uroot -p123456 jxcms < doc/jxcms.sql 
 2469  cd /usr/local/
 2470  cd /usr/local/bin/
 2471  ls
 2472  vim a.sh 
 2473  bash a.sh 
 2474  ls
 2475  ls -al
 2476  ls
 2477  pwd
 2478  cd ..
 2479  ls
 2480  ls -al
 2481  ls
 2482  cd 
 2483  ls
 2484  cd jxcloud/
 2485  ls
 2486  cd src/main/webapp/
 2487  ls
 2488  cd view/
 2489  ls
 2490  cd system/
 2491  ls
 2492  cd ..
 2493  ls
 2494  cd work/
 2495  ls
 2496  cd ..
 2497  ls
 2498  cd student
 2499  ls
 2500  cd ..
 2501  ls
 2502  cd student
 2503  cd ..
 2504  ls
 2505  cd studenttask/
 2506  ls
 2507  cp tasklist.jsp vmlist.jsp
 2508  ls
 2509  vim vmlist.jsp 
 2510  ls
 2511  vim tasklist.jsp 
 2512  vim vmlist.jsp 
 2513  pwd
 2514  vim vmlist.jsp 
 2515  pwd
 2516  vim vmlist.jsp 
 2517  cd jxcloud/
 2518  ls
 2519  cd src/main/java/cn/gatherlife/wms/business/
 2520  ls
 2521  cd controller/
 2522  cd ..
 2523  ls
 2524  grep studenttasklist.jhtml -rn .
 2525  grep studentyuyuelist.jhtml -rn .
 2526  cd ..
 2527  grep studentyuyuelist.jhtml -rn .
 2528  grep studentyuyuelist -rn .
 2529  cd business/controller/
 2530  ls
 2531  vim TaskController.java 
 2532  ls
 2533  cd ..
 2534  ls
 2535  vim service/TaskService.java 
 2536  vim controller/TaskController.java 
 2537  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2538  ls
 2539  vim listvm.sh 
 2540  cp /tmp/listvm.sh .
 2541  vim listvm.sh 
 2542  pwd
 2543  mv listvm.sh vmlist.sh
 2544  ls
 2545  vim vmlist.sh 
 2546  bash -x vmlist.sh 
 2547  bash vmlist.sh 
 2548  cd /opt/tomcat8/webapps/ROOT/view/
 2549  ls
 2550  cd studenttask/
 2551  ls
 2552  vim vmlist.jsp 
 2553  ls
 2554  cd ..
 2555  ls
 2556  cd message/
 2557  ls
 2558  vim viewmessage.jsp 
 2559  ls
 2560  cd ..
 2561  ls
 2562  cd message/
 2563  ls
 2564  vim msglist.jsp 
 2565  cd ..
 2566  ls
 2567  mv studenttask/vmlist.jsp student/vmlist.jsp
 2568  cd student
 2569  ls
 2570  vim vmlist.jsp 
 2571  cd ..
 2572  ls
 2573  cd message/
 2574  ls
 2575  vim msglist.jsp 
 2576  ls
 2577  cd ..
 2578  ls
 2579  cd system/
 2580  ls
 2581  vim kycglist.jsp 
 2582  vim rolelist.jsp 
 2583  ls
 2584  mv ../student/vmlist.jsp .
 2585  ls
 2586  vim rolelist.jsp 
 2587  ls
 2588  vim rolelist.jsp 
 2589  vim vmlist.jsp 
 2590  vim rolelist.jsp 
 2591  vim kycglist.jsp 
 2592  vim vmlist.jsp 
 2593  ip a
 2594  tcpdump -i enp1s0 port 80 -nn 
 2595  tcpdump -i enp1s0 port 80 -w a.pcap
 2596  vim a.pcap 
 2597  tcpdump -i enp1s0 port 80 -w a.pcap
 2598  vim a.pcap 
 2599  tcpdump -i enp1s0 port 80 -w a.pcap
 2600  vim a.pcap 
 2601  cd jxcloud/
 2602  ls
 2603  cd src/main/java/cn/gatherlife/wms/business/
 2604  ls
 2605  cd service/
 2606  ls
 2607  grep rolelist -rwn .
 2608  cd RoleService.java 
 2609  vim RoleService.java 
 2610  cd ..
 2611  ls
 2612  cd controller/
 2613  vim RoleController.java 
 2614  ssh root@10.16.255.3
 2615  ip a
 2616  killall openvpn
 2617  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 2618  vim /etc/openvpn/openvpn.conf 
 2619  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 2620  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 2621  ls /usr/local/bin/
 2622  cd /usr/local/bin/
 2623  ls
 2624  ls -al
 2625  chmod +x *.sh
 2626  cd 
 2627  ls
 2628  openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem
 2629  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 2630  ls
 2631  echo -e aa
 2632  echo -n aa
 2633  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 2634  ls
 2635  vim dovm.sh 
 2636  mysql -uroot -p123456 jxcms 
 2637  ls
 2638  cd /usr/local/bin/
 2639  ls
 2640  vim vmlist.sh 
 2641  vim dovm.sh 
 2642  tail -f /opt/tomcat8/logs/catalina.out 
 2643  ls
 2644  cd jxcloud/
 2645  ls
 2646  vim doc/jxcms.sql 
 2647  mysql -uroot -p123456 jxcms < doc/jxcms.sql 
 2648  vim doc/jxcms.sql 
 2649  mysql -uroot -p123456 jxcms < doc/jxcms.sql 
 2650  vim doc/jxcms.sql 
 2651  mysql -uroot -p123456 jxcms < doc/jxcms.sql 
 2652    vncport=$(virsh vncdisplay $name | head -n 1 | sed "s/://g")
 2653    vncport=$(echo $vncport + 5900 | bc)
 2654  virsh -c qemu+tcp://10.16.255.1/system vncdisplay $name | head -n 1 | sed "s/://g"
 2655  virsh -c qemu+tcp://10.16.255.1/system vncdisplay jx21080001 | head -n 1 | sed "s/://g"
 2656  virsh -c qemu+tcp://10.16.255.1/system vncdisplay jx21080001-nginx-11 | head -n 1 | sed "s/://g"
 2657  virsh -c qemu+tcp://10.16.255.2/system vncdisplay jx21080001-nginx-11 | head -n 1 | sed "s/://g"
 2658  virsh -c qemu+tcp://10.16.255.1/system vncdisplay jx21080001-nginx-11 | head -n 1 | sed "s/://g"
 2659  echo $?
 2660  virsh -c qemu+tcp://10.16.255.2/system vncdisplay jx21080001-nginx-11 | head -n 1 | sed "s/://g"
 2661  echo $?
 2662  ls
 2663  vim doc/jxcms.sql 
 2664  mysql -uroot -p123456 jxcms < doc/jxcms.sql 
 2665  vim doc/jxcms.sql 
 2666  cd jxcloud/
 2667  ls
 2668  cd /opt/tomcat8/webapps/ROOT/view/
 2669  ls
 2670  cd system/
 2671  ls
 2672  vim vmlist.jsp 
 2673  ls
 2674  killall java
 2675  /opt/tomcat8/bin/startup.sh 
 2676  ls
 2677  mv vmlist.jsp ../studenttask/
 2678  cd ..
 2679  ls
 2680  cd student
 2681  cd ..
 2682  ls
 2683  cd studenttask/
 2684  ls
 2685  vim vmlist.jsp 
 2686  ls
 2687  vim vmlist.jsp 
 2688  ls
 2689  cd /opt/tomcat8/webapps/ROOT/
 2690  ls
 2691  cd WEB-INF/
 2692  ls
 2693  vim web.xml 
 2694  ls
 2695  cd ..
 2696  ls
 2697  grep index.jspn -rwn .
 2698  vim index.jsp 
 2699  cat login.jsp > index.jsp 
 2700  ls
 2701  tail -f nohup.out 
 2702   ipa 
 2703  ip a
 2704  netstat -anp | grep 1194
 2705  tail -f nohup.out 
 2706  ls
 2707  ip a
 2708  cd /opt/tomcat8/webapps/ROOT/
 2709  ls
 2710  cd view/
 2711  ls
 2712  cd studenttask/
 2713  ls
 2714  vim vmlist.jsp 
 2715  ls
 2716  mysql -uroot -p123456 jxcms 
 2717  ls
 2718  cd /opt/tomcat8/webapps/ROOT/view/
 2719  ls
 2720  cd manual/
 2721  ls
 2722  vim beginner_guide.html 
 2723  cd ..
 2724  ls
 2725  cd studenttask/
 2726  ls
 2727  vim /usr/local/bin/dovm.sh 
 2728  cd ..
 2729  ls
 2730  cd manual/
 2731  ls
 2732  rz -E
 2733  ls
 2734  yum -y install lrzsz
 2735  lls
 2736  ls
 2737  rz -E
 2738  listall.sh list
 2739  cd /usr/local/bin/
 2740  ls
 2741  vim dovm.sh 
 2742  vim head.sh 
 2743  vim dovm.sh 
 2744  listall.sh list
 2745  vim vpnlogin.sh 
 2746  ls
 2747  vim vpnlogin.sh 
 2748  ls
 2749  vim iptables.sh 
 2750  ls
 2751  rm iptables.sh -rf
 2752  ls
 2753  mv listall.sh vmctl
 2754  ls
 2755  vim vmctl 
 2756  vim vmlist.sh 
 2757  vim dovm.sh 
 2758  vim vmlist.sh 
 2759  vim dovm.sh 
 2760  bash -x dovm.sh 
 2761  ls
 2762  vim dovm.sh 
 2763  bash -x dovm.sh 
 2764  ls
 2765  vim dovm.sh 
 2766  bash -x dovm.sh 
 2767  ls
 2768  vim head.sh 
 2769  bash -x dovm.sh 
 2770  vmctl list
 2771  ls
 2772  vim dovm.sh 
 2773  vim head.sh 
 2774  vim dovm.sh 
 2775  bash -x dovm.sh 
 2776  vmctl list
 2777  vim dovm.sh 
 2778  vmctl list
 2779  vim dovm.sh 
 2780  bash -x dovm.sh 
 2781  vim dovm.sh 
 2782  vim head.sh 
 2783  vim dovm.sh 
 2784  bash -x dovm.sh 
 2785  vim dovm.sh 
 2786  bash -x dovm.sh 
 2787  vim dovm.sh 
 2788  vmctl list
 2789  vim dovm.sh 
 2790  ls
 2791  rm a.txt -rf
 2792  ls
 2793  vim mkstu.sh 
 2794  ls
 2795  cd /root/jxcloud/src/main/webapp/WEB-INF/cgi/
 2796  ls
 2797  cp /usr/local/bin/* .
 2798  ls
 2799  cd ..
 2800  ls
 2801  cd view/studenttask/
 2802  ls
 2803  cp /opt/tomcat8/webapps/ROOT/view/studenttask/vmlist.jsp .
 2804  cd 
 2805  ls
 2806  cd jxcloud/
 2807  ls
 2808  git status .
 2809  git add src/
 2810  cd src/main/webapp/WEB-INF/cgi/
 2811  ls
 2812  git rm iptables.sh listall.sh 
 2813  ls
 2814  vim listvm.sh 
 2815  git rm listvm.sh 
 2816  ls
 2817  cd 
 2818  ls
 2819  cd jxcloud/
 2820  git status .
 2821  git add doc/
 2822  git commit -m '合并开启虚拟机同时检查路由器和vxlan网桥'
 2823  git push -u origin master
 2824  ls
 2825  vim doc/jxcms.sql 
 2826  mysql -uroot -p123456 jxcms < doc/jxcms.sql 
 2827  ls
 2828  virsh -c qemu+tcp://10.16.255.2/system start jx21080001
 2829  cd /opt/tomcat8/logs/
 2830  ls
 2831  tail -f catalina.out 
 2832  ls
 2833  cd /usr/local/bin/
 2834  ls
 2835  vim head.sh 
 2836  ip a
 2837  nload
 2838  ls
 2839  netstat -anp | grep 80 -w
 2840  ls
 2841  cd /opt/tomcat8/webapps/ROOT/view/studenttask/
 2842  ls
 2843  vim vmlist.jsp 
 2844  ip a
 2845  ifdown enp3s0; ifup enp3s0
 2846  ip a
 2847  ifdown enp3s0; ifup enp3s0
 2848  ip a
 2849  ifdown enp3s0; ifup enp3s0
 2850  cd /etc/sysconfig/network-scripts/
 2851  ld
 2852  ls
 2853  vim ifcfg-enp3s0 
 2854  ifdown enp3s0; ifup enp3s0
 2855  ip a
 2856  systemctl restart dhcpd
 2857  netstat -anp | grep 80 -w
 2858  netstat -anp | grep 67 -w
 2859  netstat -anp | grep 69 -w
 2860  netstat -anp | grep 621 -w
 2861  netstat -anp | grep 21 -w
 2862  cd /data/vdisk/
 2863  ls
 2864  rsync -av 192.168.1.5:/var/lib/libvirt/images/jx-2301* .
 2865  ls
 2866  mv jx-2301-61/jx-*.qcow2 jx23010001/
 2867  mv jx-2301-61/jx-*.qcow2 jx23010001/ -f
 2868  cd jx23010001/
 2869  ls
 2870  ls -al
 2871  cd ..
 2872  ls
 2873  mv jx-2301-62/jx-*.qcow2 jx23010002/ -f
 2874  mv jx-2301-63/jx-*.qcow2 jx23010004/ -f
 2875  mv jx-2301-64/jx-*.qcow2 jx23010005/ -f
 2876  mv jx-2301-65/jx-*.qcow2 jx23010011/ -f
 2877  mv jx-2301-66/jx-*.qcow2 jx23010006/ -f
 2878  mv jx-2301-67/jx-*.qcow2 jx23010013/ -f
 2879  mv jx-2301-68/jx-*.qcow2 jx23010008/ -f
 2880  mv jx-2301-69/jx-*.qcow2 jx23010009/ -f
 2881  mv jx-2301-70/jx-*.qcow2 jx23010010/ -f
 2882  mv jx-2301-71/jx-*.qcow2 jx23010007/ -f
 2883  mv jx-2301-72/jx-*.qcow2 jx23010003/ -f
 2884  mv jx-2301-75/jx-*.qcow2 jx23010012/ -f
 2885  history | grep 2301
 2886  history | grep 2301 > a.sh
 2887  vim a.sh 
 2888  ssh-copy-id root@192.168.1.5
 2889  bash -x a.sh 
 2890  ssh root@192.168.1.5
 2891  vim a.sh 
 2892  bash -x a.sh 
 2893  ls
 2894  vim a.sh 
 2895  ls
 2896  rm jx-2301-* -rf
 2897  ls
 2898  rm jx-nginx-11.qcow2 -rf
 2899  ls
 2900  du -sh jx2301*
 2901  ssh root@192.168.1.5
 2902  vim a.sh 
 2903  bash -x a.sh 
 2904  du -sh jx2301*
 2905  ssh root@192.168.1.5
 2906  ls
 2907  ssh root@192.168.1.5
 2908  s
 2909  ping 192.168.1.6
 2910  ip r
 2911  ping 192.168.1.6
 2912  ls
 2913  cd jxcloud/
 2914  ls
 2915  cd src/main/webapp/
 2916  ls
 2917  cp /opt/tomcat8/webapps/ROOT/view/studenttask/vmlist.jsp view/studenttask/
 2918  cp /opt/tomcat8/webapps/ROOT/view/manual/jxvpn-wan.pdf view/manual/
 2919  cd view/m
 2920  cd view/manual/
 2921  ls
 2922  rm jxvpn-wan.pdf -rf
 2923  pwd
 2924  rz -E
 2925  ls
 2926  cp jxvpn-wan.pdf /opt/tomcat8/webapps/ROOT/view/manual/
 2927  cd 
 2928  ls
 2929  cd jxcloud/
 2930  ls
 2931  git staus .
 2932  git status .
 2933  git diff doc/jxcms.sql 
 2934  ls
 2935  git status .
 2936  git add src/
 2937  git status .
 2938  git add doc/
 2939  git status .
 2940  git commit -m '外网连接文档'
 2941  git push -u origin master
 2942  cd /opt/tomcat8/logs/
 2943  ls
 2944  tail -f catalina.out 
 2945  vim catalina.
 2946  vim catalina.out 
 2947  tail -f catalina.out 
 2948  tail -f catalina.out | grep user_name
 2949  nload
 2950  vmctl list
 2951  vmctl list | wc -l
 2952  ls
 2953  vmctl list | wc -l
 2954  vmctl list 
 2955  ssh root@10.16.255.1
 2956  ls
 2957  mysql -uroot -p123456 jxcms 
 2958  ip a | less
 2959  systemctl stop dhcpd
 2960  vim /etc/dhcp/dhcpd.conf 
 2961  ip a
 2962  cd /etc/sysconfig/network-scripts/
 2963  ls
 2964  vim ifcfg-enp3s0 
 2965  ls
 2966  ip a
 2967  ifdown enp3s0; ifup enp3s0
 2968  ip a
 2969  systemctl stop dhcpd
 2970  ip a
 2971  ls
 2972  vim /etc/dhcp/dhcpd.conf 
 2973  ls
 2974  vim ifcfg-enp3s0 
 2975  ls
 2976  vim ifcfg-enp3s0 
 2977  ls
 2978  vim ifcfg-enp2s0 
 2979  ls
 2980  vim ifcfg-enp1s0 
 2981  ls
 2982  cp ifcfg-enp1s0 ifcfg-enp4s0
 2983  ls
 2984  vim ifcfg-enp4s0 
 2985  ls
 2986  vim ifcfg-enp1s0 
 2987  ls
 2988  vim ifcfg-enp1s0 
 2989  ls
 2990  ip a
 2991  ls
 2992  vim ifcfg-enp2s0 
 2993  s
 2994  ls
 2995  vim ifcfg-enp4s0 
 2996  ls
 2997  cat *
 2998  ls
 2999  rm readme-ifcfg-rh.txt -rf
 3000  ls
 3001  cat *
 3002  ip a
 3003  poweroff 
 3004  ls
 3005  ps aux | grep java
 3006  /opt/tomcat8/bin/startup.sh 
 3007  ls
 3008  ps aux | grep java
 3009  ls
 3010  cd /etc/sysconfig/network-scripts/
 3011  ls
 3012  ip a
 3013  ls
 3014  vim ifcfg-enp
 3015  ls
 3016  vim ifcfg-enp1s0 
 3017  vim ifcfg-enp4s0 
 3018  ls
 3019  vim ifcfg-enp1s0 
 3020  ls
 3021  vim ifcfg-enp2s0 
 3022  ls
 3023  vim ifcfg-enp3s0 
 3024  vim ifcfg-enp2s0 
 3025  ls
 3026  vim ifcfg-enp4s0 
 3027  ls
 3028  ip a
 3029  reboot 
 3030  ls
 3031  ip a
 3032  /opt/tomcat8/bin/startup.sh 
 3033  ls
 3034  df
 3035  showmount -e localhost
 3036  ping 10.16.255.1
 3037  ip a
 3038  netstat -anp | grep 67 -w
 3039  netstat -anp | grep 69 -w
 3040  netstat -anp | grep 21 -w
 3041  netstat -anp | grep 53 -w
 3042  vim /etc/dhcp/dhcpd.conf 
 3043  ping 10.16.255.1
 3044  ping 10.16.255.2
 3045  ip a
 3046  ethtool enp2s0
 3047  tcpdump -i enp2s0 -nn
 3048  tcpdump -i enp2s0 icmp -nn
 3049  ping 10.16.255.2
 3050  ping 10.16.255.3
 3051  ping 10.16.255.1
 3052  ip a
 3053  ping 10.16.255.1
 3054  tcpdump -i enp2s0 icmp -nn
 3055  ping 10.64.1.111 
 3056  ip r
 3057  ip a
 3058  ping 10.64.1.111 
 3059  ip a
 3060  ping 192.168.1.1
 3061  ping 10.64.1.111 
 3062  ip a
 3063  ping 10.64.1.111 
 3064  ping 10.16.255.1
 3065  ps aux | grep java
 3066  cat /proc/sys/net/ipv4/ip_forward
 3067  ls
 3068  netstat -anp | grep 80 -w
 3069  virsh -c qemu+tcp://10.16.255.1/system start jx23020004-nginx-11
 3070  df
 3071  ssh root@10.16.255.1
 3072  ssh root@10.16.255.2
 3073  ssh root@10.16.255.3
 3074  ssh root@10.16.255.1
 3075  ssh root@10.16.255.2
 3076  ssh root@10.16.255.3
 3077  nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
 3078  vim /etc/rc.local 
 3079  ip a
 3080  ls
 3081  ip a
 3082  tcpdump -i enp1s0 port 80 -nn
 3083  ping 192.168.1.7
 3084  ssh root@192.168.1.7
 3085  mysql -uroot -p123456 jxcms 
 3086  ls
 3087  cd /usr/local/bin/
 3088  ls
 3089  vim head.sh 
 3090  vim vpnlogin.sh 
 3091  cat vpnlogin.sh 
 3092  echo 168820736+238*4 - 2 | bc
 3093  mysql -uroot -p123456 jxcms 
 3094  ls
 3095  ssh root@10.16.3.182
 3096  ip a
 3097  ssh root@10.16.255.1
 3098  ssh root@10.16.255.3
 3099  vmctl list 
 3100  vmctl list | grep 23010008
 3101  iptables-save 
 3102  ssh root@10.16.255.3
 3103  ssh root@10.16.3.182
 3104  ps aux | grep java
 3105  ssh root@10.16.255.3
 3106  ls
 3107  cd /data/vdisk/
 3108  ls
 3109  cp mbvmr.qcow2 jx23010008/jx23010008.qcow2
 3110  cd jx23010008/
 3111  ls
 3112  ls -al
 3113  ssh root@10.16.255.3
 3114  top
 3115  journalctl -u httpd
 3116  ps aux | grep httpd
 3117  iptables-save 
 3118  iptables -t nat -A PREROUTING -s 10.64.0.0/16 -d 10.16.255.254/32 -p tcp -m tcp --dport 8888 -j DNAT --to-destination 192.168.1.7:8501
 3119  iptables -t nat -D PREROUTING -s 10.64.0.0/16 -d 10.16.255.254/32 -p tcp -m tcp --dport 8888 -j DNAT --to-destination 192.168.1.7:8501
 3120  iptables -t nat -A PREROUTING -d 10.16.255.254/32 -p tcp -m tcp --dport 8888 -j DNAT --to-destination 192.168.1.7:8501
 3121  vim /etc/httpd/conf/httpd.conf 
 3122  cd /var/www/html/
 3123  ls
 3124  vim /etc/httpd/conf/httpd.conf 
 3125  cd /usr/share/httpd/
 3126  ls
 3127  cd noindex/
 3128  ls
 3129  vim index.html 
 3130  ls -al
 3131  cd ..
 3132  ls
 3133  cd ..
 3134  ls
 3135  cd testpage/
 3136  ls
 3137  vim index.html 
 3138  rm index.html -rf
 3139  vim /etc/httpd/conf/httpd.conf 
 3140  systemctl restart httpd
 3141  vim /etc/httpd/conf/httpd.conf 
 3142  systemctl restart httpd
 3143  tail -f /var/log/httpd/error_log
 3144  rm /usr/share/httpd/noindex/index.html 
 3145  ls
 3146  cd /usr/share/httpd/
 3147  ls
 3148  cd error/
 3149  ls
 3150  cd ..
 3151  ls
 3152  cd icons/
 3153  ls
 3154  cd ..
 3155  ls
 3156  rm error/ noindex/ -rf
 3157  cd /var/www/html/
 3158  ls
 3159  cd ..
 3160  ls
 3161  ls -al
 3162  chown apache:apache html/ -R
 3163  ls -al
 3164  tail -f /var/log/httpd/error_log
 3165  vim /etc/httpd/conf/httpd.conf 
 3166  systemctl restart httpd
 3167  cd /etc/httpd/conf
 3168  scp 192.168.1.6:/etc/httpd/conf/httpd.conf .
 3169  ls
 3170  ls -al
 3171  systemctl restart httpd
 3172  journalctl -u httpd
 3173  ls
 3174  vim httpd.conf 
 3175  systemctl restart httpd
 3176  setenforce 0
 3177  systemctl stop firewalld
 3178  setenforce 0
 3179  tail -f /var/log/httpd/error_log
 3180  ls
 3181  cd ..
 3182  ls
 3183  cd conf.
 3184  cd conf.d
 3185  ls
 3186  vim welcome.conf 
 3187  systemctl restart httpd
 3188  ls
 3189  cd /opt/tomcat8/conf/
 3190  ls
 3191  vim server.xml 
 3192  vim /etc/httpd/conf/httpd.conf 
 3193  vim /etc/nginx/conf.d/default.conf 
 3194  iptables-save 
 3195  killall java
 3196  /opt/tomcat8/bin/startup.sh 
 3197  nginx
 3198  systemctl start httpd
 3199  cd /var/www/html/
 3200  ls
 3201  ls -al
 3202  chown apache:apache * -R
 3203  ls
 3204  ls -al
 3205  ls
 3206  yum -y install nginx
 3207  vim /etc/nginx/nginx.conf
 3208  cd /etc/nginx/conf.d/
 3209  ls
 3210  scp frp.jxit.net.cn:/etc/nginx/conf.d/default.conf .
 3211  ls
 3212  vim default.conf 
 3213  ls
 3214  cd /var/www/html/
 3215  ls
 3216  rsync -av 192.168.1.6:/var/www/html/* .
 3217  netstat -anp | grep 1194
 3218  ip a
 3219  tcpdump -i enp1s0 port 1194 -nn
 3220  ip a
 3221  tcpdump -i enp3s0 host 10.64.3.120 -nn
 3222  tcpdump -i enp3s0 host 10.64.3.120 and not port 22 -nn
 3223  tcpdump -i enp3s0 host 10.64.3.120 and not port 22 and udp -nn
 3224  tail -f nohup.out 
 3225  iptables-save 
 3226  iptables-save | grep 3.182
 3227  ip a
 3228  iptables-save | grep 3.182
 3229  ssh root@10.16.3.182
 3230  ip r
 3231  ip a
 3232  ip r
 3233  vmctl list
 3234  ssh root@10.16.3.182
 3235  iptables-save 
 3236  ssh root@10.16.3.154
 3237  ssh root@10.16.3.234
 3238  ssh root@10.16.3.154
 3239  ssh root@10.16.3.182
 3240  vmctl list
 3241  ssh root@10.16.255.3
 3242  ls
 3243  vmctl list 
 3244  vmctl list | wc -l
 3245  ssh root@10.16.255.3
 3246  vmctl list | wc -l
 3247  vmctl list 
 3248  vmctl list | grep 2302
 3249  vim /var/named/named.jxit.net.cn 
 3250  vim /etc/nginx/conf.d/default.conf 
 3251  netstat -anp | grep 888 -w
 3252  ip a
 3253  tcpdump -i enp3s0 port 80 -nn
 3254  ls
 3255  dmesg 
 3256  ls
 3257  cd /opt/tomcat8/logs/
 3258  ls
 3259  tail -f catalina.out 
 3260  curl localhost:888
 3261  tcpdump -i enp3s0 port 80 -nn
 3262  ls
 3263  vim /etc/nginx/conf.d/default.conf 
 3264  nginx -s reload
 3265  tcpdump -i enp3s0 port 80 -nn
 3266  nginx -s reload
 3267  iptables-save 
 3268  df
 3269  lsblk 
 3270  df -hT
 3271  cd /var/www/html/
 3272  ls
 3273  cd mp4/
 3274  ls
 3275  cd ..
 3276  ls
 3277  cd jxfiles/
 3278  ls
 3279  rm jxvpn-wan.pdf 
 3280  rz -E
 3281  ls
 3282  ip a
 3283  vmctl list
 3284  vmctl list | grep 2202
 3285  ls
 3286  cd jxcloud/
 3287  ls
 3288  cd src/main/webapp/view/studenttask/
 3289  ls
 3290  vim vmlist.jsp 
 3291  cp vmlist.jsp /opt/tomcat8/webapps/ROOT/view/studenttask/
 3292  cd /data/vdisk/jx0000003
 3293  l
 3294  cd /data/vdisk/jx00000003
 3295  ls
 3296  ls -al
 3297  guestmount -a jx-dev-71.qcow2 -m /dev/sda1 /mnt
 3298  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3299  umount /mnt
 3300  guestmount -a jx-ops-81.qcow2 -m /dev/sda1 /mnt
 3301  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3302  umount /mnt
 3303  ls
 3304  cd ..
 3305  ls
 3306  cd jx22020006/
 3307  ls
 3308  ls -al
 3309  ls
 3310  guestmount -a jx-dev-71.qcow2 -m /dev/sda1 /mnt
 3311  echo "MTU=1300" >> /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3312  cat /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3313  umount /mnt
 3314  guestmount -a jx-ops-81.qcow2 -m /dev/sda1 /mnt
 3315  echo "MTU=1300" >> /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3316  umount /mnt
 3317  guestmount -a jx-redis-27.qcow2 -m /dev/sda1 /mnt
 3318  echo "MTU=1300" >> /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3319  umount /mnt
 3320  guestmount -a jx-redis-26.qcow2 -m /dev/sda1 /mnt
 3321  echo "MTU=1300" >> /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3322  umount /mnt
 3323  guestmount -a jx-redis-28.qcow2 -m /dev/sda1 /mnt
 3324  echo "MTU=1300" >> /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3325  umount /mnt
 3326  ls -al
 3327  guestmount -a jx-gitlab-76.qcow2 -m /dev/sda1 /mnt
 3328  echo "MTU=1300" >> /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3329  umount /mnt
 3330  ls -al
 3331  guestmount -a jx-ops-81.qcow2 -m /dev/sda1 /mnt
 3332  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3333  umount /mnt
 3334  ls -al
 3335  ls
 3336  cd ..
 3337  ls
 3338  rm a.sh 
 3339  ls
 3340  crontab -e
 3341  ssh-copy-id root@192.168.1.6
 3342  rsync -avz 192.168.1.6:/var/www/html/ /var/www/html/
 3343  crontab -e
 3344  ls
 3345  guestmount -a centos6.qcow2 -m /dev/sda1 /mnt
 3346  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3347  cd /mnt/
 3348  ls
 3349  cd -
 3350  umount /mnt
 3351  guestmount -a centos6.qcow2 -m /dev/sda2 /mnt
 3352  virsh list 
 3353  ls /mnt/
 3354  virt-filesystems -a centos6.qcow2 
 3355  guestmount -a centos6.qcow2 -m /dev//dev/vg_centos6dev/lv_root /mnt
 3356  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3357  ls
 3358  guestmount -a centos9.qcow2 -m /dev/sda1 /mnt
 3359  vim /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3360  umount /mnt
 3361  ls
 3362  crontab -e
 3363  ls
 3364  lsblk
 3365  df -hT
 3366  du -sh *
 3367  cd k8s-helm-ok/
 3368  ls
 3369  du -sh *
 3370  cd /opt/tomcat8/webapps/ROOT
 3371  ls
 3372  wget http://192.168.1.66/favicon.ico
 3373  ls
 3374  ls -al
 3375  vim favicon.ico 
 3376  rm favicon.ico -rf
 3377  ls
 3378  cd img/
 3379  ls
 3380  cd logo/
 3381  ls
 3382  rm logo.png 
 3383  wget http://192.168.1.66/static/img/logo.a6eb81dc.png
 3384  ls
 3385  mv logo.a6eb81dc.png logo.png 
 3386  ls
 3387  cd ..
 3388  grep logo.png -rwn .
 3389  vim view/common/header.jsp 
 3390  cd img/
 3391  ls
 3392  cd logo/
 3393  ls
 3394  rm logo.png -rf
 3395  ls
 3396  cp /root/jxcloud/src/main/webapp/img/logo/logo.png .
 3397  ls
 3398  vmctl list 
 3399  vmctl list | wc -l
 3400  top
 3401  cd 
 3402  ls
 3403  cd .ssh/
 3404  ls
 3405  vim authorized_keys 
 3406  passwd apache
 3407  ls
 3408  cd /var/www/html/
 3409  ls
 3410  ls -al
 3411  pwd
 3412  cd ..
 3413  ls
 3414  ls -al
 3415  vim /etc/exports
 3416  exportfs -r
 3417  ls
 3418  showmount -e localhost
 3419  crontab -e
 3420  ls
 3421  chmod 777 html/ -R
 3422  ls -al
 3423  ls
 3424  cd 
 3425  ls
 3426  history > histcmd-0615.cmd
 3427  ls
 3428  ls -al
 3429  vim histcmd-0615.cmd 
 3430  ls
 3431  cp histcmd-0615.cmd /data/vdisk/
 3432  ls
 3433  cd /data/vdisk/
 3434  ls
 3435  mv kvmnet.xml localvm/
 3436  ls
 3437  lsblk 
 3438  ls
 3439  cd error/
 3440  ls
 3441  lls
 3442  ls
 3443  vim a.sh
 3444  history 
 3445  ls
 3446  df
 3447  vim a.sh 
 3448  ls
 3449  vim a.sh 
 3450  mv a.sh mtu.sh
 3451  ls
 3452  mv mtu.sh ..
 3453  ls
 3454  cd ..
 3455  ls
 3456  vim mtu.sh 
 3457  ls
 3458  bash -x mtu.sh error/
 3459  ls
 3460  vim mtu.sh 
 3461  bash -x mtu.sh error/
 3462  vim mtu.sh 
 3463  bash -x mtu.sh error/
 3464  guestmount -a error//jx-nginx-12-errip-21.qcow2 -m /dev/sda1 /mnt
 3465  vim mtu.sh 
 3466  cat /mnt/etc/sysconfig/network-scripts/ifcfg-eth0 
 3467  ls
 3468  rm error/ -rf
 3469  ls
 3470  chmod +x mtu.sh 
 3471  mv mtu.sh chkmtu.sh
 3472  ls
 3473  df
 3474  umount /mnt
 3475  ls
 3476  mv histcmd-0615.cmd localvm/
 3477  ls
 3478  cd localvm/
 3479  ls
 3480  du -sh *
 3481  cd ..
 3482  ls
 3483  virsh autostart centos7
 3484  ls
 3485  bash -x ./chkmtu.sh error/
 3486  guestmount -a error//jx-nginx-12-errip-21.qcow2 -m /dev/sda1 /mnt
 3487  cat /mnt/etc/sysconfig/network-scripts/ifcfg-eth0
 3488  umount
 3489  umount /mnt
 3490  guestmount -a error//jx-nginx-11-tftp-err.qcow2 -m /dev/sda1 /mnt
 3491  cat /mnt/etc/sysconfig/network-scripts/ifcfg-eth0
 3492  umount /mnt
 3493  bash -x ./chkmtu.sh error/
 3494  ls
 3495  mv error/ stuenv
 3496  ls
 3497  mv k8s-helm-ok/ stuenv/
 3498  ls
 3499  cd stuenv/
 3500  ls
 3501  crontab -l
 3502  rsync -avz 192.168.1.66:/var/www/html/ /var/www/html/
 3503  ls
 3504  cd /data/vdisk/
 3505  ls
 3506  cd k8s-helm-ok/
 3507  ls
 3508  vim a.sh
 3509  vim a.sh 
 3510  bash -x a.sh 
 3511  ls
 3512  cd ..
 3513  ls
 3514  cd k8s-helm-ok/
 3515  ls
 3516  vim a.sh 
 3517  bash -x a.sh 
 3518  ls
 3519  rm a.* -rf
 3520  ls
 3521  ls -al
 3522  du -sh *
 3523  ls
 3524  virsh list 
 3525  virsh list --all
 3526  ls
 3527  cd 
 3528  ls
 3529  df
 3530  ls
 3531  cd /data/vdisk/
 3532  ls
 3533  cp mbvm01.qcow2 centos7.qcow2
 3534  ls
 3535  virsh list --all
 3536  virt-install --import --graphics vnc,listen=0.0.0.0 --disk=/var/lib/libvirt/images/centos7.qcow2,size=8,format=qcow2 --network bridge=default --name=centos7 --ram=2048 --vcpus=2
 3537  virsh net-list --all
 3538  ls
 3539  vim kvmnet.xml
 3540  virsh net-define kvmnet
 3541  virsh net-define kvmnet.xml 
 3542  virsh net-start kvmnet.xml 
 3543  virsh net-start kvmnet
 3544  virsh net-autostart kvmnet
 3545  vim kvmnet.xml
 3546  ls
 3547  virsh edit kvmnet
 3548  ip a
 3549  virsh net-edit kvmnet
 3550  virsh net-destroy kvmnet
 3551  virsh net-edit kvmnet
 3552  virsh net-start kvmnet
 3553  ip a
 3554  ls
 3555  virt-install --import --graphics vnc,listen=0.0.0.0 --disk=/var/lib/libvirt/images/centos7.qcow2,size=8,format=qcow2 --network bridge=default --name=centos7 --ram=2048 --vcpus=2
 3556  virt-install --import --graphics vnc,listen=0.0.0.0 --disk=/var/lib/libvirt/images/centos7.qcow2,size=8,format=qcow2 --network bridge=kvmnet --name=centos7 --ram=2048 --vcpus=2
 3557  virt-install --import --graphics vnc,listen=0.0.0.0 --disk=/var/lib/libvirt/images/centos7.qcow2,size=8,format=qcow2 --network bridge=kvmnet --name=centos7 --ram=2048 --vcpus=2 --osinfo centos
 3558  virt-install --import --graphics vnc,listen=0.0.0.0 --disk=/var/lib/libvirt/images/centos7.qcow2,size=8,format=qcow2 --network bridge=kvmnet --name=centos7 --ram=2048 --vcpus=2 --osinfo centos7
 3559  virsh list 
 3560  virsh console centos7
 3561  netstat -anp | grep qemu
 3562  virsh edit centos7
 3563  ls
 3564  mkdir localvm
 3565  ls
 3566  mv centos* localvm/
 3567  ls
 3568  virsh edit centos7
 3569  ls
 3570  virsh net-start kvmnet
 3571  ip a
 3572  virsh destroy centos7
 3573  virsh start centos7
 3574  ip a
 3575  ping 10.48.1.7
 3576  ssh root@10.48.1.7
 3577  lls
 3578  ls
 3579  cd /var/www/html/shi
 3580  cd /var/www/html/mp4/shizhan/
 3581  ls
 3582  cd jxstu/
 3583  ls
 3584  rm jxstu-vpn-usage.mp4 
 3585  rz -E
 3586  vmctl list 
 3587  vmctl list  | wc -l
 3588  cd /opt/tomcat8/webapps/ROOT/view/studenttask/
 3589  ls
 3590  vim vmlist.jsp 
 3591  cp vmlist.jsp /root/jxcloud/src/main/webapp/view/studenttask/
 3592  s
 3593  ls
 3594  cd 
 3595  ls
 3596  cd jxcloud/
 3597  ls
 3598  git status .
 3599  git add src/
 3600  git commit -m '视频教程'
 3601  git push -u origin master
 3602  ssh root@192.168.1.66
 3603  ls
 3604  arp -an
 3605  arp -an | grep 32
 3606  ip a
 3607  openvpn --help
 3608  cd /etc/openvpn/
 3609  ls
 3610  ip a
 3611  tcpdump -i tun0 -nn
 3612  cd 
 3613  ls
 3614  tail -f nohup.out 
 3615  tcpdump -i tun0 -nn
 3616  tcpdump -i tun0 net 10.30.0.0/16 -w a.pcap
 3617  tcpdump -i tun0 net 10.32.0.0/16 -
 3618  tcpdump -i tun0 net 10.32.0.0/16 -nn
 3619  tcpdump -i tun0 net 10.32.0.0/16 -w a.pcap
 3620  yum -y install wireshark-common
 3621  yum provides "*bin/tshark"
 3622  yum -y install wireshark-cli
 3623  ls
 3624  tshark -q -r a.pcap -z conv,ip
 3625  tcpdump -i tun0 net 10.32.0.0/16 -w a.pcap
 3626  tshark -q -r a.pcap -z conv,ip
 3627  tshark -q -r a.pcap -z conv,ip | awk -F """
 3628  tshark -q -r a.pcap -z conv,ip | awk -F '{print $1}'
 3629  tshark -q -r a.pcap -z conv,ip | awk '{print $1}'
 3630  tshark -q -r a.pcap -z conv,ip | awk '{print $1}' | sort
 3631  tshark -q -r a.pcap -z conv,ip | awk '{print $1}' | sort | uniq -c
 3632  vmctl list
 3633  vmctl list | wc -l
 3634  ssh root@10.16.255.1
 3635  ssh root@10.16.255.2
 3636  ssh root@10.16.255.3
 3637  virsh console centos7
 3638  virsh destroy centos7
 3639  virsh start centos7
 3640  virsh console centos7
 3641  ls
 3642  virsh console centos7
 3643  virsh destroy centos7
 3644  virsh start centos7
 3645  virsh console centos7
 3646  virsh destroy centos7
 3647  virsh start centos7
 3648  virsh console centos7
 3649  virsh destroy centos7
 3650  virsh start centos7
 3651  virsh console centos7
 3652  virsh destroy centos7
 3653  virsh start centos7
 3654  virsh console centos7
 3655  virsh destroy centos7
 3656  ls
 3657  cd /data/vdisk/
 3658  ls
 3659  cd localvm/
 3660  ls
 3661  guestmount -a centos7.qcow2 -m /dev/sda1 /mnt
 3662  cd /mnt/
 3663  ls
 3664  cd /usr/local/lib
 3665  ls
 3666  ls -al
 3667  cd /mnt/usr/local/lib
 3668  ls
 3669  ls -al
 3670  lsattr libextrasshd.so 
 3671  chattr -ia libextrasshd.so 
 3672  lsattr libextrasshd.so 
 3673  chattr -ia libextrasshd.so 
 3674  chattr -u libextrasshd.so 
 3675  chattr -ia libextrasshd.so 
 3676  lsattr libextrasshd.so 
 3677  chattr -i libextrasshd.so 
 3678  chattr -a libextrasshd.so 
 3679  lsattr libextrasshd.so 
 3680  umount /mnt
 3681  cd 
 3682  umount /mnt
 3683  virsh start centos7
 3684  virsh console centos7
 3685  virsh destroy centos7
 3686  cd /data/vdisk/
 3687  cd localvm/
 3688  guestmount -a centos7.qcow2 -m /dev/sda1 /mnt
 3689  cd /mnt/usr/local/lib
 3690  ls
 3691  ls -al
 3692  lsattr libpcap.a 
 3693  touch a.txt
 3694  ls
 3695  lsattr a.txt 
 3696  lsattr libextrasshd.so 
 3697  chattr -i libextrasshd.so 
 3698  lsattr libextrasshd.so 
 3699  chattr -a libextrasshd.so 
 3700  chattr -i libextrasshd.so 
 3701  lsattr libextrasshd.so 
 3702  cd /etc/
 3703  ls
 3704  lsattr passwd
 3705  cd /usr/local/lib
 3706  ls
 3707  cd -
 3708  ls
 3709  cd /mnt/etc/
 3710  lsattr passwd
 3711  lsattr hosts
 3712  lsattr hostname 
 3713  cd /data/vdisk/
 3714  umount /mnt
 3715  ls
 3716  cd localvm/
 3717  ls
 3718  ls -al
 3719  cd ..
 3720  ls
 3721  cp mbvm01.qcow2 a.qcow2
 3722  guestmount -a a.qcow2 -m /dev/sda1 /mnt
 3723  cd /mnt/etc/
 3724  lsattr passwd
 3725  cd /mnt/usr/local/lib
 3726  ls -al
 3727  cd 
 3728  umount /mnt
 3729  l
 3730  ls
 3731  cd /data/vdisk/
 3732  ls
 3733  ls -al
 3734  ls
 3735  virsh destroy centos7
 3736  ls
 3737  cp mbvm01.qcow2 localvm/centos7.qcow2 
 3738  virsh start centos7
 3739  ssh root@10.48.1.7
 3740  virsh console centos7
 3741  ssh root@10.48.1.7
 3742  ls
 3743  cd /var/www/html/
 3744  ls
 3745  cd ..
 3746  ls
 3747  cd 
 3748  ls
 3749  useradd chenzz
 3750  ssh root@10.48.1.7
 3751  passwd
 3752  passwd chenzz
 3753  ssh root@10.48.1.7
 3754  ls
 3755  cd /data/vdisk/
 3756  ls
 3757  cd localvm/
 3758  ls
 3759  mkdir backupenv
 3760  ls
 3761  cp centos7.qcow2 backupenv/centos7-uniprobe-dev.qcow2
 3762  ls
 3763  mv centos9.qcow2 backupenv/centos9-dev.qcow2 
 3764  ls
 3765  mv centos6.qcow2 backupenv/centos6-uniprobe-dev.qcow2
 3766  ls
 3767  cd ..
 3768  ls
 3769  virsh start centos7
 3770  virsh autostart centos7
 3771  vim /etc/exports
 3772  vmctl list
 3773  cd /usr/local/bin/
 3774  ls
 3775  vmctl list
 3776  ls
 3777  vim vmlist.sh 
 3778  bash vmlist.sh 
 3779  bash -x vmlist.sh 
 3780  vim vmlist.sh 
 3781  bash -x vmlist.sh 
 3782  vim vmlist.sh 
 3783  mysql -uroot -p123456 jxcms 
 3784  virsh -c qemu+tcp://10.16.255.5/system list | wc -l
 3785  virsh -c qemu+tcp://10.16.255.5/system list 
 3786  ssh root@10.16.0.10
 3787  ls
 3788  mysql -uroot -p123456 jxcms 
 3789  ls
 3790  cd /usr/local/bin/
 3791  ls
 3792  vim head.sh 
 3793  vmctl list 
 3794  vmctl list | wc -l
 3795  cd /data/vdisk/
 3796  ls
 3797  ls -al
 3798  chown qemu:qemu * -R
 3799  ls -al
 3800  cd jx0000003
 3801  cd jx00000003/
 3802  ls
 3803  ls -al
 3804  cd ..
 3805  ls
 3806  find . -name *.qcow2 -exec chmod 777 {} \;
 3807  find . -name "*.qcow2" -exec chmod 777 {} \;
 3808  mysql -uroot -p123456 jxcms 
 3809  ssh-copy-
 3810  cd /data/vdisk/
 3811  ls
 3812  du -sh *
 3813  lls
 3814  ls
 3815  cd ..
 3816  ls
 3817  du -sh *
 3818  cd vdisk/
 3819  ls
 3820  cd jx230100001
 3821  cd jx23010001/
 3822  ls
 3823  du -sh *
 3824  du -sh *.qcow2
 3825  cd ..
 3826  ls
 3827  cd jx00000003
 3828  ls
 3829  ls -al *.qcow2
 3830  cp jx-mysql-master-36.qcow2 /tmp/
 3831  ls -al
 3832  ls -al jx-mysql-master-36.qcow2 
 3833  ls -al /tmp/jx-mysql-master-36.qcow2 
 3834  rsync -av jx-mysql-master-36.qcow2 /tmp/jx-mysql-master-36.qcow2 
 3835  ls -al /tmp/jx-mysql-master-36.qcow2 
 3836  md5sum jx-mysql-master-36.qcow2 
 3837  md5sum /tmp/jx-mysql-master-36.qcow2 
 3838  rsync -av 192.168.1.66:/var/www/html /var/www/html/
 3839  ls
 3840  cd /var/www/html/
 3841  ls
 3842  cd chatglm/
 3843  ls
 3844  cd ..
 3845  ls
 3846  cd mp4/
 3847  ls
 3848  cd 2301/
 3849  ls
 3850  cd 04-jxstu/
 3851  ls
 3852  rz -E
 3853  vmctl list | wc -l
 3854  vmctl list 
 3855  mysql -uroot -p123456 jxcms 
 3856  ls
 3857  cd /usr/local/bin/
 3858  ls
 3859  vim dovm.sh 
 3860  bash -x dovm.sh 
 3861  ls
 3862  vim dovm.sh 
 3863  vim head.sh 
 3864  netstat -anp | grep win
 3865  netstat -anp | grep qemu
 3866  top
 3867  ls
 3868  cd /var/lib/libvirt/images/
 3869  ls
 3870  cd vdisk/
 3871  ls
 3872  df
 3873  cd 
 3874  ls
 3875  cd /data/vdisk/
 3876  ls
 3877  cd localvm/
 3878  ls
 3879  rm snapshot/ win2008.qcow2  -rf
 3880  ls
 3881  df
 3882  du -sh *
 3883  virsh list 
 3884  vmctl list 
 3885  vmctl list | wc -l
 3886  top
 3887  ls
 3888  cd /data/vdisk/
 3889  ls
 3890  df
 3891  ls
 3892  cd localvm/
 3893  ls
 3894  virt-install --import --graphics vnc,listen=0.0.0.0 --disk=/data/vdisk/localvm/win2008.qcow2,size=80,format=qcow2 --network bridge=kvmnet --name=win2008 --ram=4096 --vcpus=2
 3895  virt-install --osinfo list
 3896  virt-install --osinfo list | grep win
 3897  virt-install --osinfo list | grep winserver
 3898  virt-install --osinfo list | grep win2008
 3899  virt-install --import --graphics vnc,listen=0.0.0.0 --disk=/data/vdisk/localvm/win2008.qcow2,size=80,format=qcow2 --network bridge=kvmnet --name=win2008 --ram=4096 --vcpus=2 --osinfo win7
 3900  virsh list
 3901  virsh destroy win2008
 3902  virsh help
 3903  ls
 3904  vim snapshot/win2008/win2008-ok.xml 
 3905  virsh snapshot-create snapshot/win2008/win2008-ok.xml 
 3906  virsh snapshot-create --help
 3907  virsh snapshot-create --xmlfile snapshot/win2008/win2008-ok.xml 
 3908  virsh snapshot-create win2008 --xmlfile snapshot/win2008/win2008-ok.xml 
 3909  virsh start win2008
 3910  virsh snapshot-create win2008 --xmlfile snapshot/win2008/win2008-ok.xml 
 3911  virsh snapshot-list win2008
 3912  virsh snapshot-list --all win2008
 3913  virsh snapshot-list win2008 --all
 3914  virsh snapshot-list --help
 3915  virsh snapshot-create win2008 --xmlfile snapshot/win2008/win2008-ok.xml 
 3916  virsh snapshot-list win2008
 3917  vim snapshot/win2008/win2008-ok.xml 
 3918  virsh snapshot-create win2008 --xmlfile snapshot/win2008/win2008-ok.xml 
 3919  vim snapshot/win2008/win2008-ok.xml 
 3920  virsh snapshot-create win2008 --xmlfile snapshot/win2008/win2008-ok.xml 
 3921  vim snapshot/win2008/win2008-ok.xml 
 3922  virsh snapshot-create win2008 --xmlfile snapshot/win2008/win2008-ok.xml 
 3923  vim snapshot/win2008/win2008-ok.xml 
 3924  virsh snapshot-create win2008 --xmlfile snapshot/win2008/win2008-ok.xml 
 3925  vim snapshot/win2008/win2008-ok.xml 
 3926  virsh snapshot-create win2008 --xmlfile snapshot/win2008/win2008-ok.xml 
 3927  vim snapshot/win2008/win2008-ok.xml 
 3928  virsh list 
 3929  virsh help
 3930  virsh snapshot-revert win2008 win2008-ok
 3931  netstat -anp | grep qemu
 3932  virsh destroy win2008
 3933  virsh list 
 3934  virsh snapshot-revert win2008 win2008-ok
 3935  virsh list 
 3936  ls
 3937  cd jxcloud/
 3938  ls
 3939  cd shell 
 3940  ls
 3941  mv shell src/main/webapp/WEB-INF/cgi/instnode.sh
 3942  ls
 3943  git status .
 3944  git add src/
 3945  git commit -m '计算节点安装脚本'
 3946  git push -u origin master
 3947  git log
 3948  ls
 3949  cd /opt/tomcat8/webapps/ROOT
 3950  ls
 3951  find . -mtime -1
 3952  vim view/studenttask/vmlist.jsp 
 3953  cp view/studenttask/vmlist.jsp  /root/jxcloud/src/main/webapp/view/studenttask/
 3954  cd 
 3955  ls
 3956  cd jxcloud/
 3957  ls
 3958  git status .
 3959  ls
 3960  cd /data/vdisk/
 3961  ls
 3962  mv ipm-svn-20230513.tar.gz stuenv/
 3963  ls
 3964  ls -al
 3965  rm a.qcow2 -rf
 3966  ls
 3967  vim chkmtu.sh 
 3968  cd 
 3969  ls
 3970  ip a
 3971  ls
 3972  ip a
 3973  ls
 3974  vim /etc/sysconfig/network-scripts/
 3975  vim /etc/sysconfig/network-scripts/ifcfg-enp1s0 
 3976  ifdown enp1s0;ifup enp1s0
 3977  ip a
 3978  ls
 3979  vmctl list 
 3980  vmctl list | grep 2302
 3981  vmctl list | grep 23020008
 3982  vmctl list | grep 2302
 3983  vmctl list | grep 23020008
 3984  ssh root@10.16.255.5
 3985  ls
 3986  ip a
 3987  vmctl list | wc -l
 3988  vmctl list 
 3989  vmctl list | wc -l
 3990  vmctl list 
 3991  ls
 3992  vim a.sh
 3993  ls
 3994  vim a.sh
 3995  scp a.sh 10.16.255.5:/root
 3996  ssh root@10.16.255.1
 3997  ssh root@10.16.255.2
 3998  ssh root@10.16.255.3
 3999  ssh root@10.16.255.5
 4000  ls
 4001  cd /usr/local/bin/
 4002  ls
 4003  vim head.sh 
 4004  mysql -uroot -p123456 jxcms 
 4005  cd /usr/local/bin/
 4006  ls
 4007  vim head.sh 
 4008  ls
 4009  vim head.sh 
 4010  mysql -uroot -p123456 jxcms 
 4011  ls
 4012  vim a.sh
 4013  mysql -uroot -p123456 jxcms -e "select user_id,user_name,user_name from lab_user where class_name="jx2301" or class_name="jx2302";"
 4014  mysql -uroot -p123456 jxcms -e "select user_id,user_name,user_name from lab_user where class_name=\"jx2301\" or class_name=\"jx2302\""
 4015  mysql -uroot -p123456 jxcms -e "select user_id,user_name,user_name from lab_user where class_name=\"jx2301\" or class_name=\"jx2302\"" | grep -v user_id
 4016  ls
 4017  vim a.sh 
 4018  bash -x a.sh 
 4019  ls
 4020  bash -x a.sh 
 4021  bash -x a.sh 
 4022  ls
 4023  vim a.sh 
 4024  bash -x a.sh
 4025  cd /usr/local/bin/
 4026  ls
 4027  vim head.sh 
 4028  vim vmctl 
 4029  vmctl stu
 4030  vim vmctl 
 4031  bash -x ./vmctl stu
 4032  vim vmctl 
 4033  bash -x ./vmctl stu
 4034  ls
 4035  vmctl list
 4036  vmctl stu
 4037  ls
 4038  vim vmctl 
 4039  vmctl stu
 4040  rm /tmp/stu.pcap 
 4041  vmctl stu
 4042  vim vmctl 
 4043  vmctl stu
 4044  vim vmctl 
 4045  vmctl stu
 4046  tcpdump -i tun0 net 10.32.0.0/16 -w a.pcap
 4047  tshark -q -r a.pcap -z conv,ip | awk '{print $1}' | sort | uniq -c
 4048  cd /usr/local/bin/
 4049  ls
 4050  vim head.sh 
 4051  vim mkstu.sh 
 4052  tcpdump -i tun0 net 10.32.0.0/16 -w a.pcap
 4053  tshark -q -r a.pcap -z conv,ip | awk '{print $1}' | sort | uniq -c
 4054  mysql -uroot -p123456 -e "select inet_aton('10.32.3.150')"
 4055  mysql -uroot -p123456 -e "select inet_aton('10.32.3.150')" | grep -v inet
 4056  vim head.sh 
 4057  tshark -q -r a.pcap -z conv,ip | awk '{print $1}' | sort | uniq -c
 4058  tshark -q -r a.pcap -z conv,ip | awk '{print $1}' | sort | uniq 
 4059  tshark -q -r a.pcap -z conv,ip | awk '{print $1}' | sort | uniq | grep 10.32
 4060  ls
 4061  vim head.sh 
 4062  grep bc -rwn .
 4063  vim head.sh 
 4064  echo 169870230-169869312 | bc
 4065  echo (169870230+2-169869312)/4 | bc
 4066  echo "(169870230+2-169869312)/4" | bc
 4067  mysql -uroot -p123456 jxcms -e select user_id,user_name,user_name from lab_user where user_id=230;
 4068  mysql -uroot -p123456 jxcms -e "select user_id,user_name,user_name from lab_user where user_id=230;"
 4069  mysql -uroot -p123456 jxcms -e "select user_id,user_name,user_name,real_name from lab_user where user_id=230;"
 4070  history 
 4071  vim /usr/local/bin/vmctl 
 4072  vmctl stu
 4073  cd /usr/local/bin/
 4074  ls
 4075  mv vmctl qdctl
 4076  ls
 4077  cd
 4078  qdctl list
 4079  qdctl list | wc -l
 4080  qdctl list
 4081  qdctl list | wc -l
 4082  ls
 4083  cd /var/www/html/mp4/2301/
 4084  ls
 4085  cd 04-jxstu/
 4086  ls
 4087  rm 10-mysql-proxy.mp4 -rf
 4088  rz -E
 4089  crontab -l
 4090  cd /var/www/html/mp4/2301/04-jxstu/
 4091  ls
 4092  rz -E
 4093  ll
 4094  cd /var/www/html/mp4/2301/
 4095  ls
 4096  cd 04-jxstu/
 4097  ls
 4098  rz -E
 4099  ls
 4100  cd /opt/tomcat8/webapps/ROOT
 4101  ls
 4102  cd view/studenttask/
 4103  ls
 4104  vim vmlist.jsp 
 4105  ls
 4106  vim /usr/local/bin/head.sh 
 4107  qdctl stu
 4108  qdctl list
 4109  qdctl list | wc -l
 4110  qdctl stu
 4111  cd /usr/local/bin/
 4112  ls
 4113  bash -x qdctl stu
 4114  tshark -q -r /tmp/stu.pcap -z conv,ip
 4115  vim qdctl 
 4116  tshark -q -r /tmp/stu.pcap -z conv,ip
 4117  qdctl stu
 4118  cd /root/
 4119  ls
 4120  mv jxcloud/ qdcloud
 4121  ls
 4122  cd qdcloud/
 4123  ls
 4124  cd src/main/webapp/WEB-INF/cgi/
 4125  ls
 4126  cp /usr/local/bin/* .
 4127  y
 4128  cd 
 4129  ls
 4130  cd qdcloud/
 4131  ls
 4132  git status .
 4133  git add src/
 4134  git status .
 4135  git restore --staged src/main/webapp/WEB-INF/cgi/a.pcap
 4136  git status .
 4137  rm src/main/webapp/WEB-INF/cgi/a.pcap 
 4138  git status .
 4139  git commit -m '查看在线学生列表'
 4140  git push -u origin master
 4141  mysql -uroot -p123456 jxcms -e select user_id,user_name,user_name,real_name from lab_user where user_name='jx22110007';
 4142  mysql -uroot -p123456 jxcms -e "select user_id,user_name,user_name,real_name from lab_user where user_name='jx22110007'";
 4143  mysql -uroot -p123456 jxcms -e "select password,user_id,user_name,user_name,real_name from lab_user where user_name='jx22110007'";
 4144  ls
 4145  vim /etc/dhcp/dhcpd.conf 
 4146  systemctl restart dhcpd
 4147  cd /var/www/html/mp4/2301/
 4148  ls
 4149  cd 04-jxstu/
 4150  ls
 4151  ls -al
 4152  df
 4153  df -hT
 4154  nload 
 4155  ls
 4156  du -sh *
 4157  ls -al
 4158  chmod 777 * -R
 4159  ls -al
 4160  chmod 777 * -R
 4161  ls -al
 4162  cd /opt/tomcat8/webapps/ROOT
 4163  ls
 4164  cd view/
 4165  ls
 4166  cd ..
 4167  ls
 4168  vim login.jsp 
 4169  ls
 4170  vim index.jsp 
 4171  ls
 4172  cat lcd 
 4173  ls
 4174  cd /opt/tomcat8/webapps/ROOT
 4175  ls
 4176  cat login.jsp > index.jsp 
 4177  qdctl stu
 4178  qdctl list
 4179  cd /usr/local/bin/
 4180  ls
 4181  vim qdctl 
 4182  cd 
 4183  ls
 4184  cd qdcloud/
 4185  ls
 4186  cd src/main/java/cn/gatherlife/wms/business/controller/LoginController.java 
 4187  vim src/main/java/cn/gatherlife/wms/business/controller/LoginController.java 
 4188  mvn package
 4189  history | grep mvn
 4190  mvn package -Dmaven.test.skip=true;
 4191  rsync -av target/laboratory_demo/WEB-INF/classes/cn/gatherlife/wms/business/ /opt/tomcat8/webapps/ROOT/WEB-INF/classes/cn/gatherlife/wms/business/
 4192  killall java
 4193  /opt/tomcat8/bin/startup.sh 
 4194  history | grep mvn
 4195  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
 4196  vim src/main/java/cn/gatherlife/wms/business/controller/LoginController.java 
 4197  mvn package -Dmaven.test.skip=true; killall java -9; rm /opt/tomcat8/webapps/ROOT* -rf; cp target/laboratory_demo.war /opt/tomcat8/webapps/ROOT.war; /opt/tomcat8/bin/startup.sh
 4198  ls
 4199  cd qdcloud/
 4200  ls
 4201  cd 
 4202  ls
 4203  mv jxkvm/ /opt/
 4204  ls
 4205  cd qdcloud/
 4206  ls
 4207  cd src/main/webapp/WEB-INF/cgi/
 4208  ls
 4209  mv /tmp/node.sh .
 4210  ls
 4211  cd /data/vdisk/
 4212  ls
 4213  cd jx00000003
 4214  ls
 4215  pwd
 4216  ls
 4217  cd ..
 4218  ls
 4219  iptables-save 
 4220  ls
 4221  cd /etc/openvpn/
 4222  ls
 4223  cd ccd/
 4224  ls
 4225  vim jx00000003 
 4226  pwd
 4227  ls
 4228  cd /usr/local/bin/
 4229  ls
 4230  vim vpnlogin.sh 
 4231  vim /etc/openvpn/openvpn.conf 
 4232  cd /opt/tomcat8/webapps/
 4233  ls
 4234  cd ROOT
 4235  ls
 4236  cd WEB-INF/cgi/
 4237  ls
 4238  vim vmlist.sh 
 4239  cd /usr/local/bin/
 4240  ls
 4241  vim head.sh 
 4242  ls
 4243  vim dovm.sh 
 4244  bash -x dovm.sh 
 4245  ssh-copy-id root@10.16.255.1
 4246  rm ~/.ssh/known_hosts
 4247  ssh-copy-id root@10.16.255.1
 4248  bash -x dovm.sh 
 4249  vim head.sh 
 4250  vim dovm.sh 
 4251  ls
 4252  vim vpnlogin.sh 
 4253  vim /var/named/named.jxit.net.cn 
 4254  ps aux | grep nginx
 4255  vim /etc/nginx/conf.d/default.conf 
 4256  ps aux | grep java
 4257  netstat -anp | grep java
 4258  netstat -anp | grep 67 -w
 4259  netstat -anp | grep 69 -w
 4260  netstat -anp | grep 21 -w
 4261  netstat -anp | grep 53 -w
 4262  netstat -anp | grep 888 -w
 4263  vim /etc/nginx/conf.d/default.conf 
 4264  iptables-save 
 4265  iptables-save | grep 8888
 4266  vim /etc/nginx/conf.d/default.conf 
 4267  netstat -anp | grep 88 -w
 4268  cd /var/www/html/
 4269  ls
 4270  df -hT
 4271  cd /data/vdisk/
 4272  ls
 4273  cd jx00000003/
 4274  ls
 4275  vim jx00000003.xml
 4276  qdctl stu
 4277  mysql -uroot -p123456 jxcms
 4278  ls
 4279  qdctl list 
 4280  qdctl stu
 4281  ls
 4282  cd /data/
 4283  du -sh *
 4284  cd /var/www/html/mp4/shizhan/
 4285  ls
 4286  cd jxstu/
 4287  ls
 4288  cd ..
 4289  ls
 4290  mkdir qdcloud
 4291  ls
 4292  cd qdcloud/
 4293  ls
 4294  rz -E
 4295  showmount -e localhost
 4296  qdctl stu
 4297  cd /usr/local/bin/
 4298  ls
 4299  chmod +x qdctl 
 4300  qdctl stu
 4301  qdctl list
 4302  qdctl list | wc -l
 4303  qdctl list
 4304  ls
 4305  ip a
 4306  ls
 4307  cd /usr/local/bin/
 4308  ls
 4309  vim vpnlogin.sh 
 4310  chmod +x *.sh
 4311  ls -al
 4312  nload
 4313  ip a
 4314  tcpdump -i enp2s0 not port 22 -w a.pca
 4315  rm a.pca -rf
 4316  tcpdump -i enp2s0 not port 22 -w a.pcap
 4317  tshark -q -r a.pcap -z conv,ip
 4318  tcpdump -i enp2s0 not port 22 -nn
 4319  ethtool enp2s0
 4320  arp -an | grep 10.64.1
 4321  arp -an | grep 10.64.1 | wc -l
 4322  arp -an | grep 10.64.1 
 4323  qdctl list
 4324  qdctl stu
 4325  bash -x qdctl stu
 4326  tshark -q -r /tmp/stu.pcap -z conv,ip
 4327  timeout 5 tcpdump -i tun0 net 10.32.0.0/16 -nn
 4328  bash -x qdctl stu
 4329  tshark -q -r /tmp/stu.pcap -z conv,ip
 4330  bash -x qdctl stu
 4331  tshark -q -r /tmp/stu.pcap -z conv,ip
 4332  bash -x qdctl stu
 4333  tshark -q -r /tmp/stu.pcap -z conv,ip
 4334  iptables-save 
 4335  iptables-save | grep -v 10.32
 4336  ls
 4337  cd qdcloud/
 4338  ls
 4339  git status .
 4340  git add src/
 4341  git status .
 4342  git commit -m '增加开机启动备份'
 4343  ls
 4344  cd doc/
 4345  ls
 4346  cp /etc/nginx/conf.d/default.conf .
 4347  ls
 4348  git add default.conf 
 4349  cd ..
 4350  git commit -m nginx配置备份
 4351  git push -u origin master
 4352  git log
 4353  vim /etc/dhcp/dhcpd.conf 
 4354  cd /data/vdisk/
 4355  ls
 4356  cd localvm/
 4357  ls
 4358  cd backupenv/
 4359  ls
 4360  cd ..
 4361  ls
 4362  ip a
 4363  cd /etc/sysconfig/network-scripts/
 4364  ls
 4365  vim ifcfg-enp1s0 
 4366  ip a
 4367  cd qdcloud/
 4368  ls
 4369  cd src/main/java/cn/gatherlife/wms/business/
 4370  ls
 4371  grep logout -rwn .
 4372  grep loginout -rwn .
 4373  vim controller/LoginController.java 
 4374  ls
 4375  cd ..
 4376  ls
 4377  mvn package -Dmaven.test.skip=true;
 4378  rsync -av target/laboratory_demo/WEB-INF/classes/cn/gatherlife/wms/business/ /opt/tomcat8/webapps/ROOT/WEB-INF/classes/cn/gatherlife/wms/business/
 4379  killall java
 4380  /opt/tomcat8/bin/startup.sh 
 4381  cp src/main/webapp/index.jsp /opt/tomcat8/webapps/ROOT/
 4382  vim /etc/nginx/conf.d/default.conf 
 4383  nginx -s reload
 4384  vim /etc/nginx/conf.d/default.conf 
 4385  curl localhost -H "Host: oa.jxit.net.c"
 4386  curl localhost -H "Host: oa.jxit.net.cn"
 4387  curl localhost -H "Host: oa.jxit.net.cn" -I
 4388  curl localhost -H "Host: oa.jxit.net.cn"
 4389  setenforce 0
 4390  curl localhost -H "Host: oa.jxit.net.cn"
 4391  vim /etc/nginx/conf.d/default.conf 
 4392  cat /etc/nginx/conf.d/default.conf 
 4393  nginx -s reload
 4394  ls
 4395  cd doc/
 4396  ls
 4397  cd .
 4398  ls
 4399  cd ..
 4400  ls
 4401  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 4402  ls
 4403  vim node.sh 
 4404  echo "a\tfff"
 4405  echo "a\\tfff"
 4406  echo "a\\\tfff"
 4407  vim node.sh 
 4408  echo -e "10.16.255.254:/data/vdisk/\t/var/lib/libvirt/images\tnfs\tdefaults\t0\t0" >> /tmp/a.txt
 4409  vim /tmp/a.txt 
 4410  vim node.sh 
 4411  ls
 4412  iptables-save 
 4413  ls
 4414  vim iptables.sh 
 4415  ls
 4416  vim iptables.sh 
 4417  ls
 4418  git rm vmctl 
 4419  rm vmctl 
 4420  cp /usr/local/bin/qdctl .
 4421  ls
 4422  vim undill 
 4423  rm bypy* get_objgraph instnode.sh listall.sh undill 
 4424  ls
 4425  rm a.pcap 
 4426  ls
 4427  vim listvm.sh 
 4428  ls
 4429  vim vmlist.sh 
 4430  ls
 4431  rm listvm.sh -rf
 4432  ls
 4433  cd /usr/local/bin/
 4434  ls
 4435  cd /data/vdisk/
 4436  ls
 4437  vim chkmtu.sh 
 4438  cp chkmtu.sh /root/qdcloud/src/main/webapp/WEB-INF/cgi/
 4439  ls
 4440  cd stuenv/
 4441  ls
 4442  bypy uploaddir stuvm /qdcloud/
 4443  bypy cp stuvm /qdcloud/
 4444  bypy cp stuvm /qdcloud/ -dd
 4445  bypy list
 4446  bypy cp stuvm /qdcloud/ -dd
 4447  bypy list
 4448  bypy cp stuvm qdcloud/ -dd
 4449  bypy upload stuvm /qdcloud/ -dd
 4450  cd ..
 4451  ls
 4452  bypy upload stuvm /qdcloud/ -dd
 4453  ls
 4454  bypy upload mb* /qdcloud/mbvm -dd
 4455  bypy upload mbvm01.qcow2 /qdcloud/mbvm -dd
 4456  nohup bypy upload mbvm01.qcow2 /qdcloud/mbvm -dd &
 4457  ls
 4458  cd qdcloud/
 4459  lss
 4460  ls
 4461  cd doc/
 4462  ls
 4463  cd openvpn/
 4464  ls
 4465  vimdiff openvpn.conf /etc/openvpn/openvpn.conf 
 4466  ls
 4467  ls /etc/openvpn/
 4468  ls
 4469  cd /var/www/html/iso/
 4470  ls
 4471  cd winpe/
 4472  ls
 4473  ls -al
 4474  rm HotPE.wim -rf
 4475  ls
 4476  yum -y install bypy
 4477  yum -y install python3-pip
 4478  pip3 install bypy
 4479  vim /etc/resolv.conf 
 4480  pip3 install bypy
 4481  ls
 4482  cd 
 4483  ls
 4484  cd qdcloud/
 4485  ls
 4486  git status .
 4487  ls
 4488  git status .
 4489  git add src/
 4490  git add doc/
 4491  git commit -m '退出登录到login.jsp'
 4492  git push -u origin master
 4493  git status .
 4494  cd 
 4495  ls
 4496  pip3 install bypy
 4497  bypy
 4498  pip3 remove bypy
 4499  pip3 uninstall bypy
 4500  pip3 install bypy
 4501  bypy info
 4502  ls
 4503  cd qdcloud/
 4504  ls
 4505  git status .
 4506  git add src/
 4507  git commit -m '检查虚拟磁盘MTU 1300'
 4508  git push -u origin master
 4509  top
 4510  ls
 4511  iptables-save | grep -v 10.32
 4512  virsh net-destroy default
 4513  virsh net-destroy virbr0
 4514  ip a | less
 4515  virsh net-destroy kvmnet
 4516  virsh net-undefine kvmnet
 4517  iptables-save | grep -v 10.32
 4518  iptables -t nat -A PREROUTING -d 192.168.1.66/32 -p tcp -m tcp --dport 3389 -j DNAT --to-destination 10.16.255.208:3389
 4519  iptables-save | grep -v 10.32
 4520  ls
 4521  cd /usr/local/bin/
 4522  ls
 4523  vim iptables.sh 
 4524  vim /etc/nginx/conf.d/default.conf 
 4525  iptables-save | grep -v 10.32
 4526  vim /etc/nginx/conf.d/default.conf 
 4527  ls
 4528  cd -
 4529  ls
 4530  cd src/main/webapp/WEB-INF/cgi/
 4531  ls
 4532  cp /usr/local/bin/iptables.sh .
 4533  rm instnode.sh 
 4534  ls
 4535  rm vmctl 
 4536  pwd
 4537  rm instnode.sh 
 4538  ls
 4539  rm vmctl -rf
 4540  ls
 4541  vim iptables.sh 
 4542  rm a.sh 
 4543  qdctl list
 4544  qdctl list | wc -l
 4545  iptables-save | grep -v 10.32
 4546  dmesg 
 4547  virsh list 
 4548  virsh destroy win2008
 4549  virsh console centos7
 4550  ls
 4551  cd /data/vdisk/
 4552  ls
 4553  cd localvm/
 4554  ls
 4555  scp centos7.qcow2 10.16.255.5:/opt
 4556  virsh list 
 4557  ls
 4558  rm centos7.qcow2 -rf
 4559  ls
 4560  ls
 4561  cd /etc/sysconfig/network-scripts/
 4562  ls
 4563  vim ifcfg-enp1s0 
 4564  ip a
 4565  arp -an
 4566  arp -an | grep ether
 4567  ip a
 4568  timeout 5 tcpdump -i tun0 net 10.32.0.0/16 -nn
 4569  vim /usr/local/bin/head.sh 
 4570  cd qdcloud/src/main/webapp/WEB-INF/cgi/
 4571  ls
 4572  vim head.sh 
 4573  ls
 4574  df
 4575  df -hT
 4576  ls
 4577  cd /var/www/html/
 4578  du -sh *
 4579  cd chatglm/
 4580  ls
 4581  du -sh *
 4582  ls
 4583  du -sh *
 4584  cd ..
 4585  ls
 4586  du -sh *
 4587  cd iso/
 4588  ls
 4589  du -sh *
 4590  cd centos/
 4591  ls
 4592  du -sh *
 4593  ls
 4594  du -sh *
 4595  rm centos7-vhd.tar.gz -rf
 4596  ls
 4597  cd ..
 4598  ls
 4599  du -sh *
 4600  rm mbstu11-0321.qcow2 -rf
 4601  du -sh *
 4602  rm NewBeePlus.iso -rf
 4603  ls
 4604  du -sh *
 4605  rm deb/ -rf
 4606  rm HarmonyOS.rar -rf
 4607  rm iDigger-mini-6.0.27110.deb -rf
 4608  rm windows_server_2008_r2.iso -rf
 4609  ls
 4610  df
 4611  df -hT
 4612  ls传递
 4613  cd /usr/local/bin/
 4614  ls
 4615  vim head.sh 
 4616  vim vmlist.sh 
 4617  ks
 4618  lls
 4619  cat *.sh
 4620  ls
 4621  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 4622  ls
 4623  cd 
 4624  ls
 4625  cd qdcloud/
 4626  ls
 4627  rm target/ -rf
 4628  ls
 4629  tree
 4630  ls
 4631  cd src/
 4632  ls
 4633  tree
 4634  ls
 4635  cd main/java/cn/gatherlife/
 4636  ls
 4637  tree
 4638  ls
 4639  cd /var/www/html/mp4/2301/
 4640  ls
 4641  cd 04-jxstu/
 4642  ls
 4643  rz -E
 4644  qdctl list | wc -l
 4645  qdctl list 
 4646  qdctl stu
 4647  cd /usr/local/bin/
 4648  ls
 4649  vim qdctl 
 4650  qdctl stu
 4651  cd 
 4652  ls
 4653  tail -f nohup.out 
 4654  ls
 4655  vim nohup.out 
 4656  ls
 4657  vim /usr/local/bin/vpnlogin.sh 
 4658  tail -f nohup.out 
 4659  vim /usr/local/bin/vpnlogin.sh 
 4660  ls
 4661  vim /usr/local/bin/vpnlogin.sh 
 4662  tail -f nohup.out 
 4663  vim nohup.out 
 4664  vim /usr/local/bin/vpnlogin.sh 
 4665  vim nohup.out 
 4666  tcpdump -i lo port 3306 -w a.pcap
 4667  vim /usr/local/bin/head.sh 
 4668  vim /usr/local/bin/vpnlogin.sh 
 4669  tail -f nohup.out 
 4670  vim /usr/local/bin/vpnlogin.sh 
 4671  ls
 4672  cd qdcloud/
 4673  ls
 4674  vim src/main/java/cn/gatherlife/wms/business/
 4675  cd src/main/java/cn/gatherlife/wms/business/
 4676  ls
 4677  vim controller/
 4678  cd 
 4679  ls
 4680  cd qdcloud/src/main/webapp/WEB-INF/cgi/
 4681  ls
 4682  cp /usr/local/bin/head.sh .
 4683  git diff head.sh 
 4684  cp /usr/local/bin/qdctl .
 4685  cp /usr/local/bin/vpnlogin.sh .
 4686  cp /usr/local/bin/dovm.sh .
 4687  cp /usr/local/bin/iptables.sh .
 4688  cp /usr/local/bin/node.sh .
 4689  git diff node.sh 
 4690  git diff qdctl 
 4691  git diff vpnlogin.sh 
 4692  ssh root@10.16.255.7
 4693  cd /usr/local/bin/
 4694  ls
 4695  vim vpnlogin.sh 
 4696  cd 
 4697  ls
 4698  cd qdcloud/
 4699  ls
 4700  cd doc/
 4701  ls
 4702  mysqldump -uroot -p123456 jxcms
 4703  mysqldump -uroot -p123456 jxcms > jxcms.sql 
 4704  vim jxcms.sql 
 4705  git add jxcms.sql 
 4706  cd ..
 4707  ls
 4708  git status .
 4709  git diff src/main/webapp/WEB-INF/cgi/head.sh 
 4710  git status .
 4711  git add src/
 4712  git commit -m 备份数据库
 4713  git push -u origin master
 4714  git status .
 4715  ls
 4716  cd doc/
 4717  ls
 4718  vim jxcms.sql 
 4719  mysql -uroot -p123456 jxcms < /tmp/a.sql 
 4720  mysql -uroot -p123456 jxcms 
 4721  mysql -uroot -p123456 jxcms -e "select from_unixtime(lab_log.time), lab_user.user_name, lab_user.real_name, lab_log.ipaddr from lab_logjoin lab_user on lab_log.user_id=lab_user.user_id;"
 4722  mysql -uroot -p123456 jxcms -e "select from_unixtime(lab_log.time), lab_user.user_name, lab_user.real_name, lab_log.ipaddr from lab_log join lab_user on lab_log.user_id=lab_user.user_id;"
 4723  ls
 4724  cd /usr/local/bin/
 4725  ls
 4726  vim qdctl 
 4727  qdctl log
 4728  cd 
 4729  ls
 4730  cd qdcloud/
 4731  ls
 4732  git status .
 4733  git add src/
 4734  git commit -m '记录VPN登录日志'
 4735  git push -u origin master
 4736  qdctl log
 4737  cd /var/www/html/
 4738  ls
 4739  rm html/ -rf
 4740  ls
 4741  cd iso/
 4742  ls
 4743  rm WIN7激活工具/ -rf
 4744  mysql -uroot -p123456 jxcms
 4745  ls
 4746  vim /etc/openvpn/openvpn.conf 
 4747  vim /usr/local/bin/vpnlogin.sh 
 4748  vim /etc/openvpn/openvpn.conf 
 4749  vim nohup.out 
 4750  bypy upload mbvm01.qcow2 /qdcloud/mbvm -dd
 4751  ls
 4752  cd /data/vdisk/
 4753  ls
 4754  bypy upload mbvmr.qcow2 /qdcloud/mbvm -dd
 4755  bypy upload mbvm.xml mbvmr.xml /qdcloud/mbvm -dd
 4756  ls
 4757  date +% s
 4758  date +%s
 4759  l
 4760  ls
 4761  cd qdcloud/src/main/java/cn/gatherlife/wms/business/ls
 4762  cd qdcloud/src/main/java/cn/gatherlife/wms/business/
 4763  ls
 4764  vim controller/LoginController.java 
 4765  cd ..
 4766  ls
 4767  cd webapp/
 4768  ls
 4769  vim login.jsp 
 4770  cp login.jsp /opt/tomcat8/webapps/ROOT/
 4771  vim index.jsp 
 4772  ls
 4773  cd qw
 4774  cd  qdcloud/
 4775  ls
 4776  cd src/main/resources/
 4777  ls
 4778  vim tangyuan-configuration.xml 
 4779  ls
 4780  cd /var/log/nginx/
 4781  ls
 4782  cat access.log
 4783  cat access.log-20230619 
 4784  cd /var/www/html/mp4/2301/
 4785  ls
 4786  cd 04-jxstu/
 4787  ls
 4788  rz -E
 4789  cd /var/www/html/jxfiles/
 4790  ls
 4791  rz -E
 4792  mv nginx.conf zwfw-nginx.conf
 4793  ls
 4794  cd 
 4795  ls
 4796  cd qdcloud/
 4797  ls
 4798  cd doc/
 4799  ls
 4800  scp -r openvpn/ 43.156.151.102:/root
 4801  ps aux | grep open
 4802  ls
 4803  vim /var/named/named.jxit.net.cn 
 4804  systemctl restart named
 4805  vim /var/named/named.jxit.net.cn 
 4806  systemctl restart named
 4807  cd /var/www/html/meiqi521/
 4808  ls
 4809  rm 521ya.github.io-master.zip -rf
 4810  ls
 4811  rm 20230220073128.jpg -rf
 4812  ls
 4813  cd /data/vdisk/
 4814  ls
 4815  du -sh *
 4816  cd stu
 4817  cd stuenv/
 4818  ls
 4819  du -sh *
 4820  cd ..
 4821  ls
 4822  df
 4823  ls
 4824  cd localvm/
 4825  ls
 4826  rm kvmnet.xml -rf
 4827  ls
 4828  cd backupenv/
 4829  ls
 4830  cd ..
 4831  ls
 4832  qdctl log
 4833  qdctl list
 4834  qdctl list | wc -l
 4835  qdctl log
 4836  qdctl log | wc -l
 4837  ls
 4838  vim a.py
 4839  vi a.py
 4840  cat > a.py << EOF
 4841  from pptx import Presentation
 4842  from docx import Document
 4843  def convert_word_to_ppt(word_file, ppt_file):
 4844      # 打开Word文档
 4845      doc = Document(word_file)
 4846      # 创建PPT对象
 4847      prs = Presentation()
 4848      # 遍历Word文档的段落
 4849      for para in doc.paragraphs:
 4850          slide = prs.slides.add_slide(prs.slide_layouts[1])  # 使用第二种幻灯片布局
 4851          shapes = slide.shapes
 4852          title_shape = shapes.title
 4853          content_shape = shapes.placeholders[1]
 4854          # 将段落文本设置为幻灯片的标题
 4855          title_shape.text = para.text
 4856      # 遍历Word文档的图片
 4857      for i, img in enumerate(doc.inline_shapes):
 4858          slide = prs.slides.add_slide(prs.slide_layouts[1])  # 使用第二种幻灯片布局
 4859          shapes = slide.shapes
 4860          # 将图片添加到幻灯片
 4861          left = top = Inches(1)
 4862          pic = shapes.add_picture(img._inline.graphic.image.blob, left, top)
 4863      # 保存PPT
 4864      prs.save(ppt_file)
 4865  # 示例用法
 4866  word_file = 'path/to/your/word_file.docx'
 4867  ppt_file = 'path/to/your/ppt_file.pptx'
 4868  convert_word_to_ppt(word_file, ppt_file)
 4869  EOF
 4870  vim a.py 
 4871  whereis vi
 4872  ls -al /usr/bin/vi
 4873  vim ~/.bashrc 
 4874  cat > a.py << EOF
 4875  from pptx import Presentation
 4876  from pptx.util import Inches
 4877  from docx import Document
 4878  def word_to_ppt(word_file, ppt_file):
 4879      # 打开Word文档
 4880      doc = Document(word_file)
 4881      # 创建PPT文件
 4882      prs = Presentation()
 4883      # 遍历Word文档中的段落
 4884      for paragraph in doc.paragraphs:
 4885          # 创建新的幻灯片
 4886          slide = prs.slides.add_slide(prs.slide_layouts[1])
 4887          # 添加文本框到幻灯片中
 4888          textbox = slide.shapes.add_textbox(Inches(1), Inches(1), Inches(8), Inches(5))
 4889          text_frame = textbox.text_frame
 4890          # 将Word文档中的段落内容添加到PPT的文本框中
 4891          p = text_frame.add_paragraph()
 4892          p.text = paragraph.text
 4893      # 遍历Word文档中的图片
 4894      for i, image in enumerate(doc.inline_shapes):
 4895          # 创建新的幻灯片
 4896          slide = prs.slides.add_slide(prs.slide_layouts[6])
 4897          # 计算图片的位置和大小
 4898          left = top = Inches(1)
 4899          width = Inches(5)
 4900          height = Inches(5)
 4901          # 将Word文档中的图片添加到PPT幻灯片中
 4902          slide.shapes.add_picture(image.image.filename, left, top, width, height)
 4903      # 保存PPT文件
 4904      prs.save(ppt_file)
 4905  # 示例用法
 4906  word_file = 'input.docx'  # 输入的Word文档
 4907  ppt_file = 'output.pptx'  # 输出的PPT文件
 4908  word_to_ppt(word_file, ppt_file)
 4909  EOF
 4910  ls
 4911  vim a.py 
 4912  ls
 4913  rz -E
 4914  ls
 4915  mv a.py input.docx /root/
 4916  vim a.py
 4917  ls
 4918  cd 
 4919  ls
 4920  vim a.py 
 4921  cat > a.py << EOF
 4922  from pptx import Presentation
 4923  from pptx.util import Inches
 4924  from docx import Document
 4925  def word_to_ppt(word_file, ppt_file):
 4926      # 打开Word文档
 4927      doc = Document(word_file)
 4928      # 创建PPT文件
 4929      prs = Presentation()
 4930      # 遍历Word文档中的段落
 4931      for paragraph in doc.paragraphs:
 4932          # 创建新的幻灯片
 4933          slide = prs.slides.add_slide(prs.slide_layouts[1])
 4934          # 添加文本框到幻灯片中
 4935          textbox = slide.shapes.add_textbox(Inches(1), Inches(1), Inches(8), Inches(5))
 4936          text_frame = textbox.text_frame
 4937          # 将Word文档中的段落内容添加到PPT的文本框中
 4938          p = text_frame.add_paragraph()
 4939          p.text = paragraph.text
 4940      # 遍历Word文档中的图片
 4941      for i, inline_shape in enumerate(doc.inline_shapes):
 4942          # 创建新的幻灯片
 4943          slide = prs.slides.add_slide(prs.slide_layouts[6])
 4944          # 计算图片的位置和大小
 4945          left = top = Inches(1)
 4946          width = Inches(5)
 4947          height = Inches(5)
 4948          # 保存图片到临时文件
 4949          temp_image = f"temp_image_{i}.png"
 4950          inline_shape.inline_shape.picture.save(temp_image)
 4951          # 将Word文档中的图片添加到PPT幻灯片中
 4952          slide.shapes.add_picture(temp_image, left, top, width, height)
 4953      # 保存PPT文件
 4954      prs.save(ppt_file)
 4955  # 示例用法
 4956  word_file = 'input.docx'  # 输入的Word文档
 4957  ppt_file = 'output.pptx'  # 输出的PPT文件
 4958  word_to_ppt(word_file, ppt_file)
 4959  EOF
 4960  ls
 4961  cat > a.py << EOF
 4962  from pptx import Presentation
 4963  from pptx.util import Inches
 4964  from docx import Document
 4965  def word_to_ppt(word_file, ppt_file):
 4966      # 打开Word文档
 4967      doc = Document(word_file)
 4968      # 创建PPT文件
 4969      prs = Presentation()
 4970      # 遍历Word文档中的段落
 4971      for paragraph in doc.paragraphs:
 4972          # 创建新的幻灯片
 4973          slide = prs.slides.add_slide(prs.slide_layouts[1])
 4974          # 添加文本框到幻灯片中
 4975          textbox = slide.shapes.add_textbox(Inches(1), Inches(1), Inches(8), Inches(5))
 4976          text_frame = textbox.text_frame
 4977          # 将Word文档中的段落内容添加到PPT的文本框中
 4978          p = text_frame.add_paragraph()
 4979          p.text = paragraph.text
 4980      # 遍历Word文档中的图片
 4981      for i, inline_shape in enumerate(doc.inline_shapes):
 4982          # 创建新的幻灯片
 4983          slide = prs.slides.add_slide(prs.slide_layouts[6])
 4984          # 计算图片的位置和大小
 4985          left = top = Inches(1)
 4986          width = Inches(5)
 4987          height = Inches(5)
 4988          # 保存图片到临时文件
 4989          temp_image = f"temp_image_{i}.png"
 4990          inline_shape.picture.save(temp_image)
 4991          # 将Word文档中的图片添加到PPT幻灯片中
 4992          slide.shapes.add_picture(temp_image, left, top, width, height)
 4993      # 保存PPT文件
 4994      prs.save(ppt_file)
 4995  # 示例用法
 4996  word_file = 'input.docx'  # 输入的Word文档
 4997  ppt_file = 'output.pptx'  # 输出的PPT文件
 4998  word_to_ppt(word_file, ppt_file)
 4999  EOF
 5000  ls
 5001  cd qdcloud/
 5002  ls
 5003  cd doc/
 5004  ls
 5005  vim jxcms.sql 
 5006  mysql -uroot -p123456 jxcms < /tmp/a.sql
 5007  vim /tmp/a.sql 
 5008  mysql -uroot -p123456 jxcms < /tmp/a.sql
 5009  vim jxcms.sql 
 5010  mysql -uroot -p123456 jxcms < /tmp/a.sql
 5011  vim jxcms.sql 
 5012  mysql -uroot -p123456 jxcms < /tmp/a.sql
 5013  ls
 5014  vim jxcms.sql 
 5015  git log 
 5016  ls
 5017  qdctl log | wc -l
 5018  qdctl log 
 5019  ls
 5020  cd qdcloud/
 5021  ls
 5022  cd doc/
 5023  ls
 5024  vim jxcms.sql 
 5025  ls
 5026  cd /data/vdisk/
 5027  ls
 5028  cp mbvm01.qcow2 /var/www/html/iso/stuvm/
 5029  ls
 5030  cd stuenv/
 5031  ls
 5032  cd env-errip-21/
 5033  s
 5034  ls
 5035  cd ..
 5036  ls
 5037  cd ..
 5038  ls
 5039  cd jx00000003/
 5040  ls
 5041  ls -al
 5042  ls -al ../stuenv/env-errip-21/
 5043  cd 
 5044  ls
 5045  rm a.* -rf
 5046  ls
 5047  rm histcmd-0609.cmd histcmd-0612.cmd  -rf
 5048  ls
 5049  rm input.docx -rf
 5050  ls
 5051  cd /opt/
 5052  ls
 5053  cd jxkvm/
 5054  ls
 5055  cd guest/
 5056  ls
 5057  vim listVm.sh 
 5058  cat listVm.sh 
 5059  ls
 5060  vim listVm.sh 
 5061  ls
 5062  vim doVm.sh 
 5063  vim head.sh 
 5064  cat head.sh 
 5065  ls
 5066  cd /data/vdisk/
 5067  ls
 5068  cd jx00000003/
 5069  ls
 5070  cp jx-nginx-11.qcow2 /tmp/
 5071  ls -al
 5072  rm jx-nginx-11.qcow2 -rf
 5073  ls -al
 5074  ls
 5075  ls -al
 5076  ls
 5077  rm *.tar.gz -rf
 5078  ls
 5079  cd ..
 5080  ls
 5081  cd stuenv/
 5082  ls
 5083  cd env-k8s-helm-ok/
 5084  ls
 5085  ls -al
 5086  du -sh *
 5087  rm *.tar.gz -rf
 5088  ls
 5089  ls -al
 5090  du -sh *
 5091  cd ..
 5092  ls
 5093  ls
 5094  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 5095  ls
 5096  vim doenv.sh 
 5097  rm .doenv.sh.swp -rf
 5098  ls
 5099  vim doenv.sh 
 5100  bash doenv.sh 
 5101  bash -x doenv.sh 
 5102  vim doenv.sh 
 5103  bash -x doenv.sh 
 5104  vim doenv.sh 
 5105  bash -x doenv.sh 
 5106  vim doenv.sh 
 5107  ls
 5108  pwd
 5109  ls
 5110  mv table.css table-css.sh
 5111  ls
 5112  chmod +x table-css.sh 
 5113  ls
 5114  vim table-css.sh 
 5115  vim doenv.sh 
 5116  bash doenv.sh 
 5117  vim table-css.sh 
 5118  ls
 5119  vim doenv.sh 
 5120  ls
 5121  cd 
 5122  ls
 5123  cd qdcloud/
 5124  ls
 5125  cd src/main/webapp/
 5126  ls
 5127  cd view/
 5128  ls
 5129  cp /opt/tomcat8/webapps/ROOT/view/studenttask/vmlist.jsp .
 5130  rm vmlist.jsp -rf
 5131  cd studenttask/
 5132  cp /opt/tomcat8/webapps/ROOT/view/studenttask/vmlist.jsp .
 5133  cp /opt/tomcat8/webapps/ROOT/view/studenttask/envlist.jsp .
 5134  ls
 5135  cd 
 5136  ls
 5137  cd qdcloud/
 5138  ls
 5139  cd src/main/webapp/WEB-INF/cgi/
 5140  ls
 5141  cp /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/*.sh
 5142  ls
 5143  cp /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/*.sh .
 5144  ls
 5145  rm a.sh -rf
 5146  cp /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/qdctl .
 5147  ls
 5148  vim qdctl 
 5149  qdctl log
 5150  ls
 5151  mysql -uroot -p123456 jxcms 
 5152  ls
 5153  cd /data/vdisk/
 5154  ls
 5155  cd jx00000003/
 5156  ls
 5157  ls -al
 5158  du -sh *
 5159  rm jx-apache-21.qcow2 -rf
 5160  ls
 5161  cp jx-apache-22.qcow2 jx-apache-21.qcow2 
 5162  rm jx-nginx-11.qcow2 -rf
 5163  ls
 5164  mv /tmp/jx-nginx-11.qcow2 .
 5165  ls
 5166  ls -al
 5167  du -sh *.qcow2
 5168  ls -al
 5169  du -sh *.qcow2
 5170  cd ..
 5171  ls
 5172  cd jx21080001
 5173  ls
 5174  du -sh *.qcow2
 5175  ls
 5176  cd 
 5177  ls
 5178  cd qdcloud/
 5179  ls
 5180  git status .
 5181  mysqldump -uroot -p123456 jxcms > doc/jxcms.sql 
 5182  git status .
 5183  git add src/ doc/
 5184  git status .
 5185  git commit -m '虚拟环境管理'
 5186  git push -u origin master
 5187  ls
 5188  vim doc/jxcms.sql 
 5189  qdctl list 
 5190  qdctl list | wc -l
 5191  qdctl log
 5192  ls
 5193  cd /opt/tomcat8/webapps/ROOT
 5194  ls
 5195  cd view/
 5196  ls
 5197  cd studenttask/
 5198  ls
 5199  vim worktask.jsp 
 5200  ls
 5201  cd ..
 5202  ls
 5203  cd common/
 5204  ls
 5205  vim left.jsp 
 5206  ls
 5207  vim menu_and_navbar.jsp 
 5208  ls
 5209  vim left.jsp 
 5210  cd ..
 5211  ls
 5212  vim studenttask/vmlist.jsp 
 5213  cd qdcloud/src/main/webapp/img/
 5214  ls
 5215  cd logo/
 5216  ls
 5217  rm login-bg.jpg -rf
 5218  rz -E
 5219  cp login-bg.jpg /opt/tomcat8/webapps/ROOT/img/logo/
 5220  ls
 5221  df
 5222  bypy upload mbvm.xml /qdcloud/mbvm -dd
 5223  cd /data/vdisk/
 5224  ls
 5225  cd stuvm/
 5226  ls
 5227  cd ..
 5228  bypy upload mbvm.xml /qdcloud/mbvm -dd
 5229  ls
 5230  cd /opt/tomcat8/webapps/ROOT/view/studenttask/
 5231  ls
 5232  cp vmlist.jsp envlist.jsp
 5233  vim envlist.jsp 
 5234  ls
 5235  vim envlist.jsp 
 5236  ls
 5237  mysql -uroot -p123456 jxcms
 5238  ls
 5239  vim envlist.jsp 
 5240  ls
 5241  mysql -uroot -p123456 jxcms 
 5242  ls
 5243  python3 a.py
 5244  pip3 install pptx docx -i https://pypi.tuan.tsinghua.edu.cn/simple
 5245  pip3 install pptx docx
 5246  pip install python-pptx
 5247  pip install python-pptx -i https://pypi.tuan.tsinghua.edu.cn/simple
 5248  pip install python-pptx -i https://pypi.tuna.tsinghua.edu.cn/simple
 5249  pip install python-docx -i https://pypi.tuna.tsinghua.edu.cn/simple
 5250  ls
 5251  python3 a.py
 5252  ls
 5253  python3 a.py
 5254  ls
 5255  cd /data/vdisk/
 5256  ls
 5257  cd stuenv/
 5258  ls
 5259  mkdir env-dhcp-err
 5260  mv jx-nginx-11-dhcp-err.qcow2 env-dhcp-err/jx-nginx-11.qcow2
 5261  ls
 5262  mkdir env-ipconf-err
 5263  mv jx-nginx-11-ipconf-err.qcow2 env-ipconf-err/jx-nginx-11.qcow2
 5264  ls
 5265  mkdir env-dns-err
 5266  ls
 5267  mv jx-nginx-11-dns-err.qcow2 env-dns-err/jx-nginx-11.qcow2
 5268  ls
 5269  mkdir env-many-err
 5270  ls
 5271  mv jx-nginx-11-many-err.qcow2 env-many-err/jx-nginx-11.qcow2
 5272  ls
 5273  mkdir env-tftp-err
 5274  ls
 5275  mv jx-nginx-11-tftp-err.qcow2 env-tftp-err/jx-nginx-11.qcow2
 5276  ls
 5277  mkdir env-errip-21
 5278  ls
 5279  mv jx-nginx-12-errip-21.qcow2 env-errip-21/jx-nginx-12.qcow2
 5280  ls
 5281  mv k8s-helm-ok/ env-k8s-helm-ok
 5282  ls
 5283  ls -al
 5284  ls
 5285  ls -al
 5286  rm ipm-svn-20230513.tar.gz -rf
 5287  ls
 5288  cd /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/
 5289  ls
 5290  cp vmlist.sh envlist.sh
 5291  ls
 5292  vim envlist.sh 
 5293  bash envlist.sh 
 5294  vim envlist.sh 
 5295  bash envlist.sh 
 5296  vim envlist.sh 
 5297  ls
 5298  rm __pycache__/ -rf
 5299  ls
 5300  cp dovm.sh doenv.sh
 5301  ls
 5302  vim doenv.sh 
 5303  vim head.sh 
 5304  vim doenv.sh 
 5305  bash -x doenv.sh 
 5306  vim doenv.sh 
 5307  ls
 5308  vim envlist.sh 
 5309  vim doenv.sh 
 5310  qdctl log
 5311  ls
 5312  cd /var/www/html/mp4/2301/
 5313  ls
 5314  cd 04-jxstu/
 5315  ls
 5316  mv 12-nginx-proxy.mp4 12-nginx-loadblance.mp4 
 5317  rz -E
 5318  ssh root@10.16.255.1
 5319  virsh -c qemu+tcp://10.16.255.5/system start jx00000003-pxeboot-51
 5320  qdctl list | wc -l
 5321  qdctl list 
 5322  qdctl list | grep jx00000003
 5323  ls
 5324  cd qdcloud/
 5325  mysql -uroot -p123456 jxcms 
 5326  cd /usr/local/bin/
 5327  ls
 5328  rm bypy* -rf
 5329  ls
 5330  rm vba_extract.py -rf
 5331  ls
 5332  vim head.sh 
 5333  ls
 5334  vim dovm.sh 
 5335  ls
 5336  vim iptables.sh 
 5337  ls
 5338  vim envlist.sh 
 5339  vim mkstu.sh 
 5340  ls
 5341  vim doenv.sh 
 5342  ls
 5343  vim mkstu.sh 
 5344  ls
 5345  vim node.sh 
 5346  ls
 5347  vim qdctl 
 5348  ls
 5349  vim vmlist.sh 
 5350  vim envlist.sh 
 5351  ls
 5352  vim vmlist.sh 
 5353  ls
 5354  vim vpnlogin.sh 
 5355  ls
 5356  cd 
 5357  ls
 5358  cd qdcloud/
 5359  ls
 5360  git status .
 5361  rm src/main/webapp/WEB-INF/cgi/a.sh 
 5362  git add src/
 5363  git commit -m '对脚本代码添加注释'
 5364  git push -u origin master
 5365  ls
 5366  mysqldump -uroot -p123456 jxcms > doc/jxcms.sql 
 5367  git status .
 5368  git add doc
 5369  git commit -m 备份数据库
 5370  git push -u origin master
 5371  ls
 5372  cd doc/
 5373  ls
 5374  history | wc -l
 5375  ls
 5376  history > jxvpn.cmd
