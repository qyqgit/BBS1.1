### 1.下载链接
https://github.com/qyqgit/BBS1.1/releases

### 2.功能预览
#### 1.1发帖
<img width="1623" height="293" alt="image" src="https://github.com/user-attachments/assets/11741951-5b2b-4587-bba2-ea21422c562e" />

#### 1.2评论
<img width="1569" height="960" alt="image" src="https://github.com/user-attachments/assets/b3be57a2-94b8-413f-8c38-f45dc73b8f57" />

#### 1.3查看回复
<img width="1644" height="384" alt="image" src="https://github.com/user-attachments/assets/70a699c9-2515-45a4-bf38-99f255bd9a08" />

#### 1.4上传文件
<img width="1567" height="468" alt="image" src="https://github.com/user-attachments/assets/acc41e71-d87e-4c15-a3e7-d12565382efa" />

#### 1.5管理员界面
<img width="1545" height="303" alt="image" src="https://github.com/user-attachments/assets/0deb7111-3e45-4963-868e-d5466ca2ecb1" />

### 3.基础配置流程(Ubuntu 16.04.7)  
#### 3.1先使用free命令查看内存使用情况

```
root@ubuntu:~#free -h
              total        used        free      shared  buff/cache   available
Mem:           454M         57M        125M        2.7M        272M        368M
Swap:            0B          0B          0B

```
#### 3.2配置虚拟内存

```
root@ubuntu:~#fallocate -l 512MB /swapfile
root@ubuntu:~#ll -h /swapfile
-rw-r--r-- 1 root root 489M Dec  2 15:05 /swapfile
root@ubuntu:~#chmod 600 /swapfile
root@ubuntu:~#mkswap /swapfile
Setting up swapspace version 1, size = 488.3 MiB (511995904 bytes)
no label, UUID=96b92917-0bd1-4ef8-96c7-020446713298
root@ubuntu:~#swapon /swapfile
root@ubuntu:~#free -h
              total        used        free      shared  buff/cache   available
Mem:           454M         59M        120M        2.7M        274M        366M
Swap:          488M          0B        488M
root@ubuntu:~# sysctl vm.swappiness=60
vm.swappiness = 60
root@ubuntu:~# cat /proc/sys/vm/swappiness
60
root@ubuntu:~#
```
#### 3.3安装Java运行环境(openjdk version "1.8.0_292")

```
root@ubuntu:~# apt update
root@ubuntu:~# apt upgrade
root@ubuntu:~# apt install default-jre
```

#### 3.4安装配置MySql(5.7.33-0ubuntu0.16.04.1 (Ubuntu))

```
root@ubuntu:~# apt install mysql-server
```
上传数据库文件到服务器:
```
C:\Users\Gitful>scp E:\Web\temp.sql root@47.80.6.78:/root
root@47.80.6.78's password:
temp.sql                                                                              100% 9754   151.2KB/s   00:00
```
创建数据库:
```
root@ubuntu:~# mysql -uroot -p
mysql>create database temp;
mysql>use temp
mysql>source /root/temp.sql
mysql> quit
Bye
root@ubuntu:~#
```
#### 3.5安装tomcat(9.0.112)

```
root@ubuntu:~# wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.112/bin/apache-tomcat-9.0.112.tar.gz
root@ubuntu:~# tar -xvf apache-tomcat-9.0.112.tar.gz
root@ubuntu:~/apache-tomcat-9.0.112/bin# ./startup.sh
Using CATALINA_BASE:   /root/apache-tomcat-9.0.112
Using CATALINA_HOME:   /root/apache-tomcat-9.0.112
Using CATALINA_TMPDIR: /root/apache-tomcat-9.0.112/temp
Using JRE_HOME:        /usr
Using CLASSPATH:       /root/apache-tomcat-9.0.112/bin/bootstrap.jar:/root/apache-tomcat-9.0.112/bin/tomcat-juli.jar
Using CATALINA_OPTS:
Tomcat started.
root@ubuntu:~/apache-tomcat-9.0.112/bin#
```

检查主机端口是否打开:
```
root@ubuntu:~# netstat -anop | grep 8080
tcp6       0      0 :::8080                 :::*                    LISTEN      7518/java        off (0.00/0/0)
```
浏览器端测试服务器运行情况:
<img width="1763" height="1492" alt="image" src="https://github.com/user-attachments/assets/348d4fd6-d5ab-45c9-9dcb-bcb7087cc579" />
出现此页面代表tomcat服务器配置成功，否则检查防火墙状态。

上传Web程序:
```
C:\Users\Gitful>scp Desktop\ROOT.war root@47.80.6.78:/root
root@47.80.6.78's password:
ROOT.war                                                                              100% 1924KB   3.4MB/s   00:00
```
移动Web程序到tomcat目录:

```
root@ubuntu:~# mv apache-tomcat-9.0.112/webapps/ROOT/ apache-tomcat-9.0.112/webapps/_ROOT
root@ubuntu:~# mv ROOT.war apache-tomcat-9.0.112/webapps/
```

浏览器打开出现此页面代表应用配置完成。
<img width="1916" height="913" alt="image" src="https://github.com/user-attachments/assets/db0d6d39-4d47-43d2-a6c8-88cbaec1f9dc" />
### 4.增强配置、启用HTTPS
### 5.修改配置文件

