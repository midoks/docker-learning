# docker-learning


### Docker 安装
- http://www.docker.com/
- https://get.daocloud.io/toolbox/
- http://www.linuxprobe.com/docker-windows-install.html
- windows(docker-machine create --engine-registry-mirror=https://kntucbs4.mirror.aliyuncs.com -d virtualbox default)

### 集群相关
```

```

# Linux安装
```
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

sudo yum -y makecache fast
sudo yum -y install docker-ce
sudo service docker start
```

# docker 常用命令
```
docker info
docker version
docker-compose --version
docker-machine --version

docker run -d -p 80:80 --name webserver nginx
docker ps


docker start web 					#启动容器名为web的容器
docker exec -it web /bin/bash 		#进入容器
docker stop web 					#停止容器
docker rm -f web 					#删除容器
docker rmi -f web 					#删除镜像


docker run -t -i 23ac40ed7f8b /bin/bash #进入镜像


docker stop $(docker ps -a -q) 		#停止所有的container，这样才能够删除其中的images
docker rm -f $(docker ps -a -q)	#如果想要删除所有container的话再加一个指令
docker rmi -f $(docker images |  awk "{print $3}") #删除所有镜像
docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}") #想要删除untagged images，也就是那些id为<None>的image的话可以用


docker network prune #删除不用的网络


docker export cbe3cb7799ed > update.tar #容器导出
docker import - update < update.tar 	#容器导入

docker save -o update1.tar update  	#镜像备份
docker load < update1.tar 			#镜像导入

```

# 镜像的操作
```
docker images
docker rmi ad673a791d21  #删除images
```


# mac
- https://docs.docker.com/docker-for-mac/
```


```


### --add-cap

|Docker’s capabilities	|Linux capabilities	| Capability Description|
|-|-|-----------------------|
|SETPCAP|CAP_SETPCAP|Modify process capabilities.|
|MKNOD|CAP_MKNOD|Create special files using mknod(2).|
|AUDIT_WRITE|CAP_AUDIT_WRITE|Write records to kernel auditing log.|
|CHOWN|CAP_CHOWN|Make arbitrary changes to file UIDs and GIDs (see chown(2)).|
|NET_RAW|CAP_NET_RAW|Use RAW and PACKET sockets.|
|DAC_OVERRIDE|CAP_DAC_OVERRIDE|Bypass file read, write, and execute permission checks.|
|FOWNER|CAP_FOWNER	Bypass|permission checks on operations that normally require the file system UID of the |process to match the UID of the file.|
|FSETID|CAP_FSETID|Don’t clear set-user-ID and set-group-ID permission bits when a file is modified.|
|KILL|CAP_KILL|Bypass permission checks for sending signals.|
|SETGID|CAP_SETGID|Make arbitrary manipulations of process GIDs and supplementary GID list.|
|SETUID|CAP_SETUID|Make arbitrary manipulations of process UIDs.|
|NET_BIND_SERVICE|CAP_NET_BIND_SERVICE	|Bind a socket to internet domain privileged ports (port numbers less than 1024).|
SYS_CHROOT|CAP_SYS_CHROOT|Use chroot(2), change root directory.|
SETFCAP|CAP_SETFCAP|Set file capabilities.|

- 下面表格中列出的Capabilities是docker默认删除的Capabilities，用户可以通过--cap-add添加其中一个或者多个。

|Docker’s capabilities|Linux capabilities|Capability Description|
|-|-|-----------------|
|SYS_MODULE|CAP_SYS_MODULE|Load and unload kernel modules.|
|SYS_RAWIO|CAP_SYS_RAWIO|Perform I/O port operations (iopl(2) and ioperm(2)).|
|SYS_PACCT|CAP_SYS_PACCT|Use acct(2), switch process accounting on or off.|
|SYS_ADMIN|CAP_SYS_ADMIN|Perform a range of system administration operations.|
|SYS_NICE|CAP_SYS_NICE|Raise process nice value (nice(2), setpriority(2)) and change the nice value for arbitrary processes.|
|SYS_RESOURCE|CAP_SYS_RESOURCE|Override resource Limits.|
|SYS_TIME|CAP_SYS_TIME|Set system clock (settimeofday(2), stime(2), adjtimex(2)); set real-time (hardware) clock.|
|SYS_TTY_CONFIG	|CAP_SYS_TTY_CONFIG|Use vhangup(2); employ various privileged ioctl(2) operations on virtual terminals.|
|AUDIT_CONTROL|CAP_AUDIT_CONTROL|Enable and disable kernel auditing; change auditing filter rules; retrieve auditing status and filtering rules.|
|MAC_OVERRIDE|CAP_MAC_OVERRIDE|Allow MAC configuration or state changes. Implemented for the Smack LSM.
|MAC_ADMIN|CAP_MAC_ADMIN|Override Mandatory Access Control (MAC). Implemented for the Smack Linux Security Module (LSM).
|NET_ADMIN|CAP_NET_ADMIN|Perform various network-related operations.
|SYSLOG|CAP_SYSLOG|Perform privileged syslog(2) operations.
|DAC_READ_SEARCH|CAP_DAC_READ_SEARCH|Bypass file read permission checks and directory read and execute permission checks.|
|LINUX_IMMUTABLE|CAP_LINUX_IMMUTABLE|Set the FS_APPEND_FL and FS_IMMUTABLE_FL i-node flags.|
|NET_BROADCAST|CAP_NET_BROADCAST|Make socket broadcasts, and listen to multicasts.|
|IPC_LOCK|CAP_IPC_LOCK|Lock memory (mlock(2), mlockall(2), mmap(2), shmctl(2)).|
|IPC_OWNER|CAP_IPC_OWNER|Bypass permission checks for operations on System V IPC objects.|
|SYS_PTRACE|CAP_SYS_PTRACE|Trace arbitrary processes using ptrace(2).|
|SYS_BOOT|CAP_SYS_BOOT|Use reboot(2) and kexec_load(2), reboot and load a new kernel for later execution.
LEASE|CAP_LEASE|Establish leases on arbitrary files (see fcntl(2)).|
|WAKE_ALARM|CAP_WAKE_ALARM|Trigger something that will wake up the system.|
|BLOCK_SUSPEND|CAP_BLOCK_SUSPEND|Employ features that can block system suspend.|


### 火焰图
```


```