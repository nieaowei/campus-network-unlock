# TODO

1. 计划使用Go语言开发服务端和客户端程序。

># 校园网破解 campus_network_unlock
1. 该项目基于VPN端口转发突破校园网限制，也可以突破某些断网限制，采用docker部署。  
2. 该项目采用Apache2.0开源协议，请知悉。   
3. 开始使用前，请仔细阅读本文档，对于使用本项目造成的不良后果与作者本人无关。 
>## 注意事项  
1. 对于一些centos可能需要手动打开防火墙端口，或者直接关掉。  
2. 像阿里云这样的需要去阿里云的控制台添加防火墙规则，可以全部打开，但没必要，打开443/tcp，53/udp，67/udp，68/udp，69/udp等需要用到的端口即可。  
3. 对于阿里云的服务器，在系统内部可以直接关掉防火墙，默认好像是直接关掉的   `systemctl stop firewalld`  
4. 关于服务器的延迟问题，与服务器的网络有关，有些服务器可能为长城宽带，无论是否游戏延迟都很高。

![alt 图2](https://s2.ax1x.com/2019/09/27/uuoNVS.jpg)
---
># 一、服务器部署
暂时提供对centos7、centos8的支持。

>## (1). 自动化脚本部署 

>### Centos7、8  

> 方法一 该方法失败的情况下请采用方法二。

`curl https://raw.githubusercontent.com/nieaowei/campus_network_unlock/master/install.sh|bash`

> 方法二 步骤比较繁琐。  

1. 将该项目克隆至服务器  
`git clone https://github.com/nieaowei/campus_network_unlock.git`  
如果提示git命令不存在，请执行如下语句再执行以上语句  
`yum install -y git`
2. 进入项目目录并修改shell脚本权限  
`cd campus_network_unlock && chmod 777 install.sh`
3. 执行脚本文件  
`./install.sh`
  
>## (2). 手动安装docker部署

>### Centos7
 1. 安装docker
`curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun` 
 2. 启动docker  
 `systemctl start docker`
 3. 拉取镜像  
 `docker pull nieaowei/campus_network_unlock`
 4. 启动镜像  
`docker run --net=host -d nieaowei/campus_network_unlock`  
如果提示端口被占用，请运行如下语句，再重试上列语句：  
`ps -ef | grep dchclient grep -v grep | awk '{print $2}' | xargs kill -9`
 5. 关闭防火墙（暂时策略）  
 `systemctl stop firewalld`  

---
># 二、客户端使用

> ## (1). 生成OpenVPN配置文件

> 方法一 这里采用最简单的方式，修改已生成的配置文件。（该方法失效的情况，请使用方法二）  
  
  1. 下载配置文件  [点击下载](https://www.lanzous.com/i6iljpe)


  2. 修改配置文件端口(可选)，根据端口的开放性配置，我配置的是68端口。  
打开上述配置文件，修改如下行，中间的域名可以修改为服务器ip，也可以不做修改，后面的67端口可修改为53，67，68，69。  
![alt ](https://s2.ax1x.com/2019/09/27/uuIIHS.jpg)  

> 方法二 使用服务器管理工具生成。  

1. 下载softether服务器管理工具。[点击下载](https://www.lanzous.com/i6ilhre
)  

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
使用下列客户端导入上面生成的配置文件，输入账号密码即可，默认账号：nieaowei，密码：nieaowei，可以使用服务器管理工具增加账号。
> Android [点击下载](https://www.lanzous.com/i6ilj4d
)   

> IOS  
请使用美区账号登录appstore搜索openVPN,切记不可登录icloud的，否则会锁机。  

> Windows  [点击下载](https://www.lanzous.com/i6ilidg
)   

> MacOS  [点击下载](https://www.lanzous.com/i6z88if
)   
破解密钥：
>- Name: The Shark  
>- Mail: deep@sea.com  
>- Serial: VM1U-JKJRW4-2NSXY4-G25K7Q-AU6LCU-I56CL4
