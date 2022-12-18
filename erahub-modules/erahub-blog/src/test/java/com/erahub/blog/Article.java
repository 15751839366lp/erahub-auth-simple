package com.erahub.blog;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Article {

    // markdown图片正则表达式
    private static Pattern p_image = Pattern.compile("\\!\\[.*\\]\\(.+\\)", Pattern.CASE_INSENSITIVE);

    // 上传图片时注意插入关联表
    // 获取md中所有的图片地址
    public static List<String> getImgStr(String mdString) {
        List<String> list = new ArrayList<>();
        Matcher m_image = p_image.matcher(mdString);
        while (m_image.find()) {
            String img = m_image.group();
            String imgUrl = img.split("]\\(")[1];
            imgUrl = imgUrl.substring(0, imgUrl.length() - 1);

            System.out.println(imgUrl);

            list.add(imgUrl);
        }
        return list;
    }

    public static void main(String[] args) {
        getImgStr("#  1.docker概述\n" +
            "\n" +
            "## 1.1 基本介绍\n" +
            "\n" +
            "Docker 是一个开源的应用容器引擎，基于 Go 语言 并遵从 Apache2.0 协议开源。\n" +
            "\n" +
            "Docker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。\n" +
            "\n" +
            "容器是完全使用沙箱机制，相互之间不会有任何接口,更重要的是容器性能开销极低。\n" +
            "\n" +
            "Docker 从 17.03 版本之后分为 CE（Community Edition: 社区版） 和 EE（Enterprise Edition: 企业版），我们用社区版就可以了。[官网](https://docs.docker.com/)\n" +
            "\n" +
            "##  1.2 应用场景\n" +
            "\n" +
            "1. Web 应用的自动化打包和发布。\n" +
            "\n" +
            "2. 自动化测试和持续集成、发布。\n" +
            "\n" +
            "3. 在服务型环境中部署和调整数据库或其他的后台应用。\n" +
            "\n" +
            "4. 从头编译或者扩展现有的 Openshellift 或 Cloud Foundry 平台来搭建自己的 PaaS 环境。\n" +
            "\n" +
            "## 1.3 docker 的优势\n" +
            "\n" +
            "Docker 是一个用于开发，交付和运行应用程序的开放平台。Docker 使您能够将应用程序与基础架构分开，从而可以快速交付软件。借助 Docker，您可以与管理应用程序相同的方式来管理基础架构。通过利用 Docker 的方法来快速交付，测试和部署代码，您可以大大减少编写代码和在生产环境中运行代码之间的延迟。\n" +
            "\n" +
            "1. 快速，一致地交付您的应用程序。Docker 允许开发人员使用您提供的应用程序或服务的本地容器在标准化环境中工作，从而简化了开发的生命周期。\n" +
            "\n" +
            "容器非常适合持续集成和持续交付（CI / CD）工作流程，请考虑以下示例方案：\n" +
            "\n" +
            "您的开发人员在本地编写代码，并使用 Docker 容器与同事共享他们的工作。\n" +
            "他们使用 Docker 将其应用程序推送到测试环境中，并执行自动或手动测试。\n" +
            "当开发人员发现错误时，他们可以在开发环境中对其进行修复，然后将其重新部署到测试环境中，以进行测试和验证。\n" +
            "测试完成后，将修补程序推送给生产环境，就像将更新的镜像推送到生产环境一样简单。\n" +
            "\n" +
            "2. 响应式部署和扩展\n" +
            "   Docker 是基于容器的平台，允许高度可移植的工作负载。Docker 容器可以在开发人员的本机上，数据中心的物理或虚拟机上，云服务上或混合环境中运行。\n" +
            "\n" +
            "Docker 的可移植性和轻量级的特性，还可以使您轻松地完成动态管理的工作负担，并根据业务需求指示，实时扩展或拆除应用程序和服务。\n" +
            "\n" +
            "3. 在同一硬件上运行更多工作负载\n" +
            "   Docker 轻巧快速。它为基于虚拟机管理程序的虚拟机提供了可行、经济、高效的替代方案，因此您可以利用更多的计算能力来实现业务目标。Docker 非常适合于高密度环境以及中小型部署，而您可以用更少的资源做更多的事情。\n" +
            "\n" +
            "# 2.虚拟化技术和容器化技术\n" +
            "\n" +
            "虚拟化技术特点：\n" +
            "\n" +
            "1. 资源占用多\n" +
            "2. 冗余步骤多 \n" +
            "3. 启动很慢\n" +
            "\n" +
            "容器化技术：容器化技术不是模拟的一个完整的操作系统\n" +
            "\n" +
            "比较Docker和虚拟机的不同：\n" +
            "\n" +
            "1. 传统虚拟机，虚拟出硬件，运行一个完整的操作系统，然后在这个系统上安装和运行软件。\n" +
            "2. Docker容器内的应用直接运行在宿主机的内容，容器是没有自己的内核的，也没有虚拟硬件。\n" +
            "3. 每个容器都是相互隔离的，每个容器都有属于自己的文件系统，互不影响。\n" +
            "\n" +
            "![20210717124434988.png](https://static.linhaojun.top/articles/c7ae4abaa3a228f0344dd4b480ff7445.png)\n" +
            "\n" +
            "# 3.docker的基本组成\n" +
            "\n" +
            "Docker的基本组成图如下：\n" +
            "![20210717120256284.png](https://static.linhaojun.top/articles/8939ae04db634d407f5dec94ba82ec0f.png)\n" +
            "\n" +
            "说明：\n" +
            "\n" +
            "![20210717120343817.png](https://static.linhaojun.top/articles/323aef7768be3f055eb34b893202933d.png)\n" +
            "\n" +
            "# 4.Docker的安装\n" +
            "\n" +
            "查看系统的内核：\n" +
            "\n" +
            "uname -r\n" +
            "\n" +
            "系统内核版本为3.10.0\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# uname -r\n" +
            "3.10.0-957.21.3.el7.x86_64\n" +
            "```\n" +
            "\n" +
            "查看系统配置\n" +
            "\n" +
            "cat /etc/os-release\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# cat /etc/os-release\n" +
            "NAME=\"CentOS Linux\"\n" +
            "VERSION=\"7 (Core)\"\n" +
            "ID=\"centos\"\n" +
            "ID_LIKE=\"rhel fedora\"\n" +
            "VERSION_ID=\"7\"\n" +
            "PRETTY_NAME=\"CentOS Linux 7 (Core)\"\n" +
            "ANSI_COLOR=\"0;31\"\n" +
            "CPE_NAME=\"cpe:/o:centos:centos:7\"\n" +
            "HOME_URL=\"https://www.centos.org/\"\n" +
            "BUG_REPORT_URL=\"https://bugs.centos.org/\"\n" +
            "\n" +
            "CENTOS_MANTISBT_PROJECT=\"CentOS-7\"\n" +
            "CENTOS_MANTISBT_PROJECT_VERSION=\"7\"\n" +
            "REDHAT_SUPPORT_PRODUCT=\"centos\"\n" +
            "REDHAT_SUPPORT_PRODUCT_VERSION=\"7\"\n" +
            "```\n" +
            "\n" +
            "Docker的安装步骤：\n" +
            "\n" +
            "## 4.1 卸载旧的版本\n" +
            "\n" +
            "```shell\n" +
            "yum remove docker \\\n" +
            "                  docker-client \\\n" +
            "                  docker-client-latest \\\n" +
            "                  docker-common \\\n" +
            "                  docker-latest \\\n" +
            "                  docker-latest-logrotate \\\n" +
            "                  docker-logrotate \\\n" +
            "                  docker-engine\n" +
            "```\n" +
            "\n" +
            "## 4.2 下载需要的安装包\n" +
            "\n" +
            "```shell\n" +
            "yum install -y yum-utils\n" +
            "```\n" +
            "\n" +
            "## 4.3 设置镜像的仓库\n" +
            "\n" +
            "```shell\n" +
            "yum-config-manager \\\n" +
            "    --add-repo \\\n" +
            "    https://download.docker.com/linux/centos/docker-ce.repo  #国外的地址\n" +
            "    \n" +
            "    # 设置阿里云的Docker镜像仓库\n" +
            "yum-config-manager \\\n" +
            "    --add-repo \\\n" +
            "    https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo  #国内的地址\n" +
            "```\n" +
            "\n" +
            "## 4.4 更新yum软件包索引\n" +
            "\n" +
            "```shell\n" +
            "yum makecache fast\n" +
            "```\n" +
            "\n" +
            "## 4.5 安装docker相关配置\n" +
            "\n" +
            "docker-ce 是社区版，docker-ee 企业版\n" +
            "\n" +
            "```shell\n" +
            "yum install docker-ce docker-ce-cli containerd.io\n" +
            "```\n" +
            "\n" +
            "出现了completed即安装成功。\n" +
            "\n" +
            "## 4.6启动docker\n" +
            "\n" +
            "```shell\n" +
            "systemctl start docker\n" +
            "# 查看当前版本号，是否启动成功\n" +
            "docker version\n" +
            "# 设置开机自启动\n" +
            "systemctl enable docker\n" +
            "```\n" +
            "\n" +
            "结果：\n" +
            "\n" +
            "![2021071712515566.png](https://static.linhaojun.top/articles/386d662b1e8bdd3ffb4aa73dd0d52880.png)\n" +
            "\n" +
            "下载hello-world镜像进行测试\n" +
            "\n" +
            "![20210717125227931.png](https://static.linhaojun.top/articles/e7ed7744b2020bfa9c023f38cec17882.png)\n" +
            "\n" +
            "查看下载的hello world镜像\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z lib]# docker images\n" +
            "REPOSITORY    TAG       IMAGE ID       CREATED         SIZE\n" +
            "hello-world   latest    bf756fb1ae65   11 months ago   13.3kB\n" +
            "```\n" +
            "\n" +
            "# 5.docker的卸载\n" +
            "\n" +
            "```shell\n" +
            "# 1. 卸载依赖\n" +
            "yum remove docker-ce docker-ce-cli containerd.io\n" +
            "# 2. 删除资源  . /var/lib/docker是docker的默认工作路径\n" +
            "rm -rf /var/lib/docker\n" +
            "```\n" +
            "\n" +
            "# 6.配置阿里云镜像加速\n" +
            "\n" +
            "## 6.1 进入阿里云官网，搜索容器镜像服务\n" +
            "\n" +
            "![20210717125337690.png](https://static.linhaojun.top/articles/a6fe14af8199d829fec92b3fd9d50744.png)\n" +
            "\n" +
            "## 6.2 依次执行官方的这四条命令\n" +
            "\n" +
            "```shell\n" +
            "sudo mkdir -p /etc/docker\n" +
            "sudo tee /etc/docker/daemon.json <<-'EOF'\n" +
            "{\n" +
            "  \"registry-mirrors\": [\"https://axvfsf7e.mirror.aliyuncs.com\"]\n" +
            "}\n" +
            "EOF\n" +
            "sudo systemctl daemon-reload\n" +
            "sudo systemctl restart docker\n" +
            "```\n" +
            "\n" +
            "# 7.Docker容器运行流程\n" +
            "\n" +
            "启动一个容器，Docker的运行流程如下图：\n" +
            "\n" +
            "![20210717125820781.png](https://static.linhaojun.top/articles/43cec2d25d563b83ce880150e1590901.png)\n" +
            "\n" +
            "# 8.底层原理\n" +
            "\n" +
            "Docker是一个Client-Server结构的系统，Docker的守护进程运行在主机上，通过Socker从客户端访问！Docker Server接收到Docker-Client的指令，就会执行这个指令！\n" +
            "\n" +
            "![20210717130715341.png](https://static.linhaojun.top/articles/0b87a663b1ff9f9502e51e6e0bb51e65.png)\n" +
            "\n" +
            "Docker为什么比VM Ware快？\n" +
            "\n" +
            "1.Docker比虚拟机更少的抽象层\n" +
            "\n" +
            "2.docker利用宿主机的内核，VM需要的是Guest OS\n" +
            "\n" +
            "![20210717130758965.png](https://static.linhaojun.top/articles/48a8b69b7b36b30220c80539e5d9f7f4.png)\n" +
            "\n" +
            "Docker新建一个容器的时候，不需要像虚拟机一样重新加载一个操作系统内核，直接利用宿主机的操作系统，而虚拟机是需要加载Guest OS。Docker和VM的对比如下：\n" +
            "\n" +
            "![20210717134556550.png](https://static.linhaojun.top/articles/bba1798a5df8d3c2c800b8bd40bddd3c.png)\n" +
            "\n" +
            "# 9.docker常用命令\n" +
            "\n" +
            "## 9.1 基础命令\n" +
            "\n" +
            "```shell\n" +
            "docker version          #查看docker的版本信息\n" +
            "docker info             #查看docker的系统信息,包括镜像和容器的数量\n" +
            "docker 命令 --help       #帮助命令(可查看可选的参数)\n" +
            "docker COMMAND --help\n" +
            "```\n" +
            "\n" +
            "命令的帮助[文档地址](https://docs.docker.com/engine/reference/commandline/docker/)\n" +
            "\n" +
            "## 9.2 镜像命令\n" +
            "\n" +
            "###  **docker images** 查看本地主机的所有镜像\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker images\n" +
            "REPOSITORY    TAG       IMAGE ID       CREATED         SIZE\n" +
            "hello-world   latest    bf756fb1ae65   11 months ago   13.3kB\n" +
            "\n" +
            "#解释:\n" +
            "1.REPOSITORY  镜像的仓库源\n" +
            "\n" +
            "2.TAG  镜像的标签\n" +
            "\n" +
            "3.IMAGE ID 镜像的id\n" +
            "\n" +
            "4.CREATED 镜像的创建时间\n" +
            "\n" +
            "5.SIZE 镜像的大小\n" +
            "\n" +
            "\n" +
            "# 可选参数\n" +
            "\n" +
            "-a/--all 列出所有镜像\n" +
            "\n" +
            "-q/--quiet 只显示镜像的id\n" +
            "```\n" +
            "\n" +
            "### **docker search** 搜索镜像\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker search mysql\n" +
            "NAME                              DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED\n" +
            "mysql                             MySQL is a widely used, open-source relation…   10308     [OK]\n" +
            "mariadb                           MariaDB is a community-developed fork of MyS…   3819      [OK]\n" +
            "mysql/mysql-server                Optimized MySQL Server Docker images. Create…   754                  [OK]\n" +
            "percona                           Percona Server is a fork of the MySQL relati…   517       [OK]\n" +
            "centos/mysql-57-centos7           MySQL 5.7 SQL database server                   86\n" +
            "mysql/mysql-cluster               Experimental MySQL Cluster Docker images. Cr…   79\n" +
            "centurylink/mysql                 Image containing mysql. Optimized to be link…   60                   [OK]\n" +
            "\n" +
            "\n" +
            "#可选参数\n" +
            "\n" +
            "Search the Docker Hub for images\n" +
            "\n" +
            "Options:\n" +
            "  -f, --filter filter   Filter output based on conditions provided\n" +
            "      --format string   Pretty-print search using a Go template\n" +
            "      --limit int       Max number of search results (default 25)\n" +
            "      --no-trunc        Don't truncate output\n" +
            "      \n" +
            "      \n" +
            "#搜索收藏数大于3000的镜像\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker search mysql --filter=STARS=3000\n" +
            "NAME      DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED\n" +
            "mysql     MySQL is a widely used, open-source relation…   10308     [OK]\n" +
            "mariadb   MariaDB is a community-developed fordockerk of MyS…   3819      [OK]\n" +
            "```\n" +
            "\n" +
            "### **docker pull 镜像名[:tag]** 下载镜像\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull mysql\n" +
            "Using default tag: latest            #如果不写tag默认就是latest\n" +
            "latest: Pulling from library/mysql\n" +
            "6ec7b7d162b2: Pull complete          #分层下载,docker image的核心-联合文件系统\n" +
            "fedd960d3481: Pull complete\n" +
            "7ab947313861: Pull complete\n" +
            "64f92f19e638: Pull complete\n" +
            "3e80b17bff96: Pull complete\n" +
            "014e976799f9: Pull complete\n" +
            "59ae84fee1b3: Pull complete\n" +
            "ffe10de703ea: Pull complete\n" +
            "657af6d90c83: Pull complete\n" +
            "98bfb480322c: Pull complete\n" +
            "6aa3859c4789: Pull complete\n" +
            "1ed875d851ef: Pull complete\n" +
            "Digest: shella256:78800e6d3f1b230e35275145e657b82c3fb02a27b2d8e76aac2f5e90c1c30873 #签名\n" +
            "Status: Downloaded newer image for mysql:latest\n" +
            "docker.io/library/mysql:latest  #下载来源的真实地址  #docker pull mysql等价于docker pull docker.io/library/mysql:latest\n" +
            "```\n" +
            "\n" +
            "指定版本下载\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull mysql:5.7\n" +
            "5.7: Pulling from library/mysql\n" +
            "6ec7b7d162b2: Already exists\n" +
            "fedd960d3481: Already exists\n" +
            "7ab947313861: Already exists\n" +
            "64f92f19e638: Already exists\n" +
            "3e80b17bff96: Already exists\n" +
            "014e976799f9: Already exists\n" +
            "59ae84fee1b3: Already exists\n" +
            "7d1da2a18e2e: Pull complete\n" +
            "301a28b700b9: Pull complete\n" +
            "529dc8dbeaf3: Pull complete\n" +
            "bc9d021dc13f: Pull complete\n" +
            "Digest: shella256:c3a567d3e3ad8b05dfce401ed08f0f6bf3f3b64cc17694979d5f2e5d78e10173\n" +
            "Status: Downloaded newer image for mysql:5.7\n" +
            "docker.io/library/mysql:5.7\n" +
            "```\n" +
            "\n" +
            "### **docker rmi**删除镜像\n" +
            "\n" +
            "```shell\n" +
            "#1.删除指定的镜像id\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker rmi -f  镜像id\n" +
            "#2.删除多个镜像id\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker rmi -f  镜像id 镜像id 镜像id\n" +
            "#3.删除全部的镜像id\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker rmi -f  $(docker images -aq)\n" +
            "```\n" +
            "\n" +
            "## 9.3 容器命令\n" +
            "\n" +
            "### 如拉取一个centos镜像\n" +
            "\n" +
            "```shell\n" +
            "docker pull centos\n" +
            "```\n" +
            "\n" +
            "### 运行容器的命令说明\n" +
            "\n" +
            "```shell\n" +
            "docker run [可选参数] image\n" +
            "\n" +
            "#参数说明\n" +
            "--name=\"名字\"           指定容器名字\n" +
            "-d                     后台方式运行\n" +
            "-it                    使用交互方式运行,进入容器查看内容\n" +
            "-p                     指定容器的端口\n" +
            "(\n" +
            "-p ip:主机端口:容器端口  配置主机端口映射到容器端口\n" +
            "-p 主机端口:容器端口\n" +
            "-p 容器端口\n" +
            ")\n" +
            "-P                     随机指定端口(大写的P)\n" +
            "```\n" +
            "\n" +
            "### 运行并进入容器centos\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -it centos /bin/bashell\n" +
            "[root@bd1b8900c547 /]# ls      \n" +
            "bin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var\n" +
            "```\n" +
            "\n" +
            "### 退出容器命令\n" +
            "\n" +
            "```shell\n" +
            "#exit 停止并退出容器（后台方式运行则仅退出）\n" +
            "#Ctrl+P+Q  不停止容器退出\n" +
            "[root@bd1b8900c547 /]# exit\n" +
            "exit\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]#\n" +
            "```\n" +
            "\n" +
            "### 列出运行过的容器命令\n" +
            "\n" +
            "```shell\n" +
            "#docker ps \n" +
            "     # 列出当前正在运行的容器\n" +
            "-a   # 列出所有容器的运行记录\n" +
            "-n=? # 显示最近创建的n个容器\n" +
            "-q   # 只显示容器的编号\n" +
            "\n" +
            "\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps -a\n" +
            "CONTAINER ID   IMAGE          COMMAND       CREATED         STATUS                     PORTS     NAMES\n" +
            "bca129320bb5   centos         \"/bin/bashell\"   4 minutes ago   Exited (0) 3 minutes ago             optimistic_shelltern\n" +
            "bd1b8900c547   centos         \"/bin/bashell\"   6 minutes ago   Exited (0) 5 minutes ago             cool_tesla\n" +
            "cf6adbf1b506   bf756fb1ae65   \"/hello\"      5 hours ago     Exited (0) 5 hours ago               optimistic_darwin\n" +
            "```\n" +
            "\n" +
            "### 删除容器命令\n" +
            "\n" +
            "```shell\n" +
            "docker rm 容器id                 #删除指定的容器,不能删除正在运行的容器,强制删除使用 rm -f\n" +
            "docker rm -f $(docker ps -aq)   #删除所有的容器(慎用)\n" +
            "docker ps -a -q|xargs docker rm #删除所有的容器(慎用)\n" +
            "```\n" +
            "\n" +
            "### 启动和停止容器命令\n" +
            "\n" +
            "```shell\n" +
            "docker start 容器id          #启动容器\n" +
            "docker restart 容器id        #重启容器\n" +
            "docker stop 容器id           #停止当前运行的容器\n" +
            "docker kill 容器id           #强制停止当前容器\n" +
            "```\n" +
            "\n" +
            "### 退出容器命令\n" +
            "\n" +
            "```shell\n" +
            "#exit 停止并退出容器（后台方式运行则仅退出）\n" +
            "#Ctrl+P+Q  不停止容器退出\n" +
            "[root@bd1b8900c547 /]# exit\n" +
            "exit\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]#\n" +
            "```\n" +
            "\n" +
            "### 列出运行过的容器命令\n" +
            "\n" +
            "```shell\n" +
            "#docker ps \n" +
            "     # 列出当前正在运行的容器\n" +
            "-a   # 列出所有容器的运行记录\n" +
            "-n=? # 显示最近创建的n个容器\n" +
            "-q   # 只显示容器的编号\n" +
            "\n" +
            "\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps -a\n" +
            "CONTAINER ID   IMAGE          COMMAND       CREATED         STATUS                     PORTS     NAMES\n" +
            "bca129320bb5   centos         \"/bin/bashell\"   4 minutes ago   Exited (0) 3 minutes ago             optimistic_shelltern\n" +
            "bd1b8900c547   centos         \"/bin/bashell\"   6 minutes ago   Exited (0) 5 minutes ago             cool_tesla\n" +
            "cf6adbf1b506   bf756fb1ae65   \"/hello\"      5 hours ago     Exited (0) 5 hours ago               optimistic_darwin\n" +
            "```\n" +
            "\n" +
            "### 列出运行过的容器命令\n" +
            "\n" +
            "```shell\n" +
            "#docker ps \n" +
            "     # 列出当前正在运行的容器\n" +
            "-a   # 列出所有容器的运行记录\n" +
            "-n=? # 显示最近创建的n个容器\n" +
            "-q   # 只显示容器的编号\n" +
            "\n" +
            "\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps -a\n" +
            "CONTAINER ID   IMAGE          COMMAND       CREATED         STATUS                     PORTS     NAMES\n" +
            "bca129320bb5   centos         \"/bin/bashell\"   4 minutes ago   Exited (0) 3 minutes ago             optimistic_shelltern\n" +
            "bd1b8900c547   centos         \"/bin/bashell\"   6 minutes ago   Exited (0) 5 minutes ago             cool_tesla\n" +
            "cf6adbf1b506   bf756fb1ae65   \"/hello\"      5 hours ago     Exited (0) 5 hours ago               optimistic_darwin\n" +
            "```\n" +
            "\n" +
            "### 删除容器命令\n" +
            "\n" +
            "```shell\n" +
            "docker rm 容器id                 #删除指定的容器,不能删除正在运行的容器,强制删除使用 rm -f\n" +
            "docker rm -f $(docker ps -aq)   #删除所有的容器\n" +
            "docker ps -a -q|xargs docker rm #删除所有的容器\n" +
            "```\n" +
            "\n" +
            "### 启动和停止容器命令\n" +
            "\n" +
            "```shell\n" +
            "docker start 容器id          #启动容器\n" +
            "docker restart 容器id        #重启容器\n" +
            "docker stop 容器id           #停止当前运行的容器\n" +
            "docker kill 容器id           #强制停止当前容器\n" +
            "```\n" +
            "\n" +
            "## 10.4其他命令的使用\n" +
            "\n" +
            "###  日志的查看\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker logs --help\n" +
            "\n" +
            "Usage:  docker logs [OPTIONS] CONTAINER\n" +
            "\n" +
            "Fetch the logs of a container\n" +
            "\n" +
            "Options:\n" +
            "      --details        shellow extra details provided to logs\n" +
            "  -f, --follow         Follow log output\n" +
            "      --since string   shellow logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)\n" +
            "  -n, --tail string    Number of lines to shellow from the end of the logs (default \"all\")\n" +
            "  -t, --timestamps     shellow timestamps\n" +
            "      --until string   shellow logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)\n" +
            "\n" +
            "常用：\n" +
            "docker logs -tf 容器id\n" +
            "docker logs --tail number 容器id #num为要显示的日志条数\n" +
            "\n" +
            "\n" +
            "#docker容器后台运行，必须要有一个前台的进程，否则会自动停止\n" +
            "#编写shellell脚本循环执行，使得centos容器保持运行状态\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -d centos /bin/shell -c \"while true;do echo hi;sleep 5;done\"\n" +
            "c703b5b1911ff84d584390263a35707b6024816e1f46542b61918a6327a570dc\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES\n" +
            "c703b5b1911f   centos    \"/bin/shell -c 'while t…\"   13 seconds ago   Up 10 seconds             pedantic_banach\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker logs -tf --tail 10 c703b5b1911f\n" +
            "2020-12-27T03:34:07.255599560Z hi\n" +
            "2020-12-27T03:34:12.257641517Z hi\n" +
            "2020-12-27T03:34:17.259706294Z hi\n" +
            "2020-12-27T03:34:22.261693707Z hi\n" +
            "2020-12-27T03:34:27.262609289Z hi\n" +
            "2020-12-27T03:34:32.267862677Z hi\n" +
            "2020-12-27T03:34:37.270382873Z hi\n" +
            "2020-12-27T03:34:42.272414182Z hi\n" +
            "2020-12-27T03:34:47.274823243Z hi\n" +
            "2020-12-27T03:34:52.277419274Z hi\n" +
            "```\n" +
            "\n" +
            "### 查看容器中进程信息\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker top 容器ID\n" +
            "```\n" +
            "\n" +
            "### 查看容器的元数据\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker inspect 容器ID\n" +
            "```\n" +
            "\n" +
            "### 进入当前正在运行的容器\n" +
            "\n" +
            "因为通常我们的容器都是使用后台方式来运行的，有时需要进入容器修改配置\n" +
            "\n" +
            "方式一：\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it 容器ID /bin/bashell\n" +
            "[root@c703b5b1911f /]# ls\n" +
            "bin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var\n" +
            "[root@c703b5b1911f /]# ps -ef      \n" +
            "UID        PID  PPID  C STIME TTY          TIME CMD\n" +
            "root         1     0  0 03:31 ?        00:00:00 /bin/shell -c while true;do echo hi;sleep 5;done\n" +
            "root       279     0  0 03:54 pts/0    00:00:00 /bin/bashell\n" +
            "root       315     1  0 03:56 ?        00:00:00 /usr/bin/coreutils --coreutils-prog-shellebang=sleep /usr/bin/sleep 5\n" +
            "root       316   279  0 03:56 pts/0    00:00:00 ps -ef\n" +
            "```\n" +
            "\n" +
            "方式二：\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker attach 容器ID\n" +
            "```\n" +
            "\n" +
            "### 拷贝操作\n" +
            "\n" +
            "```shell\n" +
            "#拷贝容器的文件到主机中\n" +
            "docker cp 容器id:容器内路径  目的主机路径\n" +
            "\n" +
            "#拷贝宿主机的文件到容器中\n" +
            "docker cp 目的主机路径 容器id:容器内路径\n" +
            "```\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it c703b5b1911f /bin/bashell\n" +
            "[root@c703b5b1911f /]# cd home\n" +
            "[root@c703b5b1911f home]# ls\n" +
            "#touch 新建文件\n" +
            "[root@c703b5b1911f home]# touch test.java\n" +
            "[root@c703b5b1911f home]# ls\n" +
            "test.java\n" +
            "[root@c703b5b1911f home]# exit\n" +
            "exit\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES\n" +
            "c703b5b1911f   centos    \"/bin/shell -c 'while t…\"   35 minutes ago   Up 35 minutes             pedantic_banach\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker cp c703b5b1911f:/home/test.java /home\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# ls /home\n" +
            "hai  pan  test.java\n" +
            "```\n" +
            "\n" +
            "命令小节的图解如下：\n" +
            "\n" +
            "![20210717134852290.png](https://static.linhaojun.top/articles/e4c84e43240ac6c8fe80869c8b0f9b38.png)\n" +
            "\n" +
            "# 10.图形化管理工具Portaniner安装\n" +
            "\n" +
            "Portaniner是Docker的图形化管理工具，类似的工具还有Rancher(CI/CD再用)\n" +
            "\n" +
            "下载运行Portaniner镜像并运行，设置本机映射端口为8088\n" +
            "\n" +
            "```shell\n" +
            "[root@localhost conf]# docker run -d -p 8088:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer\n" +
            "Unable to find image 'portainer/portainer:latest' locally\n" +
            "latest: Pulling from portainer/portainer\n" +
            "94cfa856b2b1: Pull complete\n" +
            "49d59ee0881a: Pull complete\n" +
            "a2300fd28637: Pull complete\n" +
            "Digest: shella256:fb45b43738646048a0a0cc74fcee2865b69efde857e710126084ee5de9be0f3f\n" +
            "Status: Downloaded newer image for portainer/portainer:latest\n" +
            "8c525a0137be22965bd1e3944da622a2c4248f8ad20883f4b3ea4f8a6b11e163\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "CONTAINER ID   IMAGE                 COMMAND        CREATED         STATUS         PORTS                    NAMES\n" +
            "7789d4505a00   portainer/portainer   \"/portainer\"   6 seconds ago   Up 5 seconds   0.0.0.0:8088->9000/tcp   quirky_sinoussi\n" +
            "```\n" +
            "\n" +
            "第一次登录设置admin用户的密码\n" +
            "\n" +
            "![20210718000547236.png](https://static.linhaojun.top/articles/0c3aa531443e1634cdde2192f74dad91.png)\n" +
            "\n" +
            "如果是阿里云服务器记得设置安全组，选择连接本地的Docker,整体界面预览如下图：\n" +
            "\n" +
            "![20210718000659945.png](https://static.linhaojun.top/articles/59217c0d0f480ccd19aff88c38aedda3.png)\n" +
            "\n" +
            "# 11. Docker镜像详解\n" +
            "\n" +
            "## 11.1 什么是镜像\n" +
            "\n" +
            "镜像是一种轻量级、可执行的独立软件包，用来打包软件运行环境和基于运行环境开发的软件，它包含运行某个软件所需要的所有内容，包括代码，运行时（一个程序在运行或者在被执行的依赖）、库，环境变量和配置文件。\n" +
            "\n" +
            "## 11.2 Docker镜像加载原理\n" +
            "\n" +
            "Docker的镜像实际上由一层一层的文件系统组成，这种层级的文件系统是UnionFS联合文件系统。\n" +
            "\n" +
            "![20210718123220152.png](https://static.linhaojun.top/articles/18ecd03b542e29101fc0b3afa0b6fdef.png)\n" +
            "\n" +
            "![20210718123416610.png](https://static.linhaojun.top/articles/5a0a8d3d61190745dfa493813e817b59.png)\n" +
            "\n" +
            "## 11.3 分层理解\n" +
            "\n" +
            "![20210718123512798.png](https://static.linhaojun.top/articles/7df73cc8000a2ae175a928f9294550a4.png)\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker image inspect nginx:latest\n" +
            "[\n" +
            "    {\n" +
            "        \"Id\": \"shella256:ae2feff98a0cc5095d97c6c283dcd33090770c76d63877caa99aefbbe4343bdd\",\n" +
            "        \"RepoTags\": [\n" +
            "            \"nginx:latest\"\n" +
            "        ],\n" +
            "        \"RepoDigests\": [\n" +
            "            \"nginx@shella256:4cf620a5c81390ee209398ecc18e5fb9dd0f5155cd82adcbae532fec94006fb9\"\n" +
            "        ],\n" +
            "        \"Parent\": \"\",\n" +
            "        \"Comment\": \"\",\n" +
            "        \"Created\": \"2020-12-15T20:21:00.007674532Z\",\n" +
            "        \"Container\": \"4cc5da85f27ca0d200407f0593422676a3bab482227daee044d797d1798c96c9\",\n" +
            "        \"ContainerConfig\": {\n" +
            "            \"Hostname\": \"4cc5da85f27c\",\n" +
            "            \"Domainname\": \"\",\n" +
            "            \"User\": \"\",\n" +
            "            \"AttachStdin\": false,\n" +
            "            \"AttachStdout\": false,\n" +
            "            \"AttachStderr\": false,\n" +
            "            \"ExposedPorts\": {\n" +
            "                \"80/tcp\": {}\n" +
            "            },\n" +
            "            \"Tty\": false,\n" +
            "            \"OpenStdin\": false,\n" +
            "            \"StdinOnce\": false,\n" +
            "            \"Env\": [\n" +
            "                \"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\",\n" +
            "                \"NGINX_VERSION=1.19.6\",\n" +
            "                \"NJS_VERSION=0.5.0\",\n" +
            "                \"PKG_RELEASE=1~buster\"\n" +
            "            ],\n" +
            "            \"Cmd\": [\n" +
            "                \"/bin/shell\",\n" +
            "                \"-c\",\n" +
            "                \"#(nop) \",\n" +
            "                \"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"\n" +
            "            ],\n" +
            "            \"Image\": \"shella256:13bffe371b56f4aeed88218ec17d0c6f653a83b49bd3e211fc8cfa2ca5d7a3d3\",\n" +
            "            \"Volumes\": null,\n" +
            "            \"WorkingDir\": \"\",\n" +
            "            \"Entrypoint\": [\n" +
            "                \"/docker-entrypoint.shell\"\n" +
            "            ],\n" +
            "            \"OnBuild\": null,\n" +
            "            \"Labels\": {\n" +
            "                \"maintainer\": \"NGINX Docker Maintainers <docker-maint@nginx.com>\"\n" +
            "            },\n" +
            "            \"StopSignal\": \"SIGQUIT\"\n" +
            "        },\n" +
            "        \"DockerVersion\": \"19.03.12\",\n" +
            "        \"Author\": \"\",\n" +
            "        \"Config\": {\n" +
            "            \"Hostname\": \"\",\n" +
            "            \"Domainname\": \"\",\n" +
            "            \"User\": \"\",\n" +
            "            \"AttachStdin\": false,\n" +
            "            \"AttachStdout\": false,\n" +
            "            \"AttachStderr\": false,\n" +
            "            \"ExposedPorts\": {\n" +
            "                \"80/tcp\": {}\n" +
            "            },\n" +
            "            \"Tty\": false,\n" +
            "            \"OpenStdin\": false,\n" +
            "            \"StdinOnce\": false,\n" +
            "            \"Env\": [\n" +
            "                \"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\",\n" +
            "                \"NGINX_VERSION=1.19.6\",\n" +
            "                \"NJS_VERSION=0.5.0\",\n" +
            "                \"PKG_RELEASE=1~buster\"\n" +
            "            ],\n" +
            "            \"Cmd\": [\n" +
            "                \"nginx\",\n" +
            "                \"-g\",\n" +
            "                \"daemon off;\"\n" +
            "            ],\n" +
            "            \"Image\": \"shella256:13bffe371b56f4aeed88218ec17d0c6f653a83b49bd3e211fc8cfa2ca5d7a3d3\",\n" +
            "            \"Volumes\": null,\n" +
            "            \"WorkingDir\": \"\",\n" +
            "            \"Entrypoint\": [\n" +
            "                \"/docker-entrypoint.shell\"\n" +
            "            ],\n" +
            "            \"OnBuild\": null,\n" +
            "            \"Labels\": {\n" +
            "                \"maintainer\": \"NGINX Docker Maintainers <docker-maint@nginx.com>\"\n" +
            "            },\n" +
            "            \"StopSignal\": \"SIGQUIT\"\n" +
            "        },\n" +
            "        \"Architecture\": \"amd64\",\n" +
            "        \"Os\": \"linux\",\n" +
            "        \"Size\": 132935043,\n" +
            "        \"VirtualSize\": 132935043,\n" +
            "        \"GraphDriver\": {\n" +
            "            \"Data\": {\n" +
            "                \"LowerDir\": \"/var/lib/docker/overlay2/cb791e78a08db7091bf2ce1d78603f1758f52199e57f1805156fe30e39067aae/diff:/var/lib/docker/overlay2/1e73a72b25af68ee9abf4eb443f778d31226e12e9af428fcc14c7b044c83b258/diff:/var/lib/docker/overlay2/88c9c01762f2af8327db65d0b0d4a64785e87c9c2ab76c62e7d03619db03a985/diff:/var/lib/docker/overlay2/7304ab112ac4a9cb91fc6f74730be28fecbe19f042e92d321aa9181424cc4b2e/diff\",\n" +
            "                \"MergedDir\": \"/var/lib/docker/overlay2/48b288740bbb2b07b41ed43a4d17a005c46b08d3357d2960b5ef7db4b2de6618/merged\",\n" +
            "                \"UpperDir\": \"/var/lib/docker/overlay2/48b288740bbb2b07b41ed43a4d17a005c46b08d3357d2960b5ef7db4b2de6618/diff\",\n" +
            "                \"WorkDir\": \"/var/lib/docker/overlay2/48b288740bbb2b07b41ed43a4d17a005c46b08d3357d2960b5ef7db4b2de6618/work\"\n" +
            "            },\n" +
            "            \"Name\": \"overlay2\"\n" +
            "        },\n" +
            "        \"RootFS\": {\n" +
            "            \"Type\": \"layers\",\n" +
            "            \"Layers\": [\n" +
            "                \"shella256:87c8a1d8f54f3aa4e05569e8919397b65056aa71cdf48b7f061432c98475eee9\",\n" +
            "                \"shella256:5c4e5adc71a82a96f02632433de31c998c5a9e2fccdcbaee780ae83158fac4fa\",\n" +
            "                \"shella256:7d2b207c26790f693ab1942bbe26af8e2b6a14248969e542416155a912fec30d\",\n" +
            "                \"shella256:2c7498eef94aef8c40d106f3e42f7da62b3eee8fd36012bf7379becc4cd639a2\",\n" +
            "                \"shella256:4eaf0ea085df254fd5d2beba4e2c11db70a620dfa411a8ad44149e26428caee4\"\n" +
            "            ]\n" +
            "        },\n" +
            "        \"Metadata\": {\n" +
            "            \"LastTagTime\": \"0001-01-01T00:00:00Z\"\n" +
            "        }\n" +
            "    }\n" +
            "]\n" +
            "```\n" +
            "\n" +
            "这里指示了分层信息：\n" +
            "\n" +
            "```shell\n" +
            "        \"RootFS\": {\n" +
            "            \"Type\": \"layers\",\n" +
            "            \"Layers\": [\n" +
            "                \"shella256:87c8a1d8f54f3aa4e05569e8919397b65056aa71cdf48b7f061432c98475eee9\",\n" +
            "                \"shella256:5c4e5adc71a82a96f02632433de31c998c5a9e2fccdcbaee780ae83158fac4fa\",\n" +
            "                \"shella256:7d2b207c26790f693ab1942bbe26af8e2b6a14248969e542416155a912fec30d\",\n" +
            "                \"shella256:2c7498eef94aef8c40d106f3e42f7da62b3eee8fd36012bf7379becc4cd639a2\",\n" +
            "                \"shella256:4eaf0ea085df254fd5d2beba4e2c11db70a620dfa411a8ad44149e26428caee4\"\n" +
            "            ]\n" +
            "        },\n" +
            "```\n" +
            "\n" +
            "![20210718123636415.png](https://static.linhaojun.top/articles/9d8fe9bae44994847e6f0048113b63e2.png)\n" +
            "\n" +
            "![2021071812372978.png](https://static.linhaojun.top/articles/f723353894c42cb0c79ef5d5e20acda7.png)\n" +
            "\n" +
            "![2021071812374035.png](https://static.linhaojun.top/articles/000d7691dd3348a07660dc2ce6d8b1c4.png)\n" +
            "\n" +
            "## 11.4 提交镜像\n" +
            "\n" +
            "```shell\n" +
            "使用docker commit 命令提交容器成为一个新的版本\n" +
            "\n" +
            "docker commit -m=“提交的描述信息”  -a=\"作者\" 容器id 目标镜像名:[TAG] \n" +
            "```\n" +
            "\n" +
            "由于默认的Tomcat镜像的webapps文件夹中没有任何内容，需要从webapps.dist中拷贝文件到webapps文件夹。下面自行制作镜像：就是从webapps.dist中拷贝文件到webapps文件夹下，并提交该镜像作为一个新的镜像。使得该镜像默认的webapps文件夹下就有文件。具体命令如下：\n" +
            "\n" +
            "```shell\n" +
            "#1.复制文件夹\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -it tomcat /bin/bashell\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat# cd webapps\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat/webapps# ls\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat/webapps# cd ../\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat# cp -r webapps.dist/* webapps\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat# cd webapps\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat/webapps# ls\n" +
            "ROOT  docs  examples  host-manager  manager\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "CONTAINER ID   IMAGE                 COMMAND        CREATED         STATUS         PORTS                    NAMES\n" +
            "2a3bf3eaa2e4   tomcat                \"/bin/bashell\"    4 minutes ago   Up 4 minutes   8080/tcp                 competent_torvalds\n" +
            "7789d4505a00   portainer/portainer   \"/portainer\"   24 hours ago    Up 24 hours    0.0.0.0:8088->9000/tcp   quirky_sinoussi\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it 2a3bf3eaa2e4 /bin/bashell\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat# cd webapps\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat/webapps# ls\n" +
            "ROOT  docs  examples  host-manager  manager\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat/webapps# cd ../\n" +
            "root@2a3bf3eaa2e4:/usr/local/tomcat# read escape sequence\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "CONTAINER ID   IMAGE                 COMMAND        CREATED         STATUS         PORTS                    NAMES\n" +
            "2a3bf3eaa2e4   tomcat                \"/bin/bashell\"    8 minutes ago   Up 8 minutes   8080/tcp                 competent_torvalds\n" +
            "7789d4505a00   portainer/portainer   \"/portainer\"   24 hours ago    Up 24 hours    0.0.0.0:8088->9000/tcp   quirky_sinoussi\n" +
            "#2.提交镜像作为一个新的镜像\n" +
            "\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker commit -m=\"add webapps\" -a=\"Ethan\" 2a3bf3eaa2e4 mytomcat:1.0\n" +
            "shella256:f189aac861de51087af5bc88a5f1de02d9574e7ee2d163c647dd7503a2d3982b\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker images\n" +
            "REPOSITORY            TAG       IMAGE ID       CREATED         SIZE\n" +
            "mytomcat              1.0       f189aac861de   7 seconds ago   653MB\n" +
            "mysql                 5.7       f07dfa83b528   6 days ago      448MB\n" +
            "tomcat                latest    feba8d001e3f   10 days ago     649MB\n" +
            "nginx                 latest    ae2feff98a0c   12 days ago     133MB\n" +
            "centos                latest    300e315adb2f   2 weeks ago     209MB\n" +
            "portainer/portainer   latest    62771b0b9b09   5 months ago    79.1MB\n" +
            "elasticsearch         7.6.2     f29a1ee41030   9 months ago    791MB\n" +
            "\n" +
            "#3.运行容器\n" +
            "\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -it mytomcat:1.0 /bin/bashell\n" +
            "root@1645774d4605:/usr/local/tomcat# cd webapps\n" +
            "root@1645774d4605:/usr/local/tomcat/webapps# ls\n" +
            "ROOT  docs  examples  host-manager  manager\n" +
            "wz99sm8v95sckz8bd2c4Z ~]# docker images\n" +
            "REPOSITORY            TAG       IMAGE ID       CREATED         SIZE\n" +
            "mytomcat              1.0       f189aac861de   7 seconds ago   653MB\n" +
            "mysql                 5.7       f07dfa83b528   6 days ago      448MB\n" +
            "tomcat                latest    feba8d001e3f   10 days ago     649MB\n" +
            "nginx                 latest    ae2feff98a0c   12 days ago     133MB\n" +
            "centos                latest    300e315adb2f   2 weeks ago     209MB\n" +
            "portainer/portainer   latest    62771b0b9b09   5 months ago    79.1MB\n" +
            "elasticsearch         7.6.2     f29a1ee41030   9 months ago    791MB\n" +
            "```\n" +
            "\n" +
            "# 12.常用容器部署\n" +
            "\n" +
            "## 12.1 Nginx部署\n" +
            "\n" +
            "1. 搜索并下载镜像\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker search nginx\n" +
            "NAME                               DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED\n" +
            "nginx                              Official build of Nginx.                        14207     [OK]       \n" +
            "jwilder/nginx-proxy                Automated Nginx reverse proxy for docker con…   1932                 [OK]\n" +
            "richarvey/nginx-php-fpm            Container running Nginx + PHP-FPM capable of…   797                  [OK]\n" +
            "linuxserver/nginx                  An Nginx container, brought to you by LinuxS…   137                  \n" +
            "jc21/nginx-proxy-manager           Docker container for managing Nginx proxy ho…   123                  \n" +
            "tiangolo/nginx-rtmp                Docker image with Nginx using the nginx-rtmp…   107                  [OK]\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull nginx\n" +
            "Using default tag: latest\n" +
            "latest: Pulling from library/nginx\n" +
            "6ec7b7d162b2: Already exists \n" +
            "cb420a90068e: Pull complete \n" +
            "2766c0bf2b07: Pull complete \n" +
            "e05167b6a99d: Pull complete \n" +
            "70ac9d795e79: Pull complete \n" +
            "Digest: shella256:4cf620a5c81390ee209398ecc18e5fb9dd0f5155cd82adcbae532fec94006fb9\n" +
            "Status: Downloaded newer image for nginx:latest\n" +
            "docker.io/library/nginx:latest\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker images;\n" +
            "REPOSITORY   TAG       IMAGE ID       CREATED       SIZE\n" +
            "mysql        5.7       f07dfa83b528   5 days ago    448MB\n" +
            "nginx        latest    ae2feff98a0c   11 days ago   133MB\n" +
            "centos       latest    300e315adb2f   2 weeks ago   209MB\n" +
            "```\n" +
            "\n" +
            "可以到[dockerhub官网](https://hub.docker.com/_/nginx)查看Nginx的详细版本信息\n" +
            "\n" +
            "2. 运行测试\n" +
            "\n" +
            "```shell\n" +
            "docker run -d --name nginx01 -p 3334:80 nginx\n" +
            "\n" +
            "-d 后台运行\n" +
            "--name 给容器命名\n" +
            "-p 3334:80 将宿主机的端口3334映射到该容器的80端口\n" +
            "```\n" +
            "\n" +
            "运行结果：\n" +
            "\n" +
            "```shell\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it nginx01 /bin/bashell\n" +
            "Error: No such container: nginx01\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -d --name nginx01 -p 3334:80 nginx\n" +
            "20c896637ff5de8be835797109d62ee2465e28d9d716be5a8d550ef7d547fcf5\n" +
            "[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                  NAMES\n" +
            "20c896637ff5   nginx     \"/docker-entrypoint.…\"   7 seconds ago   Up 5 seconds   0.0.0.0:3334->80/tcp   nginx01\n" +
            "```\n" +
            "\n" +
            "端口暴露的概念\n" +
            "\n" +
            "![20210718124656411.png](https://static.linhaojun.top/articles/fc0d205dbe5278bbcbbc63b15949f587.png)\n" +
            "\n" +
            "3. 配置文件\n" +
            "   进入容器，自定义配置文件\n" +
            "\n" +
            "   ```shell\n" +
            "   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it nginx01 /bin/bashell\n" +
            "   root@20c896637ff5:/# whereis nginx\n" +
            "   nginx: /usr/sbin/nginx /usr/lib/nginx /etc/nginx /usr/shellare/nginx\n" +
            "   root@20c896637ff5:/# cd /etc/nginx\n" +
            "   root@20c896637ff5:/etc/nginx# ls\n" +
            "   conf.d\tfastcgi_params\tkoi-utf  koi-win  mime.types  modules  nginx.conf  scgi_params\tuwsgi_params  win-utf\n" +
            "   root@20c896637ff5:/# cd /etc/nginx\n" +
            "   root@20c896637ff5:/etc/nginx# ls\n" +
            "   conf.d\tfastcgi_params\tkoi-utf  koi-win  mime.types  modules  nginx.conf  scgi_params\tuwsgi_params  win-utf\n" +
            "   ```\n" +
            "\n" +
            "4. 访问测试\n" +
            "   本地主机访问测试，curl命令发起请求，如果使用阿里云服务器需要设置安全组。\n" +
            "\n" +
            "   ```shell\n" +
            "   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n" +
            "   CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                  NAMES\n" +
            "   20c896637ff5   nginx     \"/docker-entrypoint.…\"   7 minutes ago   Up 7 minutes   0.0.0.0:3334->80/tcp   nginx01\n" +
            "   [root@iZwz99sm8v95sckz8bd2c4Z ~]# curl localhost:3334\n" +
            "   <!DOCTYPE html>\n" +
            "   <html>\n" +
            "   <head>\n" +
            "   <title>Welcome to nginx!</title>\n" +
            "   <style>\n" +
            "       body {\n" +
            "           width: 35em;\n" +
            "           margin: 0 auto;\n" +
            "           font-family: Tahoma, Verdana, Arial, sans-serif;\n" +
            "       }\n" +
            "   </style>\n" +
            "   </head>\n" +
            "   <body>\n" +
            "   <h1>Welcome to nginx!</h1>\n" +
            "   <p>If you see this page, the nginx web server is successfully installed and\n" +
            "   working. Further configuration is required.</p>\n" +
            "   \n" +
            "   <p>For online documentation and support please refer to\n" +
            "   <a href=\"http://nginx.org/\">nginx.org</a>.<br/>\n" +
            "   Commercial support is available at\n" +
            "   <a href=\"http://nginx.com/\">nginx.com</a>.</p>\n" +
            "   \n" +
            "   <p><em>Thank you for using nginx.</em></p>\n" +
            "   </body>\n" +
            "   </html>\n" +
            "   ```\n" +
            "\n" +
            "5. 安装vim\n" +
            "\n" +
            "   我们使用Nginx往往需要编写配置文件，但是Nginx官方镜像没有安装vim，需要我们手动进行安装。使用以下命令进行安装：\n" +
            "\n" +
            "   ```shell\n" +
            "   #检查是否已安装\n" +
            "   rpm -qa|grep vim\n" +
            "   #如果已安装，会显示：\n" +
            "   [root@localhost usr]# rpm -qa|grep vim\n" +
            "   vim-minimal-7.4.629-6.el7.x86_64\n" +
            "   vim-filesystem-7.4.629-6.el7.x86_64\n" +
            "   vim-enhanced-7.4.629-6.el7.x86_64\n" +
            "   vim-common-7.4.629-6.el7.x86_64\n" +
            "   vim-X11-7.4.629-6.el7.x86_64\n" +
            "   #安装\n" +
            "   #如果缺少了其中某个，比如说： vim-enhanced这个包少了，则执行：\n" +
            "   yum -y install vim-enhanced\n" +
            "   #它会自动下载安装。如果上面三个包一个都没有显示，则直接输入命令：\n" +
            "   yum -y install vim*\n" +
            "   #配置\n" +
            "   vim /etc/vimrc\n" +
            "   #打开文件后，按 i 进入编辑模式，然后找一个位置添加如下代码\n" +
            "   set nu          \" 设置显示行号\n" +
            "   set shellowmode    \" 设置在命令行界面最下面显示当前模式等\n" +
            "   set ruler       \" 在右下角显示光标所在的行数等信息\n" +
            "   set autoindent  \" 设置每次单击Enter键后，光标移动到下一行时与上一行的起始字符对齐\n" +
            "   syntax on       \" 即设置语法检测，当编辑C或者shellell脚本时，关键字会用特殊颜色显示\n" +
            "   ```\n" +
            "\n" +
            "   ps: **由于到目前为止还没学到数据卷，具体的设置以及编写配置文件，你可以先到后面了解一下数据卷，再来编写配置文件**\n" +
            "\n" +
            "## 12.2 Tomcat的部署\n" +
            "\n" +
            "1. 下载并运行\n" +
            "\n" +
            "   ```shell\n" +
            "   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull tomcat\n" +
            "   Using default tag: latest\n" +
            "   latest: Pulling from library/tomcat\n" +
            "   6c33745f49b4: Pull complete \n" +
            "   ef072fc32a84: Pull complete \n" +
            "   c0afb8e68e0b: Pull complete \n" +
            "   d599c07d28e6: Pull complete \n" +
            "   e8a829023b97: Pull complete \n" +
            "   d04be46a31d1: Pull complete \n" +
            "   db6007c69c35: Pull complete \n" +
            "   e4ad4c894bce: Pull complete \n" +
            "   248895fda357: Pull complete \n" +
            "   277059b4cba2: Pull complete \n" +
            "   Digest: shella256:57dae7dfb9b62a413cde65334c8a18893795cac70afc3be589c8336d8244655d\n" +
            "   Status: Downloaded newer image for tomcat:latest\n" +
            "   docker.io/library/tomcat:latest\n" +
            "   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -d -p 3335:8080 --name tomcat01 tomcat\n" +
            "   7136295a6082cb0f805b025a1471bde02ead4864be3e2c9dcd337b1dde0a3113\n" +
            "   ```\n" +
            "\n" +
            "2. 进入容器\n" +
            "\n" +
            "   ```shell\n" +
            "   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it tomcat01 /bin/bashell\n" +
            "   root@7136295a6082:/usr/local/tomcat# ls\n" +
            "   BUILDING.txt  CONTRIBUTING.md  LICENSE\tNOTICE\tREADME.md  RELEASE-NOTES  RUNNING.txt  bin  conf  lib  logs  native-jni-lib  temp  webapps  webapps.dist  work\n" +
            "   root@7136295a6082:/usr/local/tomcat# cd webapps.dist\n" +
            "   root@7136295a6082:/usr/local/tomcat/webapps.dist# ls\n" +
            "   ROOT  docs  examples  host-manager  manager\n" +
            "   root@7136295a6082:/usr/local/tomcat/webapps.dist# cd ROOT\n" +
            "   root@7136295a6082:/usr/local/tomcat/webapps.dist/ROOT# ls\n" +
            "   RELEASE-NOTES.txt  WEB-INF  asf-logo-wide.svg  bg-button.png  bg-middle.png  bg-nav.png  bg-upper.png  favicon.ico  index.jsp  tomcat.css  tomcat.svg\n" +
            "   root@7136295a6082:/usr/local/tomcat/webapps.dist/ROOT# cd ../../\n" +
            "   root@7136295a6082:/usr/local/tomcat# cd webapps\n" +
            "   root@7136295a6082:/usr/local/tomcat/webapps# ls\n" +
            "   root@7136295a6082:/usr/local/tomcat/webapps# cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/\n" +
            "   root@7136295a6082:/usr/local/tomcat/webapps# ls\n" +
            "   ROOT  docs  examples  host-manager  manager\n" +
            "   root@7136295a6082:/usr/local/tomcat/webapps# exit\n" +
            "   exit\n" +
            "   ```\n" +
            "\n" +
            "3. 访问测试\n" +
            "\n" +
            "   ```shell\n" +
            "   [root@iZwz99sm8v95sckz8bd2c4Z ~]# curl localhost:3335\n" +
            "   \n" +
            "   <!DOCTYPE html>\n" +
            "   <html lang=\"en\">\n" +
            "       <head>\n" +
            "           <meta charset=\"UTF-8\" />\n" +
            "           <title>Apache Tomcat/9.0.41</title>\n" +
            "           <link href=\"favicon.ico\" rel=\"icon\" type=\"image/x-icon\" />\n" +
            "           <link href=\"tomcat.css\" rel=\"styleshelleet\" type=\"text/css\" />\n" +
            "       </head>\n" +
            "   \n" +
            "       <body>\n" +
            "           <div id=\"wrapper\">\n" +
            "               <div id=\"navigation\" class=\"curved container\">\n" +
            "                   <span id=\"nav-home\"><a href=\"https://tomcat.apache.org/\">Home</a></span>\n" +
            "                   <span id=\"nav-hosts\"><a href=\"/docs/\">Documentation</a></span>\n" +
            "                   <span id=\"nav-config\"><a href=\"/docs/config/\">Configuration</a></span>\n" +
            "                   <span id=\"nav-examples\"><a href=\"/examples/\">Examples</a></span>\n" +
            "                   <span id=\"nav-wiki\"><a href=\"https://wiki.apache.org/tomcat/FrontPage\">Wiki</a></span>\n" +
            "                   <span id=\"nav-lists\"><a href=\"https://tomcat.apache.org/lists.html\">Mailing Lists</a></span>\n" +
            "                   <span id=\"nav-help\"><a href=\"https://tomcat.apache.org/findhelp.html\">Find Help</a></span>\n" +
            "                   <br class=\"separator\" />\n" +
            "               </div>\n" +
            "   ```\n" +
            "\n" +
            "   \n" +
            "\n" +
            "## 12.3ElasticSearch部署\n" +
            "\n" +
            "### 安装elasticsearch并部署\n" +
            "\n" +
            "1. 拉取Elasticsearch镜像\n" +
            "\n" +
            "   ```shell\n" +
            "   docker pull elasticsearch:7.7.0\n" +
            "   ```\n" +
            "\n" +
            "![21782a576ca644869ba50165184f056e.png](https://static.linhaojun.top/articles/c196fe08e838e2a0423b754d3dc684dc.png)\n" +
            "\n" +
            "查看镜像命令：docker images\n" +
            "删除镜像命令：`docker rmi <镜像名:版本号>` or docker rmi <镜像id>\n" +
            "![77d67f2c1f404c4286eefca7e5c8c5cd.png](https://static.linhaojun.top/articles/19ad83720725e1fa05abf01b81b50286.png)\n" +
            "\n" +
            "2. 启动前准备\n" +
            "   创建存放数据及配置文件的文件夹，启动时挂载。\n" +
            "\n" +
            "   ```shell\n" +
            "   mkdir -p  /home/elasticsearch/data/ \n" +
            "   mkdir -p  /home/elasticsearch/config/\n" +
            "   ```\n" +
            "\n" +
            "![962ad3c43cd24b75bdec7a75e971efdb.png](https://static.linhaojun.top/articles/b4bb3cc9d1071e8a8ea49d97bf842821.png)\n" +
            "\n" +
            "**解释**：\n" +
            "\n" +
            "- -p： 参数来创建多级文件夹\n" +
            "- tree：以树形结构展示文件目录\n" +
            "\n" +
            "**编写配置文件**\n" +
            "\n" +
            "```shell\n" +
            "echo 'http.host: 0.0.0.0\n" +
            "http.cors.enabled: true\n" +
            "http.cors.allow-origin: \"*\" '>>/home/elasticsearch/config/elasticsearch.yml\n" +
            "```\n" +
            "\n" +
            "![c0bc056bc3764c0a8689691c25889aa5.png](https://static.linhaojun.top/articles/e7882a6612dedd91167a1a534c5c99e8.png)\n" +
            "\n" +
            "解释：\n" +
            "\n" +
            "- echo >> ：是利用了shellell编程语法，使用echo >>指令向文件追加内容，原内容将保存\n" +
            "  - 使用 > 指令的话就是覆盖文件原内容并重新输入内容，若文件不存在则创建文件。\n" +
            "\n" +
            "- cat：展示文件内容。\n" +
            "- `http.cors.enabled: true` 和`http.cors.allow-origin: \"*\"`配置是为了解决跨域问题，因为等下还要下载可视化工具查看。\n" +
            "\n" +
            "修改文件夹权限\n" +
            "\n" +
            "```shell\n" +
            "chmod -R 777 /home/elasticsearch/\n" +
            "ls -l # 查看文件权限\n" +
            "```\n" +
            "\n" +
            "![789f7ed4c5134540994ce1bfabcfd7b5.png](https://static.linhaojun.top/articles/3510ab8132ab856ec4d63a1dcdbd57a0.png)\n" +
            "\n" +
            "3. 启动elasticseach镜像\n" +
            "\n" +
            "   ```shell\n" +
            "   docker run --name elasticsearch -p 9200:9200 \\\n" +
            "    -p 9300:9300 \\\n" +
            "    -e \"discovery.type=single-node\" \\\n" +
            "    -e ES_JAVA_OPTS=\"-Xms64m -Xmx128m\" \\\n" +
            "     -v /home/elasticsearch/config/elasticsearch.yml:/usr/shellare/elasticsearch/config/elasticsearch.yml \\\n" +
            "    -v /home/elasticsearch/data:/usr/shellare/elasticsearch/data \\\n" +
            "    -v /home/elasticsearch/plugins:/usr/shellare/elasticsearch/plugins \\\n" +
            "    -d elasticsearch:7.7.0\n" +
            "   ```\n" +
            "\n" +
            "   参数解释：\n" +
            "\n" +
            "   ```shell\n" +
            "   --name elasticsearch：将容器命名为 elasticsearch\n" +
            "   -p 9200:9200：将容器的9200端口映射到宿主机9200端口\n" +
            "   -p 9300:9300：将容器的9300端口映射到宿主机9300端口，目的是集群互相通信\n" +
            "   -e \"discovery.type=single-node\"：单例模式\n" +
            "   -e ES_JAVA_OPTS=\"-Xms64m -Xmx128m\"：配置内存大小\n" +
            "   -v /mydata/elasticsearch/config/elasticsearch.yml:/usr/shellare/elasticsearch/config/elasticsearch.yml：将配置文件挂载到宿主机\n" +
            "   -v /mydata/elasticsearch/data:/usr/shellare/elasticsearch/data：将数据文件夹挂载到宿主机\n" +
            "   -v /mydata/elasticsearch/plugins:/usr/shellare/elasticsearch/plugins：将插件目录挂载到宿主机(需重启)\n" +
            "   -d elasticsearch:7.7.0：后台运行容器，并返回容器ID\n" +
            "   ```\n" +
            "\n" +
            "   执行结果：\n" +
            "\n" +
            "![0051149a31544ce9bcc6dd0c609f951c.png](https://static.linhaojun.top/articles/f728bfec12bd9f2e239415169216a417.png)\n" +
            "\n" +
            "接下来我们就是拿浏览器访问啦。\n" +
            "\n" +
            "在浏览器上输入：`服务器IP地址:9200`\n" +
            "\n" +
            "4. 可能出现的问题\n" +
            "\n" +
            "   - 启动成功，但是访问失败的话，查看一下安全组中映射端口是否已经打开。如果是本地虚拟机，可能与防火墙相关（我用的云服务器，没有测试，如果有问题，还是需要大家自行去百度||谷歌一下）。\n" +
            "\n" +
            "   - -e ES_JAVA_OPTS=\"-Xms64m -Xmx128m\"：配置内存大小出现了问题。（可试着调一下，docker玩不坏的，莫慌）\n" +
            "\n" +
            "   - 最后就还有可能是配置文件中出现了问题。\n" +
            "\n" +
            "```shell\n" +
            "echo 'http.host: 0.0.0.0\n" +
            "http.cors.enabled: true\n" +
            "http.cors.allow-origin: \"*\" '>>/home/elasticsearch/config/elasticsearch.yml\n" +
            "```\n" +
            "\n" +
            "`http.host: 0.0.0.0` 在冒号后面有一个空格的，这里的配置文件是`yml`格式,所以一定要严格按照`yml`格式来书写。\n" +
            "\n" +
            "5. 为Elasticsearch安装ik分词器\n" +
            "\n" +
            "   分词:即把一段中文或者别的划分成一个个的关键字,我们在搜索时候会把自己的信息进行分词,会把数据库中或者索引库中的数据进行分词,然后进行一个匹配操作,默认的中文分词器是将每个字看成一个词,比如\"我爱技术\"会被分为\"我\",“爱”,“技”,“术”。\n" +
            "\n" +
            "![77f584371974494aa1cd13d571f4a814.png](https://static.linhaojun.top/articles/40aa7b6cb700eea549b5462705fec705.png)\n" +
            "\n" +
            "结果：\n" +
            "\n" +
            "```json\n" +
            "{\n" +
            "    \"tokens\": [\n" +
            "        {\n" +
            "            \"token\": \"我\",\n" +
            "            \"start_offset\": 0,\n" +
            "            \"end_offset\": 1,\n" +
            "            \"type\": \"<IDEOGRAPHIC>\",\n" +
            "            \"position\": 0\n" +
            "        },\n" +
            "        {\n" +
            "            \"token\": \"爱\",\n" +
            "            \"start_offset\": 1,\n" +
            "            \"end_offset\": 2,\n" +
            "            \"type\": \"<IDEOGRAPHIC>\",\n" +
            "            \"position\": 1\n" +
            "        },\n" +
            "        {\n" +
            "            \"token\": \"技\",\n" +
            "            \"start_offset\": 2,\n" +
            "            \"end_offset\": 3,\n" +
            "            \"type\": \"<IDEOGRAPHIC>\",\n" +
            "            \"position\": 2\n" +
            "        },\n" +
            "        {\n" +
            "            \"token\": \"术\",\n" +
            "            \"start_offset\": 3,\n" +
            "            \"end_offset\": 4,\n" +
            "            \"type\": \"<IDEOGRAPHIC>\",\n" +
            "            \"position\": 3\n" +
            "        }\n" +
            "    ]\n" +
            "}\n" +
            "```\n" +
            "\n" +
            "这显然不符合要求,所以我们需要安装中文分词器IK来解决这个问题\n" +
            "\n" +
            "IK提供了两个分词算法:`ik_smart`和`ik_max_word`\n" +
            "\n" +
            "其中`ik_smart`为最少切分,`ik_max_word`为最细粒度划分\n" +
            "\n" +
            "### 安装ik分词器\n" +
            "\n" +
            "进入已经启动成功的elasticsearch容器。\n" +
            "\n" +
            "```shell\n" +
            "docker exec -it elasticsearch /bin/bashell\n" +
            "```\n" +
            "\n" +
            "![6bb212d2660941619b6b47902d2fb3b5.png](https://static.linhaojun.top/articles/fdddc3ad8ddea2eb89591d714ee2389c.png)\n" +
            "\n" +
            "```shell\n" +
            "./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.7.0/elasticsearch-analysis-ik-7.7.0.zip\n" +
            "```\n" +
            "\n" +
            "ps: **安装的ik分词器的版本一定要与elasticsearch的版本保持一致**\n" +
            "\n" +
            "![57a832d36b07437098afc687112f8540.png](https://static.linhaojun.top/articles/8ecde9759a2191ce2b2511b2da79b6e8.png)\n" +
            "\n" +
            "下载过程中会出现这个问题，直接输入 y回车就可以了。\n" +
            "![57ec3132e7084cc89d32d4a784fc9405.png](https://static.linhaojun.top/articles/8dc9db8717dec1c42ded2d5e0a497458.png)\n" +
            "\n" +
            "下载完成之后，退出去，重新启动elasticsearch容器。\n" +
            "\n" +
            "```shell\n" +
            "docker restart elasticsearch #  <容器名o容器id>   重启容器命令\n" +
            "```\n" +
            "\n" +
            "![89c033d3379b4fbfb8191fc0385a8534.png](https://static.linhaojun.top/articles/72f7d9f1c437609e95d35bbd6e951357.png)\n" +
            "\n" +
            "测试ik分词器是否安装成功\n" +
            "\n" +
            "安装完成后，我们再来进行测试遍，看看有什么样的变化。\n" +
            "\n" +
            "postman post请求分词测试：`http://服务器IP地址:9200/_analyze`\n" +
            "\n" +
            "```json\n" +
            "{\n" +
            "\t\"tokenizer\":\"ik_smart\",// 分词器不同，这个地方也会有变化 具体的可能还需要去学习。\n" +
            "\t\"text\":\"我爱技术\"\n" +
            "}\n" +
            "```\n" +
            "\n" +
            "![0e2bda8bee7440fe9911b786c9a29363.png](https://static.linhaojun.top/articles/aac3ae4c600f401b4ce1a25e733e4534.png)\n" +
            "\n" +
            "```json\n" +
            "{\n" +
            "    \"tokens\": [\n" +
            "        {\n" +
            "            \"token\": \"我\",\n" +
            "            \"start_offset\": 0,\n" +
            "            \"end_offset\": 1,\n" +
            "            \"type\": \"CN_CHAR\",\n" +
            "            \"position\": 0\n" +
            "        },\n" +
            "        {\n" +
            "            \"token\": \"爱\",\n" +
            "            \"start_offset\": 1,\n" +
            "            \"end_offset\": 2,\n" +
            "            \"type\": \"CN_CHAR\",\n" +
            "            \"position\": 1\n" +
            "        },\n" +
            "        {\n" +
            "            \"token\": \"技术\",\n" +
            "            \"start_offset\": 2,\n" +
            "            \"end_offset\": 4,\n" +
            "            \"type\": \"CN_WORD\",\n" +
            "            \"position\": 2\n" +
            "        }\n" +
            "    ]\n" +
            "}\n" +
            "```\n" +
            "\n" +
            "### 安装Elasticsearch可视化工具 | mobz/elasticsearch-head:5\n" +
            "\n" +
            "`Elasticsearch`可视化工具有多种，可以根据自己的喜好进行选择，我这里使用的是`mobz/elasticsearch-head:5`而已。\n" +
            "\n" +
            "1. 拉取镜像\n" +
            "\n" +
            "```shell\n" +
            "docker pull mobz/elasticsearch-head:5\n" +
            "```\n" +
            "![533b907f8094484e94e7ede928bc80d2.png](https://static.linhaojun.top/articles/303d9cc8fe674a831b4fcfc56748ee0a.png)\n" +
            "\n" +
            "2. 启动镜像\n" +
            "\n" +
            "   ```shell\n" +
            "   docker run -d --name elasticsearch-head -p 9100:9100 mobz/elasticsearch-head:5\n" +
            "   ```\n" +
            "\n" +
            "![3576fd4f048b46c5bdc241d09facd478.png](https://static.linhaojun.top/articles/1c03e5ca92c146fbc100b87a0db04745.png)\n" +
            "\n" +
            "3. 测试\n" +
            "\n" +
            "   我们在浏览器访问：http://服务器IP:9100/\n" +
            "![746009504f2a4c9fb2c18e15095eec32.png](https://static.linhaojun.top/articles/59db93ca961f475d7478a84406ac6a6e.png)\n" +
            "   \n" +
            "   \n" +
            "\n" +
            "4. 可能出现的问题\n" +
            "\n" +
            "   elasticsearch配置文件elasticsearch.yml中 缺少了下列跨域配置\n" +
            "\n" +
            "   ```shell\n" +
            "   http.cors.enabled: true \n" +
            "   http.cors.allow-origin: \"*\"\n" +
            "   ```\n" +
            "\n" +
            "   \n" +
            "\n" +
            "## 12.4MySQL的部署\n" +
            "\n" +
            "1. 下载并运行\n" +
            "\n" +
            "   ```shell\n" +
            "   #拉取并运行容器\n" +
            "   docker run -d --name mysql-5.7 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\n" +
            "   ```\n" +
            "\n" +
            "   参数说明：\n" +
            "\n" +
            "   ```shell\n" +
            "   -p 3306:3306 ：映射容器服务的 3306 端口到宿主机的 3306 端口，外部主机可以直接通过 宿主机ip:3306 访问到 MySQL 的服务。\n" +
            "   MYSQL_ROOT_PASSWORD=123456：设置 MySQL 服务 默认账号root 用户的密码。\n" +
            "   ```\n" +
            "\n" +
            "2. 进入容器查看mysql服务\n" +
            "\n" +
            "   进入容器，并通过账号root查看MySQL服务能否正常连接\n" +
            "\n" +
            "   ```shell\n" +
            "   docker exec -it 9b3aad6819ff /bin/bashell\n" +
            "   mysql -h localhost -u root -p\n" +
            "   ```\n" +
            "\n" +
            "![1063e7abc3b9453e8962e2c80de648d1.png](https://static.linhaojun.top/articles/889d00a12113ff244fd97022cc05959b.png)\n");
    }

}
