># 校园网破解 campus_network_unlock
该项目基于VPN端口转发突破校园网限制，采用docker部署。  
该项目采用Apache2.0开源协议，请知悉。  

---
># 一、服务器部署
暂时只提供对centos7的支持。
>## (1). 手动安装docker部署

>### Centos7
 1. 安装docker
`curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun` 
 2. 启动docker  
 `systemctl start docker`
 3. 拉取镜像  
 `docker pull nieaowei/campus_network_unlock`
 4. 启动镜像  
`docker run -d -p 443:443 -p 53:53 -p 67:67 -p 68:68 -p 69:69 nieaowei/campus_network_unlock`
 5. 关闭防火墙（暂时策略）  
 `systemctl stop firewalld`  

>## (2). 自动化脚本部署 

>### Centos7  
由于没有脚本托管服务器，步骤也比较繁琐。
1. 将该项目克隆至服务器  
`git clone https://github.com/nieaowei/campus_network_unlock.git`  
如果提示git命令不存在，请执行如下语句再执行以上语句  
`yum install -y git`
2. 进入项目目录并修改shell脚本权限  
`cd campus_network_unlock && chmod 777 install.sh`
3. 执行可执行文件  
`./install.sh`
  
---
># 二、客户端使用

> ## (1). 生成OpenVPN配置文件
这里采用最简单的方式。  
1. 下载softether服务器管理工具。  
`链接:https://pan.baidu.com/s/1DNjE5r22r9otcNWxruvykA  密码:4q7d`  

2. 安装。  
![alt 第一步](https://s2.ax1x.com/2019/09/26/unoHmT.jpg)  

3. 打开softether,并连接到服务器。  
![alt ](https://s2.ax1x.com/2019/09/26/unHdkF.jpg)  
![alt 第二步](https://s2.ax1x.com/2019/09/26/un7GVO.jpg)  

4. 生成配置文件。 
![alt ](https://s2.ax1x.com/2019/09/26/unHDp9.jpg)
![alt ](https://s2.ax1x.com/2019/09/26/unHrlR.jpg)
![alt ](https://s2.ax1x.com/2019/09/26/unH0fJ.jpg)  

5. 修改配置文件端口(可选)，根据端口的开放性配置，我配置的是68端口。  
打开上述配置文件，修改如下行，中间的域名可以修改为服务器ip，也可以不做修改，后面的67端口可修改为53，67，68，69。  
![alt ](https://s2.ax1x.com/2019/09/26/unb63j.jpg)
> ## (2). 各平台客户端下载使用  
使用下列客户端导入上面生成的配置文件即可，
> Android  
`下载地址：https://pan.baidu.com/s/1QbDX4qjYI3G0tk04N0H-PQ  密码:4wzr`  

> IOS  
请使用美区账号登录appstore搜索openVPN,切记不可登录icloud的，否则会锁机。  

> Windows  
`下载地址：https://pan.baidu.com/s/1p9hPACctn9fQEOm0bwC9Qw  密码:bkm6`  

> MacOS  
解压密码为 `xclient.info`  
`下载地址：https://pan.baidu.com/s/1BkAQBsgAV6JXClZQKPkxCA  密码:jkf6`
