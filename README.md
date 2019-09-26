># 校园网破解 campus_network_unlock
基于VPN端口转发突破校园网限制，采用docker部署。
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
1. curl 

># 二、客户端使用

> Android

> IOS

>Windows

>MacOS