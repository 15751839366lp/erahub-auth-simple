/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : erahub-cloud

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 07/01/2023 15:36:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_finance_erp_project
-- ----------------------------
DROP TABLE IF EXISTS `biz_finance_erp_project`;
CREATE TABLE `biz_finance_erp_project`  (
  `project_id` bigint(0) NOT NULL COMMENT 'ERP工程ID',
  `project_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ERP工单号',
  `requisition_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ERP请购单号',
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ERP装置名称',
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ERP工程名称',
  `plan_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划类别',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `settlement_review_amount` decimal(60, 0) NULL DEFAULT NULL COMMENT '结算审核额',
  `contract_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同编号',
  `project_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工程类别',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'ERP工程明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_finance_erp_project
-- ----------------------------

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `article_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `category_id` bigint(0) NULL DEFAULT NULL COMMENT '文章分类ID',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `is_top` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否置顶 0否 1是',
  `is_featured` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否推荐 0否 1是',
  `is_delete` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否删除  0否 1是',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '状态值 1公开 2私密 3草稿',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '文章类型 1原创 2转载 3翻译',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问密码',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原文链接',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1610946193346084867 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1604060262542467074, 1605159324440162305, 'http://127.0.0.1:9000/erahub/2022/12/02/4cc68162eeff43d88b1b751adde1bb95.jpg', 'docker入门', '#  1.docker概述\n\n## 1.1 基本介绍\n\nDocker 是一个开源的应用容器引擎，基于 Go 语言 并遵从 Apache2.0 协议开源。\n\nDocker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。\n\n容器是完全使用沙箱机制，相互之间不会有任何接口,更重要的是容器性能开销极低。\n\nDocker 从 17.03 版本之后分为 CE（Community Edition: 社区版） 和 EE（Enterprise Edition: 企业版），我们用社区版就可以了。[官网](https://docs.docker.com/)\n\n##  1.2 应用场景\n\n1. Web 应用的自动化打包和发布。\n\n2. 自动化测试和持续集成、发布。\n\n3. 在服务型环境中部署和调整数据库或其他的后台应用。\n\n4. 从头编译或者扩展现有的 Openshellift 或 Cloud Foundry 平台来搭建自己的 PaaS 环境。\n\n## 1.3 docker 的优势\n\nDocker 是一个用于开发，交付和运行应用程序的开放平台。Docker 使您能够将应用程序与基础架构分开，从而可以快速交付软件。借助 Docker，您可以与管理应用程序相同的方式来管理基础架构。通过利用 Docker 的方法来快速交付，测试和部署代码，您可以大大减少编写代码和在生产环境中运行代码之间的延迟。\n\n1. 快速，一致地交付您的应用程序。Docker 允许开发人员使用您提供的应用程序或服务的本地容器在标准化环境中工作，从而简化了开发的生命周期。\n\n容器非常适合持续集成和持续交付（CI / CD）工作流程，请考虑以下示例方案：\n\n您的开发人员在本地编写代码，并使用 Docker 容器与同事共享他们的工作。\n他们使用 Docker 将其应用程序推送到测试环境中，并执行自动或手动测试。\n当开发人员发现错误时，他们可以在开发环境中对其进行修复，然后将其重新部署到测试环境中，以进行测试和验证。\n测试完成后，将修补程序推送给生产环境，就像将更新的镜像推送到生产环境一样简单。\n\n2. 响应式部署和扩展\n   Docker 是基于容器的平台，允许高度可移植的工作负载。Docker 容器可以在开发人员的本机上，数据中心的物理或虚拟机上，云服务上或混合环境中运行。\n\nDocker 的可移植性和轻量级的特性，还可以使您轻松地完成动态管理的工作负担，并根据业务需求指示，实时扩展或拆除应用程序和服务。\n\n3. 在同一硬件上运行更多工作负载\n   Docker 轻巧快速。它为基于虚拟机管理程序的虚拟机提供了可行、经济、高效的替代方案，因此您可以利用更多的计算能力来实现业务目标。Docker 非常适合于高密度环境以及中小型部署，而您可以用更少的资源做更多的事情。\n\n# 2.虚拟化技术和容器化技术\n\n虚拟化技术特点：\n\n1. 资源占用多\n2. 冗余步骤多 \n3. 启动很慢\n\n容器化技术：容器化技术不是模拟的一个完整的操作系统\n\n比较Docker和虚拟机的不同：\n\n1. 传统虚拟机，虚拟出硬件，运行一个完整的操作系统，然后在这个系统上安装和运行软件。\n2. Docker容器内的应用直接运行在宿主机的内容，容器是没有自己的内核的，也没有虚拟硬件。\n3. 每个容器都是相互隔离的，每个容器都有属于自己的文件系统，互不影响。\n\n![20210717124434988.png](https://static.linhaojun.top/articles/c7ae4abaa3a228f0344dd4b480ff7445.png)\n\n# 3.docker的基本组成\n\nDocker的基本组成图如下：\n![20210717120256284.png](https://static.linhaojun.top/articles/8939ae04db634d407f5dec94ba82ec0f.png)\n\n说明：\n\n![20210717120343817.png](https://static.linhaojun.top/articles/323aef7768be3f055eb34b893202933d.png)\n\n# 4.Docker的安装\n\n查看系统的内核：\n\nuname -r\n\n系统内核版本为3.10.0\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# uname -r\n3.10.0-957.21.3.el7.x86_64\n```\n\n查看系统配置\n\ncat /etc/os-release\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# cat /etc/os-release\nNAME=\"CentOS Linux\"\nVERSION=\"7 (Core)\"\nID=\"centos\"\nID_LIKE=\"rhel fedora\"\nVERSION_ID=\"7\"\nPRETTY_NAME=\"CentOS Linux 7 (Core)\"\nANSI_COLOR=\"0;31\"\nCPE_NAME=\"cpe:/o:centos:centos:7\"\nHOME_URL=\"https://www.centos.org/\"\nBUG_REPORT_URL=\"https://bugs.centos.org/\"\n\nCENTOS_MANTISBT_PROJECT=\"CentOS-7\"\nCENTOS_MANTISBT_PROJECT_VERSION=\"7\"\nREDHAT_SUPPORT_PRODUCT=\"centos\"\nREDHAT_SUPPORT_PRODUCT_VERSION=\"7\"\n```\n\nDocker的安装步骤：\n\n## 4.1 卸载旧的版本\n\n```shell\nyum remove docker \\\n                  docker-client \\\n                  docker-client-latest \\\n                  docker-common \\\n                  docker-latest \\\n                  docker-latest-logrotate \\\n                  docker-logrotate \\\n                  docker-engine\n```\n\n## 4.2 下载需要的安装包\n\n```shell\nyum install -y yum-utils\n```\n\n## 4.3 设置镜像的仓库\n\n```shell\nyum-config-manager \\\n    --add-repo \\\n    https://download.docker.com/linux/centos/docker-ce.repo  #国外的地址\n    \n    # 设置阿里云的Docker镜像仓库\nyum-config-manager \\\n    --add-repo \\\n    https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo  #国内的地址\n```\n\n## 4.4 更新yum软件包索引\n\n```shell\nyum makecache fast\n```\n\n## 4.5 安装docker相关配置\n\ndocker-ce 是社区版，docker-ee 企业版\n\n```shell\nyum install docker-ce docker-ce-cli containerd.io\n```\n\n出现了completed即安装成功。\n\n## 4.6启动docker\n\n```shell\nsystemctl start docker\n# 查看当前版本号，是否启动成功\ndocker version\n# 设置开机自启动\nsystemctl enable docker\n```\n\n结果：\n\n![2021071712515566.png](https://static.linhaojun.top/articles/386d662b1e8bdd3ffb4aa73dd0d52880.png)\n\n下载hello-world镜像进行测试\n\n![20210717125227931.png](https://static.linhaojun.top/articles/e7ed7744b2020bfa9c023f38cec17882.png)\n\n查看下载的hello world镜像\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z lib]# docker images\nREPOSITORY    TAG       IMAGE ID       CREATED         SIZE\nhello-world   latest    bf756fb1ae65   11 months ago   13.3kB\n```\n\n# 5.docker的卸载\n\n```shell\n# 1. 卸载依赖\nyum remove docker-ce docker-ce-cli containerd.io\n# 2. 删除资源  . /var/lib/docker是docker的默认工作路径\nrm -rf /var/lib/docker\n```\n\n# 6.配置阿里云镜像加速\n\n## 6.1 进入阿里云官网，搜索容器镜像服务\n\n![20210717125337690.png](https://static.linhaojun.top/articles/a6fe14af8199d829fec92b3fd9d50744.png)\n\n## 6.2 依次执行官方的这四条命令\n\n```shell\nsudo mkdir -p /etc/docker\nsudo tee /etc/docker/daemon.json 9000/tcp   quirky_sinoussi\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it 2a3bf3eaa2e4 /bin/bashell\nroot@2a3bf3eaa2e4:/usr/local/tomcat# cd webapps\nroot@2a3bf3eaa2e4:/usr/local/tomcat/webapps# ls\nROOT  docs  examples  host-manager  manager\nroot@2a3bf3eaa2e4:/usr/local/tomcat/webapps# cd ../\nroot@2a3bf3eaa2e4:/usr/local/tomcat# read escape sequence\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE                 COMMAND        CREATED         STATUS         PORTS                    NAMES\n2a3bf3eaa2e4   tomcat                \"/bin/bashell\"    8 minutes ago   Up 8 minutes   8080/tcp                 competent_torvalds\n7789d4505a00   portainer/portainer   \"/portainer\"   24 hours ago    Up 24 hours    0.0.0.0:8088->9000/tcp   quirky_sinoussi\n#2.提交镜像作为一个新的镜像\n\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker commit -m=\"add webapps\" -a=\"Ethan\" 2a3bf3eaa2e4 mytomcat:1.0\nshella256:f189aac861de51087af5bc88a5f1de02d9574e7ee2d163c647dd7503a2d3982b\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker images\nREPOSITORY            TAG       IMAGE ID       CREATED         SIZE\nmytomcat              1.0       f189aac861de   7 seconds ago   653MB\nmysql                 5.7       f07dfa83b528   6 days ago      448MB\ntomcat                latest    feba8d001e3f   10 days ago     649MB\nnginx                 latest    ae2feff98a0c   12 days ago     133MB\ncentos                latest    300e315adb2f   2 weeks ago     209MB\nportainer/portainer   latest    62771b0b9b09   5 months ago    79.1MB\nelasticsearch         7.6.2     f29a1ee41030   9 months ago    791MB\n\n#3.运行容器\n\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -it mytomcat:1.0 /bin/bashell\nroot@1645774d4605:/usr/local/tomcat# cd webapps\nroot@1645774d4605:/usr/local/tomcat/webapps# ls\nROOT  docs  examples  host-manager  manager\nwz99sm8v95sckz8bd2c4Z ~]# docker images\nREPOSITORY            TAG       IMAGE ID       CREATED         SIZE\nmytomcat              1.0       f189aac861de   7 seconds ago   653MB\nmysql                 5.7       f07dfa83b528   6 days ago      448MB\ntomcat                latest    feba8d001e3f   10 days ago     649MB\nnginx                 latest    ae2feff98a0c   12 days ago     133MB\ncentos                latest    300e315adb2f   2 weeks ago     209MB\nportainer/portainer   latest    62771b0b9b09   5 months ago    79.1MB\nelasticsearch         7.6.2     f29a1ee41030   9 months ago    791MB\n```\n\n# 12.常用容器部署\n\n## 12.1 Nginx部署\n\n1. 搜索并下载镜像\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker search nginx\nNAME                               DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED\nnginx                              Official build of Nginx.                        14207     [OK]       \njwilder/nginx-proxy                Automated Nginx reverse proxy for docker con…   1932                 [OK]\nricharvey/nginx-php-fpm            Container running Nginx + PHP-FPM capable of…   797                  [OK]\nlinuxserver/nginx                  An Nginx container, brought to you by LinuxS…   137                  \njc21/nginx-proxy-manager           Docker container for managing Nginx proxy ho…   123                  \ntiangolo/nginx-rtmp                Docker image with Nginx using the nginx-rtmp…   107                  [OK]\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull nginx\nUsing default tag: latest\nlatest: Pulling from library/nginx\n6ec7b7d162b2: Already exists \ncb420a90068e: Pull complete \n2766c0bf2b07: Pull complete \ne05167b6a99d: Pull complete \n70ac9d795e79: Pull complete \nDigest: shella256:4cf620a5c81390ee209398ecc18e5fb9dd0f5155cd82adcbae532fec94006fb9\nStatus: Downloaded newer image for nginx:latest\ndocker.io/library/nginx:latest\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker images;\nREPOSITORY   TAG       IMAGE ID       CREATED       SIZE\nmysql        5.7       f07dfa83b528   5 days ago    448MB\nnginx        latest    ae2feff98a0c   11 days ago   133MB\ncentos       latest    300e315adb2f   2 weeks ago   209MB\n```\n\n可以到[dockerhub官网](https://hub.docker.com/_/nginx)查看Nginx的详细版本信息\n\n2. 运行测试\n\n```shell\ndocker run -d --name nginx01 -p 3334:80 nginx\n\n-d 后台运行\n--name 给容器命名\n-p 3334:80 将宿主机的端口3334映射到该容器的80端口\n```\n\n运行结果：\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it nginx01 /bin/bashell\nError: No such container: nginx01\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -d --name nginx01 -p 3334:80 nginx\n20c896637ff5de8be835797109d62ee2465e28d9d716be5a8d550ef7d547fcf5\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                  NAMES\n20c896637ff5   nginx     \"/docker-entrypoint.…\"   7 seconds ago   Up 5 seconds   0.0.0.0:3334->80/tcp   nginx01\n```\n\n端口暴露的概念\n\n![20210718124656411.png](https://static.linhaojun.top/articles/fc0d205dbe5278bbcbbc63b15949f587.png)\n\n3. 配置文件\n   进入容器，自定义配置文件\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it nginx01 /bin/bashell\n   root@20c896637ff5:/# whereis nginx\n   nginx: /usr/sbin/nginx /usr/lib/nginx /etc/nginx /usr/shellare/nginx\n   root@20c896637ff5:/# cd /etc/nginx\n   root@20c896637ff5:/etc/nginx# ls\n   conf.d	fastcgi_params	koi-utf  koi-win  mime.types  modules  nginx.conf  scgi_params	uwsgi_params  win-utf\n   root@20c896637ff5:/# cd /etc/nginx\n   root@20c896637ff5:/etc/nginx# ls\n   conf.d	fastcgi_params	koi-utf  koi-win  mime.types  modules  nginx.conf  scgi_params	uwsgi_params  win-utf\n   ```\n\n4. 访问测试\n   本地主机访问测试，curl命令发起请求，如果使用阿里云服务器需要设置安全组。\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n   CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                  NAMES\n   20c896637ff5   nginx     \"/docker-entrypoint.…\"   7 minutes ago   Up 7 minutes   0.0.0.0:3334->80/tcp   nginx01\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# curl localhost:3334\n   \n   \n   \n   Welcome to nginx!\n   \n       body {\n           width: 35em;\n           margin: 0 auto;\n           font-family: Tahoma, Verdana, Arial, sans-serif;\n       }\n   \n   \n   \n   Welcome to nginx!\n   If you see this page, the nginx web server is successfully installed and\n   working. Further configuration is required.\n   \n   For online documentation and support please refer to\n   nginx.org.\n   Commercial support is available at\n   nginx.com.\n   \n   Thank you for using nginx.\n   \n   \n   ```\n\n5. 安装vim\n\n   我们使用Nginx往往需要编写配置文件，但是Nginx官方镜像没有安装vim，需要我们手动进行安装。使用以下命令进行安装：\n\n   ```shell\n   #检查是否已安装\n   rpm -qa|grep vim\n   #如果已安装，会显示：\n   [root@localhost usr]# rpm -qa|grep vim\n   vim-minimal-7.4.629-6.el7.x86_64\n   vim-filesystem-7.4.629-6.el7.x86_64\n   vim-enhanced-7.4.629-6.el7.x86_64\n   vim-common-7.4.629-6.el7.x86_64\n   vim-X11-7.4.629-6.el7.x86_64\n   #安装\n   #如果缺少了其中某个，比如说： vim-enhanced这个包少了，则执行：\n   yum -y install vim-enhanced\n   #它会自动下载安装。如果上面三个包一个都没有显示，则直接输入命令：\n   yum -y install vim*\n   #配置\n   vim /etc/vimrc\n   #打开文件后，按 i 进入编辑模式，然后找一个位置添加如下代码\n   set nu          \" 设置显示行号\n   set shellowmode    \" 设置在命令行界面最下面显示当前模式等\n   set ruler       \" 在右下角显示光标所在的行数等信息\n   set autoindent  \" 设置每次单击Enter键后，光标移动到下一行时与上一行的起始字符对齐\n   syntax on       \" 即设置语法检测，当编辑C或者shellell脚本时，关键字会用特殊颜色显示\n   ```\n\n   ps: **由于到目前为止还没学到数据卷，具体的设置以及编写配置文件，你可以先到后面了解一下数据卷，再来编写配置文件**\n\n## 12.2 Tomcat的部署\n\n1. 下载并运行\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull tomcat\n   Using default tag: latest\n   latest: Pulling from library/tomcat\n   6c33745f49b4: Pull complete \n   ef072fc32a84: Pull complete \n   c0afb8e68e0b: Pull complete \n   d599c07d28e6: Pull complete \n   e8a829023b97: Pull complete \n   d04be46a31d1: Pull complete \n   db6007c69c35: Pull complete \n   e4ad4c894bce: Pull complete \n   248895fda357: Pull complete \n   277059b4cba2: Pull complete \n   Digest: shella256:57dae7dfb9b62a413cde65334c8a18893795cac70afc3be589c8336d8244655d\n   Status: Downloaded newer image for tomcat:latest\n   docker.io/library/tomcat:latest\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -d -p 3335:8080 --name tomcat01 tomcat\n   7136295a6082cb0f805b025a1471bde02ead4864be3e2c9dcd337b1dde0a3113\n   ```\n\n2. 进入容器\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it tomcat01 /bin/bashell\n   root@7136295a6082:/usr/local/tomcat# ls\n   BUILDING.txt  CONTRIBUTING.md  LICENSE	NOTICE	README.md  RELEASE-NOTES  RUNNING.txt  bin  conf  lib  logs  native-jni-lib  temp  webapps  webapps.dist  work\n   root@7136295a6082:/usr/local/tomcat# cd webapps.dist\n   root@7136295a6082:/usr/local/tomcat/webapps.dist# ls\n   ROOT  docs  examples  host-manager  manager\n   root@7136295a6082:/usr/local/tomcat/webapps.dist# cd ROOT\n   root@7136295a6082:/usr/local/tomcat/webapps.dist/ROOT# ls\n   RELEASE-NOTES.txt  WEB-INF  asf-logo-wide.svg  bg-button.png  bg-middle.png  bg-nav.png  bg-upper.png  favicon.ico  index.jsp  tomcat.css  tomcat.svg\n   root@7136295a6082:/usr/local/tomcat/webapps.dist/ROOT# cd ../../\n   root@7136295a6082:/usr/local/tomcat# cd webapps\n   root@7136295a6082:/usr/local/tomcat/webapps# ls\n   root@7136295a6082:/usr/local/tomcat/webapps# cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/\n   root@7136295a6082:/usr/local/tomcat/webapps# ls\n   ROOT  docs  examples  host-manager  manager\n   root@7136295a6082:/usr/local/tomcat/webapps# exit\n   exit\n   ```\n\n3. 访问测试\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# curl localhost:3335\n   \n   \n   \n       \n           \n           Apache Tomcat/9.0.41\n           \n           \n       \n   \n       \n           \n               \n                   Home\n                   Documentation\n                   Configuration\n                   Examples\n                   Wiki\n                   Mailing Lists\n                   Find Help\n                   \n               \n   ```\n\n   \n\n## 12.3ElasticSearch部署\n\n### 安装elasticsearch并部署\n\n1. 拉取Elasticsearch镜像\n\n   ```shell\n   docker pull elasticsearch:7.7.0\n   ```\n\n![21782a576ca644869ba50165184f056e.png](https://static.linhaojun.top/articles/c196fe08e838e2a0423b754d3dc684dc.png)\n\n查看镜像命令：docker images\n删除镜像命令：`docker rmi ` or docker rmi \n![77d67f2c1f404c4286eefca7e5c8c5cd.png](https://static.linhaojun.top/articles/19ad83720725e1fa05abf01b81b50286.png)\n\n2. 启动前准备\n   创建存放数据及配置文件的文件夹，启动时挂载。\n\n   ```shell\n   mkdir -p  /home/elasticsearch/data/ \n   mkdir -p  /home/elasticsearch/config/\n   ```\n\n![962ad3c43cd24b75bdec7a75e971efdb.png](https://static.linhaojun.top/articles/b4bb3cc9d1071e8a8ea49d97bf842821.png)\n\n**解释**：\n\n- -p： 参数来创建多级文件夹\n- tree：以树形结构展示文件目录\n\n**编写配置文件**\n\n```shell\necho \'http.host: 0.0.0.0\nhttp.cors.enabled: true\nhttp.cors.allow-origin: \"*\" \'>>/home/elasticsearch/config/elasticsearch.yml\n```\n\n![c0bc056bc3764c0a8689691c25889aa5.png](https://static.linhaojun.top/articles/e7882a6612dedd91167a1a534c5c99e8.png)\n\n解释：\n\n- echo >> ：是利用了shellell编程语法，使用echo >>指令向文件追加内容，原内容将保存\n  - 使用 > 指令的话就是覆盖文件原内容并重新输入内容，若文件不存在则创建文件。\n\n- cat：展示文件内容。\n- `http.cors.enabled: true` 和`http.cors.allow-origin: \"*\"`配置是为了解决跨域问题，因为等下还要下载可视化工具查看。\n\n修改文件夹权限\n\n```shell\nchmod -R 777 /home/elasticsearch/\nls -l # 查看文件权限\n```\n\n![789f7ed4c5134540994ce1bfabcfd7b5.png](https://static.linhaojun.top/articles/3510ab8132ab856ec4d63a1dcdbd57a0.png)\n\n3. 启动elasticseach镜像\n\n   ```shell\n   docker run --name elasticsearch -p 9200:9200 \\\n    -p 9300:9300 \\\n    -e \"discovery.type=single-node\" \\\n    -e ES_JAVA_OPTS=\"-Xms64m -Xmx128m\" \\\n     -v /home/elasticsearch/config/elasticsearch.yml:/usr/shellare/elasticsearch/config/elasticsearch.yml \\\n    -v /home/elasticsearch/data:/usr/shellare/elasticsearch/data \\\n    -v /home/elasticsearch/plugins:/usr/shellare/elasticsearch/plugins \\\n    -d elasticsearch:7.7.0\n   ```\n\n   参数解释：\n\n   ```shell\n   --name elasticsearch：将容器命名为 elasticsearch\n   -p 9200:9200：将容器的9200端口映射到宿主机9200端口\n   -p 9300:9300：将容器的9300端口映射到宿主机9300端口，目的是集群互相通信\n   -e \"discovery.type=single-node\"：单例模式\n   -e ES_JAVA_OPTS=\"-Xms64m -Xmx128m\"：配置内存大小\n   -v /mydata/elasticsearch/config/elasticsearch.yml:/usr/shellare/elasticsearch/config/elasticsearch.yml：将配置文件挂载到宿主机\n   -v /mydata/elasticsearch/data:/usr/shellare/elasticsearch/data：将数据文件夹挂载到宿主机\n   -v /mydata/elasticsearch/plugins:/usr/shellare/elasticsearch/plugins：将插件目录挂载到宿主机(需重启)\n   -d elasticsearch:7.7.0：后台运行容器，并返回容器ID\n   ```\n\n   执行结果：\n\n![0051149a31544ce9bcc6dd0c609f951c.png](https://static.linhaojun.top/articles/f728bfec12bd9f2e239415169216a417.png)\n\n接下来我们就是拿浏览器访问啦。\n\n在浏览器上输入：`服务器IP地址:9200`\n\n4. 可能出现的问题\n\n   - 启动成功，但是访问失败的话，查看一下安全组中映射端口是否已经打开。如果是本地虚拟机，可能与防火墙相关（我用的云服务器，没有测试，如果有问题，还是需要大家自行去百度||谷歌一下）。\n\n   - -e ES_JAVA_OPTS=\"-Xms64m -Xmx128m\"：配置内存大小出现了问题。（可试着调一下，docker玩不坏的，莫慌）\n\n   - 最后就还有可能是配置文件中出现了问题。\n\n```shell\necho \'http.host: 0.0.0.0\nhttp.cors.enabled: true\nhttp.cors.allow-origin: \"*\" \'>>/home/elasticsearch/config/elasticsearch.yml\n```\n\n`http.host: 0.0.0.0` 在冒号后面有一个空格的，这里的配置文件是`yml`格式,所以一定要严格按照`yml`格式来书写。\n\n5. 为Elasticsearch安装ik分词器\n\n   分词:即把一段中文或者别的划分成一个个的关键字,我们在搜索时候会把自己的信息进行分词,会把数据库中或者索引库中的数据进行分词,然后进行一个匹配操作,默认的中文分词器是将每个字看成一个词,比如\"我爱技术\"会被分为\"我\",“爱”,“技”,“术”。\n\n![77f584371974494aa1cd13d571f4a814.png](https://static.linhaojun.top/articles/40aa7b6cb700eea549b5462705fec705.png)\n\n结果：\n\n```json\n{\n    \"tokens\": [\n        {\n            \"token\": \"我\",\n            \"start_offset\": 0,\n            \"end_offset\": 1,\n            \"type\": \"\",\n            \"position\": 0\n        },\n        {\n            \"token\": \"爱\",\n            \"start_offset\": 1,\n            \"end_offset\": 2,\n            \"type\": \"\",\n            \"position\": 1\n        },\n        {\n            \"token\": \"技\",\n            \"start_offset\": 2,\n            \"end_offset\": 3,\n            \"type\": \"\",\n            \"position\": 2\n        },\n        {\n            \"token\": \"术\",\n            \"start_offset\": 3,\n            \"end_offset\": 4,\n            \"type\": \"\",\n            \"position\": 3\n        }\n    ]\n}\n```\n\n这显然不符合要求,所以我们需要安装中文分词器IK来解决这个问题\n\nIK提供了两个分词算法:`ik_smart`和`ik_max_word`\n\n其中`ik_smart`为最少切分,`ik_max_word`为最细粒度划分\n\n### 安装ik分词器\n\n进入已经启动成功的elasticsearch容器。\n\n```shell\ndocker exec -it elasticsearch /bin/bashell\n```\n\n![6bb212d2660941619b6b47902d2fb3b5.png](https://static.linhaojun.top/articles/fdddc3ad8ddea2eb89591d714ee2389c.png)\n\n```shell\n./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.7.0/elasticsearch-analysis-ik-7.7.0.zip\n```\n\nps: **安装的ik分词器的版本一定要与elasticsearch的版本保持一致**\n\n![57a832d36b07437098afc687112f8540.png](https://static.linhaojun.top/articles/8ecde9759a2191ce2b2511b2da79b6e8.png)\n\n下载过程中会出现这个问题，直接输入 y回车就可以了。\n![57ec3132e7084cc89d32d4a784fc9405.png](https://static.linhaojun.top/articles/8dc9db8717dec1c42ded2d5e0a497458.png)\n\n下载完成之后，退出去，重新启动elasticsearch容器。\n\n```shell\ndocker restart elasticsearch #     重启容器命令\n```\n\n![89c033d3379b4fbfb8191fc0385a8534.png](https://static.linhaojun.top/articles/72f7d9f1c437609e95d35bbd6e951357.png)\n\n测试ik分词器是否安装成功\n\n安装完成后，我们再来进行测试遍，看看有什么样的变化。\n\npostman post请求分词测试：`http://服务器IP地址:9200/_analyze`\n\n```json\n{\n	\"tokenizer\":\"ik_smart\",// 分词器不同，这个地方也会有变化 具体的可能还需要去学习。\n	\"text\":\"我爱技术\"\n}\n```\n\n![0e2bda8bee7440fe9911b786c9a29363.png](https://static.linhaojun.top/articles/aac3ae4c600f401b4ce1a25e733e4534.png)\n\n```json\n{\n    \"tokens\": [\n        {\n            \"token\": \"我\",\n            \"start_offset\": 0,\n            \"end_offset\": 1,\n            \"type\": \"CN_CHAR\",\n            \"position\": 0\n        },\n        {\n            \"token\": \"爱\",\n            \"start_offset\": 1,\n            \"end_offset\": 2,\n            \"type\": \"CN_CHAR\",\n            \"position\": 1\n        },\n        {\n            \"token\": \"技术\",\n            \"start_offset\": 2,\n            \"end_offset\": 4,\n            \"type\": \"CN_WORD\",\n            \"position\": 2\n        }\n    ]\n}\n```\n\n### 安装Elasticsearch可视化工具 | mobz/elasticsearch-head:5\n\n`Elasticsearch`可视化工具有多种，可以根据自己的喜好进行选择，我这里使用的是`mobz/elasticsearch-head:5`而已。\n\n1. 拉取镜像\n\n```shell\ndocker pull mobz/elasticsearch-head:5\n```\n![533b907f8094484e94e7ede928bc80d2.png](https://static.linhaojun.top/articles/303d9cc8fe674a831b4fcfc56748ee0a.png)\n\n2. 启动镜像\n\n   ```shell\n   docker run -d --name elasticsearch-head -p 9100:9100 mobz/elasticsearch-head:5\n   ```\n\n![3576fd4f048b46c5bdc241d09facd478.png](https://static.linhaojun.top/articles/1c03e5ca92c146fbc100b87a0db04745.png)\n\n3. 测试\n\n   我们在浏览器访问：http://服务器IP:9100/\n![746009504f2a4c9fb2c18e15095eec32.png](https://static.linhaojun.top/articles/59db93ca961f475d7478a84406ac6a6e.png)\n   \n   \n\n4. 可能出现的问题\n\n   elasticsearch配置文件elasticsearch.yml中 缺少了下列跨域配置\n\n   ```shell\n   http.cors.enabled: true \n   http.cors.allow-origin: \"*\"\n   ```\n\n   \n\n## 12.4MySQL的部署\n\n1. 下载并运行\n\n   ```shell\n   #拉取并运行容器\n   docker run -d --name mysql-5.7 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\n   ```\n\n   参数说明：\n\n   ```shell\n   -p 3306:3306 ：映射容器服务的 3306 端口到宿主机的 3306 端口，外部主机可以直接通过 宿主机ip:3306 访问到 MySQL 的服务。\n   MYSQL_ROOT_PASSWORD=123456：设置 MySQL 服务 默认账号root 用户的密码。\n   ```\n\n2. 进入容器查看mysql服务\n\n   进入容器，并通过账号root查看MySQL服务能否正常连接\n\n   ```shell\n   docker exec -it 9b3aad6819ff /bin/bashell\n   mysql -h localhost -u root -p\n   ```\n\n![1063e7abc3b9453e8962e2c80de648d1.png](https://static.linhaojun.top/articles/889d00a12113ff244fd97022cc05959b.png)\n', '1', '0', '0', '1', '2', '11', '', 'admin', '2022-12-17 18:25:43', 'test', '2023-01-07 12:16:43');
INSERT INTO `blog_article` VALUES (1604081892463243265, 1605166598017581057, 'http://127.0.0.1:9000/erahub/2022/12/11/49b8cc3fe7d0461f8c44f02d3ef830c7.jpg', 'MySQL 覆盖索引', '## 1.什么是索引\n索引（在 MySQL 中也叫“键key”）是存储引擎快速找到记录的一种数据结构，通俗来说类似书本的目录，这个比方虽然被用的最多但是也是最恰如其当的，在查询书本中的某个知识点不借助目录的情况下，往往都找的够呛，那么索引相较于数据库的重要性也可见一斑。\n## 2.索引的有哪些种类？\n索引的种类这里只罗列出InnoDB支持的索引：主键索引(PRIMARY)，普通索引(INDEX)，唯一索引(UNIQUE)，组合索引，总体划分为两类，主键索引也被称为聚簇索引（clustered index），其余都称呼为非主键索引也被称为二级索引（secondary index）。\n## 3.InnoDB的不同的索引组织结构是怎样的呢？\n众所周知在InnoDB引用的是B+树索引模型，这里对B+树结构暂时不做过多阐述，很多文章都有描述，在第二问中我们对索引的种类划分为两大类主键索引和非主键索引，那么问题就在于比较两种索引的区别了，我们这里建立一张学生表，其中包含字段id设置主键索引、name设置普通索引、age(无处理)，并向数据库中插入4条数据：（\"小赵\", 10）（\"小王\", 11）（\"小李\", 12）（\"小陈\", 13）\n```sql\nCREATE TABLE `student` (\n  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT \'自增主键\',\n  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT \'名称\',\n  `age` int(3) unsigned NOT NULL DEFAULT \'1\' COMMENT \'年龄\',\n  PRIMARY KEY (`id`),\n  KEY `I_name` (`name`)\n) ENGINE=InnoDB;\n\nINSERT INTO student (name, age) VALUES(\"小赵\", 10),(\"小王\", 11),(\"小李\", 12),(\"小陈\", 13);\n```\n这里我们设置了主键为自增，那么此时数据库里数据为\n![image.png](https://static.linhaojun.top/articles/9f480278926cf7780795ac1d9a1b19f8.png)\n每一个索引在 InnoDB 里面对应一棵B+树，那么此时就存着两棵B+树。\n![image.png](https://static.linhaojun.top/articles/72e270f3bf165ce9f71a2585a43fb0fa.png)\n可以发现区别在与叶子节点中，主键索引存储了整行数据，而非主键索引中存储的值为主键id, 在我们执行如下sql后\n```sql\nSELECT age FROM student WHERE name = \'小李\'；\n```\n流程为：\n\n1. 在name索引树上找到名称为小李的节点 id为03\n2. 从id索引树上找到id为03的节点 获取所有数据\n3. 从数据中获取字段命为age的值返回 12\n``在流程中从非主键索引树搜索回到主键索引树搜索的过程称为：回表``，在本次查询中因为查询结果只存在主键索引树中，我们必须回表才能查询到结果，那么如何优化这个过程呢？引入正文覆盖索引\n## 4.什么是覆盖索引\n覆盖索引（covering index ，或称为索引覆盖）即从非主键索引中就能查到的记录，而不需要查询主键索引中的记录，避免了回表的产生减少了树的搜索次数，显著提升性能。\n## 5.如何使用是覆盖索引？\n之前我们已经建立了表student，那么现在出现的业务需求中要求根据名称获取学生的年龄，并且该搜索场景非常频繁，那么先在我们删除掉之前以字段name建立的普通索引，以name和age两个字段建立联合索引，sql命令与建立后的索引树结构如下\n```sql\nALTER TABLE student DROP INDEX I_name;\nALTER TABLE student ADD INDEX I_name_age(name, age);\n```\n![image.png](https://static.linhaojun.top/articles/dcb1b7d52b648cf285841868772d1766.png)\n那在我们再次执行如下sql后\n```sql\nSELECT age FROM student WHERE name = \'小李\'；\n```\n流程为：\n\n1. 在name,age联合索引树上找到名称为小李的节点\n2. 此时节点索引里包含信息age 直接返回 12\n## 6.如何确定数据库成功使用了覆盖索引呢？\n当发起一个索引覆盖查询时，在explain的extra列可以看到using index的信息\n![image.png](https://static.linhaojun.top/articles/9bea8f5a5442b750c0dfef126e29741f.png)\n这里我们很清楚的看到Extra中Using index表明我们成功使用了覆盖索引\n> 总结：覆盖索引避免了回表现象的产生，从而减少树的搜索次数，显著提升查询性能，所以使用覆盖索引是性能优化的一种手段，文章有不当之处，欢迎指正~', '0', '0', '0', '2', '2', NULL, NULL, 'test', '2022-12-17 19:51:40', 'test', '2023-01-07 12:49:37');

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag`  (
  `article_id` bigint(0) NOT NULL COMMENT '文章ID',
  `tag_id` bigint(0) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客文章和标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES (1604060262542467074, 1605165450388885506);
INSERT INTO `blog_article_tag` VALUES (1604060262542467074, 1605166617282019330);
INSERT INTO `blog_article_tag` VALUES (1604081892463243265, 1605165450388885506);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `category_id` bigint(0) NOT NULL COMMENT '分类ID',
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '分类状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1605159324440162305, 'Docker', '0', 'admin', '2022-12-20 19:13:00', 'admin', '2023-01-04 18:33:28', 'Docker');
INSERT INTO `blog_category` VALUES (1605166598017581057, 'MySQL', '0', 'admin', '2022-12-20 19:41:54', 'test', '2023-01-07 12:19:35', 'MySQL');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `tag_id` bigint(0) NOT NULL COMMENT '标签ID',
  `tag_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '标签状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1605165450388885506, 'Linux', '0', 'admin', '2022-12-20 19:37:21', 'admin', '2023-01-04 18:33:57', 'Linux');
INSERT INTO `blog_tag` VALUES (1605166617282019330, 'Docker', '0', 'admin', '2022-12-20 19:41:59', 'admin', '2023-01-04 18:34:14', 'Docker');

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user`  (
  `blog_user_id` bigint(0) NOT NULL COMMENT '博客用户ID',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱号',
  `blog_user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客用户名称',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客用户昵称',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '用户性别（0男 1女 2未知）',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户简介',
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人网站',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`blog_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------

-- ----------------------------
-- Table structure for bs_notice
-- ----------------------------
DROP TABLE IF EXISTS `bs_notice`;
CREATE TABLE `bs_notice`  (
  `notice_id` bigint(0) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_notice
-- ----------------------------

-- ----------------------------
-- Table structure for bs_oss
-- ----------------------------
DROP TABLE IF EXISTS `bs_oss`;
CREATE TABLE `bs_oss`  (
  `oss_id` bigint(0) NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'URL地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上传人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新人',
  `service` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_oss
-- ----------------------------
INSERT INTO `bs_oss` VALUES (1598526937004425217, '2022/12/02/7029e494212e48a58aefad46e1bb4cc0.jpg', '2de0c14df3d299d82b166a6400b9e80108c4c885.jpg', '.jpg', 'http://127.0.0.1:9000/erahub/2022/12/02/7029e494212e48a58aefad46e1bb4cc0.jpg', '2022-12-02 11:58:16', 'test', '2022-12-02 11:58:16', 'test', 'minio');
INSERT INTO `bs_oss` VALUES (1601798378332225537, '2022/12/11/49b8cc3fe7d0461f8c44f02d3ef830c7.jpg', '2be4264be9b35a5755298952340d31556167e027_raw.jpg', '.jpg', 'http://127.0.0.1:9000/erahub/2022/12/11/49b8cc3fe7d0461f8c44f02d3ef830c7.jpg', '2022-12-11 12:37:48', 'admin', '2022-12-11 12:37:48', 'admin', 'minio');

-- ----------------------------
-- Table structure for bs_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `bs_oss_config`;
CREATE TABLE `bs_oss_config`  (
  `oss_config_id` bigint(0) NOT NULL COMMENT '主建',
  `config_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态（0=正常,1=停用）',
  `ext1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_oss_config
-- ----------------------------
INSERT INTO `bs_oss_config` VALUES (1, 'minio', 'minioadmin', 'minioadmin', 'erahub', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-12-11 12:51:43', '');
INSERT INTO `bs_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'erahub147258369', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-12 18:34:29', '');
INSERT INTO `bs_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'erahub', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 10:29:29', '');
INSERT INTO `bs_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'erahub-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 10:29:33', '');
INSERT INTO `bs_oss_config` VALUES (5, 'minio-lp', 'minioadmin', 'minioadmin', 'priv-lp', '', '127.0.0.1:9000', '', 'N', '', '0', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-12-11 12:50:27', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint(0) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-red', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2022-12-03 18:22:21', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 14:39:07', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 15:14:48', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-19 10:28:31', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2022-09-10 17:10:48', 'test', '2023-01-07 14:37:20', 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'EH科技', 0, 'EH', '15888888888', 'eh@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 17:01:52');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '南京总公司', 1, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:33');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '上海分公司', 2, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:26:09');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:27:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:45');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:49');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:53');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:59');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:26:13');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:26:18');
INSERT INTO `sys_dept` VALUES (1571078717323554817, 105, '0,100,101,105', '测试部门A', 1, NULL, NULL, NULL, '0', '0', 'admin', '2022-09-17 18:08:50', 'admin', '2022-09-17 18:08:50');
INSERT INTO `sys_dept` VALUES (1571078749145739265, 1571078717323554817, '0,100,101,105,1571078717323554817', '测试部门AA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:08:58', 'admin', '2022-09-17 18:08:58');
INSERT INTO `sys_dept` VALUES (1571078778984017922, 1571078749145739265, '0,100,101,105,1571078717323554817,1571078749145739265', '测试部门AAA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:09:05', 'admin', '2022-09-17 18:09:05');
INSERT INTO `sys_dept` VALUES (1571080170138185729, 1571078778984017922, '0,100,101,105,1571078717323554817,1571078749145739265,1571078778984017922', '测试部门AAAA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:14:36', 'admin', '2022-09-17 18:14:36');
INSERT INTO `sys_dept` VALUES (1571080202354634754, 1571080170138185729, '0,100,101,105,1571078717323554817,1571078749145739265,1571078778984017922,1571080170138185729', '测试部门AAAAA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:14:44', 'admin', '2022-09-17 18:14:44');
INSERT INTO `sys_dept` VALUES (1571080230607466498, 1571080202354634754, '0,100,101,105,1571078717323554817,1571078749145739265,1571078778984017922,1571080170138185729,1571080202354634754', '测试部门AAAAAA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:14:51', 'admin', '2022-09-17 18:14:51');
INSERT INTO `sys_dept` VALUES (1574282456201113601, 1571078717323554817, '0,100,101,105,1571078717323554817', '测试部门B', 1, NULL, NULL, NULL, '0', '0', 'admin', '2022-09-26 14:19:21', 'admin', '2022-09-26 14:19:21');
INSERT INTO `sys_dept` VALUES (1574282486169415681, 1574282456201113601, '0,100,101,105,1571078717323554817,1574282456201113601', '测试部门C', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:19:28', 'admin', '2022-09-26 14:19:28');
INSERT INTO `sys_dept` VALUES (1574282516406153217, 1574282486169415681, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681', '测试部门D', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:19:35', 'admin', '2022-09-26 14:19:35');
INSERT INTO `sys_dept` VALUES (1574282653543116802, 1574282516406153217, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217', '测试部门E', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:20:08', 'admin', '2022-09-26 14:20:08');
INSERT INTO `sys_dept` VALUES (1574282681611399170, 1574282653543116802, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217,1574282653543116802', '测试部门F', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:20:15', 'admin', '2022-09-26 14:20:15');
INSERT INTO `sys_dept` VALUES (1574282704453578754, 1574282681611399170, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217,1574282653543116802,1574282681611399170', '测试部门G', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:20:20', 'admin', '2022-09-26 14:20:20');
INSERT INTO `sys_dept` VALUES (1574282842853027842, 1574282704453578754, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217,1574282653543116802,1574282681611399170,1574282704453578754', '测试部门H', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:20:53', 'admin', '2022-09-26 14:20:53');
INSERT INTO `sys_dept` VALUES (1580862888259334146, 1574282681611399170, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217,1574282653543116802,1574282681611399170', '测试部门V', 0, NULL, NULL, NULL, '0', '2', 'admin', '2022-10-14 18:07:38', 'admin', '2022-10-14 18:07:38');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-12-08 18:50:40', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 09:01:35', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (1604040132781514753, 1, '是', '1', 'blog_article_top', NULL, 'success', 'N', '0', 'admin', '2022-12-17 17:05:44', 'admin', '2022-12-18 17:26:42', NULL);
INSERT INTO `sys_dict_data` VALUES (1604040775759929345, 1, '是', '1', 'blog_article_featured', NULL, 'success', 'N', '0', 'admin', '2022-12-17 17:08:17', 'admin', '2022-12-18 17:26:48', NULL);
INSERT INTO `sys_dict_data` VALUES (1604040814603378689, 2, '否', '0', 'blog_article_featured', NULL, 'info', 'N', '0', 'admin', '2022-12-17 17:08:27', 'admin', '2022-12-18 17:24:43', NULL);
INSERT INTO `sys_dict_data` VALUES (1604041000348131329, 1, '公开', '1', 'blog_article_status', NULL, 'success', 'N', '0', 'admin', '2022-12-17 17:09:11', 'admin', '2022-12-17 17:10:00', '公开文章');
INSERT INTO `sys_dict_data` VALUES (1604041151041085442, 2, '私密', '2', 'blog_article_status', NULL, 'primary', 'N', '0', 'admin', '2022-12-17 17:09:47', 'admin', '2022-12-17 17:10:06', '私密文章');
INSERT INTO `sys_dict_data` VALUES (1604041306075144194, 3, '草稿', '3', 'blog_article_status', NULL, 'info', 'N', '0', 'admin', '2022-12-17 17:10:24', 'admin', '2022-12-17 17:10:24', '草稿文章');
INSERT INTO `sys_dict_data` VALUES (1604041610262847490, 1, '原创', '1', 'blog_article_type', NULL, 'success', 'N', '0', 'admin', '2022-12-17 17:11:36', 'admin', '2022-12-17 17:11:36', '原创文章');
INSERT INTO `sys_dict_data` VALUES (1604041716135469057, 2, '转载', '2', 'blog_article_type', NULL, 'primary', 'N', '0', 'admin', '2022-12-17 17:12:01', 'admin', '2022-12-17 17:12:01', '转载文章');
INSERT INTO `sys_dict_data` VALUES (1604041776072073217, 3, '翻译', '3', 'blog_article_type', NULL, 'info', 'N', '0', 'admin', '2022-12-17 17:12:16', 'admin', '2022-12-17 17:12:26', '翻译文章');
INSERT INTO `sys_dict_data` VALUES (1604407232372985857, 2, '否', '0', 'blog_article_top', NULL, 'info', 'N', '0', 'admin', '2022-12-18 17:24:27', 'admin', '2022-12-18 17:24:27', NULL);
INSERT INTO `sys_dict_data` VALUES (1604795986233315330, 2, '回收站', '1', 'blog_article_delete', NULL, 'danger', 'N', '0', 'admin', '2022-12-19 19:09:13', 'admin', '2022-12-19 19:41:44', NULL);
INSERT INTO `sys_dict_data` VALUES (1604796105099890689, 1, '发表中', '0', 'blog_article_delete', NULL, 'success', 'N', '0', 'admin', '2022-12-19 19:09:42', 'admin', '2022-12-19 19:41:33', NULL);
INSERT INTO `sys_dict_data` VALUES (1605147913261518850, 1, '正常', '0', 'blog_category_status', NULL, 'success', 'N', '0', 'admin', '2022-12-20 18:27:39', 'admin', '2022-12-20 18:27:39', NULL);
INSERT INTO `sys_dict_data` VALUES (1605147974510940161, 2, '停用', '1', 'blog_category_status', NULL, 'danger', 'N', '0', 'admin', '2022-12-20 18:27:54', 'admin', '2022-12-20 18:27:54', NULL);
INSERT INTO `sys_dict_data` VALUES (1605148171500621826, 1, '正常', '0', 'blog_tag_status', NULL, 'success', 'N', '0', 'admin', '2022-12-20 18:28:41', 'admin', '2022-12-20 18:28:41', NULL);
INSERT INTO `sys_dict_data` VALUES (1605148230401232897, 2, '停用', '1', 'blog_tag_status', NULL, 'danger', 'N', '0', 'admin', '2022-12-20 18:28:55', 'admin', '2022-12-20 18:28:55', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 09:24:53', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 09:16:46', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (1604038001353662465, '博客文章置顶', 'blog_article_top', '0', 'admin', '2022-12-17 16:57:16', 'admin', '2022-12-17 16:57:16', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1604038222871633921, '博客文章推荐', 'blog_article_featured', '0', 'admin', '2022-12-17 16:58:09', 'admin', '2022-12-17 16:58:09', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1604038459145166849, '博客文章状态', 'blog_article_status', '0', 'admin', '2022-12-17 16:59:05', 'admin', '2022-12-17 16:59:05', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1604038658206834690, '博客文章类型', 'blog_article_type', '0', 'admin', '2022-12-17 16:59:52', 'admin', '2022-12-17 16:59:52', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1604795854305677313, '博客文章删除', 'blog_article_delete', '0', 'admin', '2022-12-19 19:08:42', 'admin', '2022-12-19 19:08:42', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1605147558851219457, '博客分类状态', 'blog_category_status', '0', 'admin', '2022-12-20 18:26:15', 'admin', '2022-12-20 18:26:15', '博客分类表');
INSERT INTO `sys_dict_type` VALUES (1605147784060178434, '博客标签状态', 'blog_tag_status', '0', 'admin', '2022-12-20 18:27:09', 'admin', '2022-12-20 18:29:36', NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地址',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1568761479632216065, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-11 08:40:58', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1568778836857548802, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-11 09:49:56', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1568894461747609601, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-11 17:29:23', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569147316832280578, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 10:14:08', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569244846941253634, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 16:41:41', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569245621868277762, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-12 16:44:46', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569245675941244930, 'test01', '127.0.0.1', '0', '登录成功', '2022-09-12 16:44:59', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569245698355605506, 'test01', '127.0.0.1', '0', '退出成功', '2022-09-12 16:45:04', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569245740961345537, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 16:45:14', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569246015612760066, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-12 16:46:20', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569246053659291649, 'test01', '127.0.0.1', '0', '登录成功', '2022-09-12 16:46:29', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569246286623518721, 'test01', '127.0.0.1', '0', '退出成功', '2022-09-12 16:47:25', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569246332538564610, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 16:47:36', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569290920104022018, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 19:44:46', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569294084437954561, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-12 19:57:20', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1569294117656842241, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 19:57:28', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570006943706865665, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-14 19:09:59', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570012269789274114, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-14 19:31:09', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570012299002601474, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-14 19:31:16', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570017363897311233, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-14 19:51:24', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570017382197059586, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-14 19:51:28', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570028795753881601, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-14 20:36:49', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570361307424346114, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 18:38:06', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570371058493190146, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:16:51', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570371142383464450, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:17:11', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570371216698142721, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:17:29', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570372361847992322, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-15 19:22:02', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570372394383208449, 'test01', '127.0.0.1', '0', '登录成功', '2022-09-15 19:22:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570376216191070209, 'test01', '127.0.0.1', '0', '退出成功', '2022-09-15 19:37:21', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570376227817680897, 'test01', '127.0.0.1', '0', '登录成功', '2022-09-15 19:37:24', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570376241864404994, 'test01', '127.0.0.1', '0', '退出成功', '2022-09-15 19:37:27', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570376265864212481, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:37:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570379140749225985, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-15 19:48:58', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570380797272813569, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:55:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570380875836321794, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-15 19:55:52', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570734600022781953, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 19:21:26', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570740557767372802, 'admin', '192.168.56.1', '0', '退出成功', '2022-09-16 19:45:07', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570740573898665985, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 19:45:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570740777087528962, 'admin', '192.168.56.1', '0', '退出成功', '2022-09-16 19:45:59', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570748951697944577, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 20:18:28', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570753312524201986, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 20:35:48', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570757578651463682, 'admin', '192.168.56.1', '0', '退出成功', '2022-09-16 20:52:45', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570757590231937025, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 20:52:47', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570954664126394369, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 09:55:54', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570959329492676609, 'admin', '223.104.150.3', '0', '登录成功', '2022-09-17 10:14:26', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570961192808034306, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 10:21:50', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570961317890568193, 'admin', '223.65.41.168', '0', '退出成功', '2022-09-17 10:22:20', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570961327638130689, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 10:22:22', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570967478488477697, 'admin', '223.65.41.168', '0', '退出成功', '2022-09-17 10:46:49', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570967524776816642, 'admin', '223.65.41.168', '1', '密码输入错误1次', '2022-09-17 10:47:00', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570967571954348033, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 10:47:11', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570967690883837954, 'admin', '223.65.41.168', '0', '退出成功', '2022-09-17 10:47:39', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570967725671395329, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 10:47:48', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570968135794634753, 'admin', '223.65.41.168', '0', '退出成功', '2022-09-17 10:49:25', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570968171777568770, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 10:49:34', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570968201989140482, 'admin', '223.65.41.168', '0', '退出成功', '2022-09-17 10:49:41', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570968382583287809, 'test01', '223.65.41.168', '0', '登录成功', '2022-09-17 10:50:24', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570968948965322754, 'test01', '223.65.41.168', '0', '退出成功', '2022-09-17 10:52:39', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570969006293069825, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 10:52:53', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570972724417736706, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 11:07:39', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570976614869577729, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 11:23:07', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570981354995134465, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 11:41:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570994581309173762, 'admin', '223.65.41.168', '1', '密码输入错误1次', '2022-09-17 12:34:31', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570994652339712002, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 12:34:47', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570994806870454273, 'admin', '223.65.41.168', '0', '退出成功', '2022-09-17 12:35:24', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570994932934455297, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 12:35:54', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570994947065065474, 'admin', '223.65.41.168', '0', '退出成功', '2022-09-17 12:35:58', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1570995002350186498, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 12:36:11', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571027659687669761, 'admin', '183.209.139.161', '0', '登录成功', '2022-09-17 14:45:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571057346572922882, 'admin', '183.209.139.161', '0', '登录成功', '2022-09-17 16:43:55', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571069369482424321, 'admin', '223.65.41.168', '1', '密码输入错误1次', '2022-09-17 17:31:41', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571069383025831938, 'admin', '223.65.41.168', '1', '密码输入错误2次', '2022-09-17 17:31:45', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571069395902345218, 'admin', '223.65.41.168', '1', '密码输入错误3次', '2022-09-17 17:31:48', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571069432342458370, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 17:31:56', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571077685839343617, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 18:04:44', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571090706049478658, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 18:56:28', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571105055560380417, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-17 19:53:30', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571111794070466561, 'admin', '223.65.41.168', '0', '退出成功', '2022-09-17 20:20:16', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571286404078448642, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-18 07:54:06', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571293440912601090, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-18 08:22:04', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571311782494941186, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-18 09:34:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571417543992619009, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-18 16:35:13', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571421296741265410, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-18 16:50:07', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571441888362180609, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-18 18:11:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571451194113470466, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-18 18:48:55', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571524314270740482, 'admin', '223.104.150.14', '0', '登录成功', '2022-09-18 23:39:29', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571650708485124098, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-19 08:01:43', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571658316709310465, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-19 08:31:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571672786697400322, 'admin', '223.104.4.56', '0', '登录成功', '2022-09-19 09:29:27', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571679647018463233, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-19 09:56:43', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571687524806373378, 'admin', '223.112.3.243', '0', '退出成功', '2022-09-19 10:28:01', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571687578921283586, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-19 10:28:14', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571687861369909249, 'admin', '223.112.3.243', '0', '退出成功', '2022-09-19 10:29:21', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571687887915659265, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-19 10:29:28', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571688187506405377, 'admin', '223.112.3.243', '0', '退出成功', '2022-09-19 10:30:39', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571688232154771457, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-19 10:30:50', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571705521889554433, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-19 11:39:32', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571740466062241793, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-19 13:58:23', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571823687236005890, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-19 19:29:05', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571845059064573953, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-19 20:54:00', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1571876330151030785, 'admin', '223.104.150.59', '0', '登录成功', '2022-09-19 22:58:16', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572004849485033473, 'admin', '223.104.150.115', '0', '登录成功', '2022-09-20 07:28:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572010256970493953, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-20 07:50:26', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572023560812048385, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-20 08:43:18', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572035742958301186, 'test01', '223.112.3.243', '0', '登录成功', '2022-09-20 09:31:43', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572035764558966785, 'test01', '223.112.3.243', '0', '退出成功', '2022-09-20 09:31:48', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572035780463767554, 'test01', '223.112.3.243', '1', '密码输入错误1次', '2022-09-20 09:31:52', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572035805193383937, 'test01', '223.112.3.243', '1', '密码输入错误2次', '2022-09-20 09:31:58', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572063662397403137, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-20 11:22:39', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572105076044935170, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-20 14:07:13', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572110629664141313, 'admin', '223.112.3.243', '0', '退出成功', '2022-09-20 14:29:17', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572110661972865026, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-20 14:29:25', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572121359247421441, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-20 15:11:55', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572178777591459842, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-20 19:00:05', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572191330002481153, 'admin', '223.65.41.168', '1', '密码输入错误1次', '2022-09-20 19:49:58', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572191364060229634, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-20 19:50:06', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572195437740240898, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-20 20:06:17', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572195702224662529, 'admin', '223.65.41.168', '0', '退出成功', '2022-09-20 20:07:20', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572195784827285505, 'admin', '223.65.41.168', '1', '密码输入错误1次', '2022-09-20 20:07:40', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572195815114354689, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-20 20:07:47', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572195917505703938, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-20 20:08:11', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572198811478994946, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-20 20:19:41', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572239678260588545, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-20 23:02:05', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572365898814009346, 'admin', '223.104.150.43', '0', '登录成功', '2022-09-21 07:23:38', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572372405832069121, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 07:49:29', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572375482370830337, 'admin', '223.112.3.243', '1', '密码输入错误1次', '2022-09-21 08:01:43', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572375519905656834, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 08:01:52', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572413891630018562, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 10:34:20', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572465714864795649, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 14:00:16', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572465784465076225, 'admin', '223.112.3.243', '0', '退出成功', '2022-09-21 14:00:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572465854954549249, 'test01', '223.112.3.243', '1', '密码输入错误1次', '2022-09-21 14:00:49', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572465867717816322, 'test01', '223.112.3.243', '1', '密码输入错误2次', '2022-09-21 14:00:53', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572465884574724098, 'test01', '223.112.3.243', '1', '密码输入错误3次', '2022-09-21 14:00:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572465895194701826, 'test01', '223.112.3.243', '1', '密码输入错误4次', '2022-09-21 14:00:59', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572465912059998210, 'test01', '223.112.3.243', '1', '密码输入错误5次，帐户锁定10分钟', '2022-09-21 14:01:03', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572465937041272834, 'test01', '223.112.3.243', '1', '密码输入错误5次，帐户锁定10分钟', '2022-09-21 14:01:09', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572465999679008769, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 14:01:24', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572466087285436417, 'admin', '223.112.3.243', '0', '退出成功', '2022-09-21 14:01:45', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572466132147712001, 'test01', '223.112.3.243', '0', '登录成功', '2022-09-21 14:01:56', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572466173595824129, 'test01', '223.112.3.243', '0', '退出成功', '2022-09-21 14:02:05', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572466222925033473, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 14:02:17', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572466290646265858, 'admin', '223.112.3.243', '0', '退出成功', '2022-09-21 14:02:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572466367536246786, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 14:02:52', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572466454752604162, 'admin', '223.112.3.243', '0', '退出成功', '2022-09-21 14:03:12', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572467030471159810, 'test01', '223.112.3.243', '0', '登录成功', '2022-09-21 14:05:30', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572467223966986242, 'test01', '223.112.3.243', '0', '退出成功', '2022-09-21 14:06:16', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572468377547386881, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 14:10:51', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572479319991595010, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 14:54:20', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572485976322682882, 'admin', '223.104.150.75', '0', '登录成功', '2022-09-21 15:20:47', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572504247071617026, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-21 16:33:23', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572517012310011906, 'admin', '223.104.147.67', '0', '登录成功', '2022-09-21 17:24:06', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572525780464775169, 'admin', '182.108.32.182', '1', '密码输入错误1次', '2022-09-21 17:58:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572525801901862914, 'admin', '182.108.32.182', '1', '密码输入错误2次', '2022-09-21 17:59:02', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572538398134972418, 'admin', '223.65.41.168', '0', '登录成功', '2022-09-21 18:49:05', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572740690360610818, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-22 08:12:55', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572845404829986817, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-22 15:09:01', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572845890685579265, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-22 15:10:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572846674919763970, 'admin', '223.112.3.243', '0', '登录成功', '2022-09-22 15:14:04', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572904481626992641, 'admin', '183.209.138.48', '0', '登录成功', '2022-09-22 19:03:46', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1572905913042284546, 'admin', '183.209.138.48', '0', '登录成功', '2022-09-22 19:09:28', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573098389329883138, 'admin', '122.96.105.26', '0', '登录成功', '2022-09-23 07:54:17', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573114496367407105, 'admin', '122.96.105.26', '0', '退出成功', '2022-09-23 08:58:18', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573114525190664193, 'test01', '122.96.105.26', '0', '登录成功', '2022-09-23 08:58:25', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573114711468093441, 'test01', '122.96.105.26', '0', '退出成功', '2022-09-23 08:59:09', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573114754459709441, 'admin', '122.96.105.26', '0', '登录成功', '2022-09-23 08:59:19', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573224070093156353, 'admin', '122.96.105.26', '0', '登录成功', '2022-09-23 16:13:42', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573255317381132290, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-23 18:17:52', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573258508839628801, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-23 18:30:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573261490117357569, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-23 18:42:24', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573321780381036545, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-23 22:41:58', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573470442570592257, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-24 08:32:42', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573491042810802177, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-24 09:54:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573516733560336386, 'admin', '223.104.4.67', '0', '登录成功', '2022-09-24 11:36:38', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573660176802590721, 'admin', '223.104.4.67', '0', '登录成功', '2022-09-24 21:06:38', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573854293633478657, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-25 09:57:59', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573854394888171521, 'admin', '183.209.136.16', '0', '退出成功', '2022-09-25 09:58:23', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573854422952259585, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-25 09:58:30', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573854546625507330, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-25 09:58:59', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573854615651168257, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-25 09:59:16', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573910912807415809, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-25 13:42:58', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1573981333942644738, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-25 18:22:48', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574205775234936833, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-26 09:14:39', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574224852598861825, 'admin', '180.101.128.240', '0', '退出成功', '2022-09-26 10:30:27', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574224882550386689, 'test01', '180.101.128.240', '0', '登录成功', '2022-09-26 10:30:34', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574225148939022337, 'test01', '180.101.128.240', '0', '退出成功', '2022-09-26 10:31:38', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574225181499404290, 'admin', '180.101.128.240', '1', '密码输入错误1次', '2022-09-26 10:31:46', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574225210117140482, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-26 10:31:52', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574225274696839169, 'admin', '180.101.128.240', '0', '退出成功', '2022-09-26 10:32:08', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574225313800335361, 'test01', '180.101.128.240', '0', '登录成功', '2022-09-26 10:32:17', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574225969768509441, 'test01', '180.101.128.240', '0', '退出成功', '2022-09-26 10:34:54', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574226000831524865, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-26 10:35:01', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574226482551533570, 'admin', '180.101.128.240', '0', '退出成功', '2022-09-26 10:36:56', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574226552990674946, 'test01', '180.101.128.240', '0', '登录成功', '2022-09-26 10:37:13', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574226881404678145, 'test01', '180.101.128.240', '0', '退出成功', '2022-09-26 10:38:31', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574226910131466242, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-26 10:38:38', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574232861492326402, 'admin', '180.101.128.240', '0', '退出成功', '2022-09-26 11:02:17', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574232949799202817, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-26 11:02:38', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574239881591205890, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-26 11:30:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574281755882369026, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-26 14:16:34', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574295866007564290, 'admin', '180.101.128.240', '0', '退出成功', '2022-09-26 15:12:38', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574295990137991170, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-26 15:13:08', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574327051572162562, 'admin', '117.136.46.110', '0', '登录成功', '2022-09-26 17:16:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574343090225754113, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-26 18:20:17', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574548290806951938, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-27 07:55:41', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574575217865338882, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-27 09:42:41', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574640270467608577, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-27 14:01:11', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574646076806213633, 'admin', '117.136.45.129', '1', '密码输入错误1次', '2022-09-27 14:24:15', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574646532169216001, 'admin', '117.136.45.129', '0', '登录成功', '2022-09-27 14:26:03', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574646697374461954, 'admin', '117.136.45.129', '0', '登录成功', '2022-09-27 14:26:43', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574646741775364097, 'admin', '117.136.45.129', '0', '退出成功', '2022-09-27 14:26:53', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574646802110427138, 'admin', '117.136.45.129', '0', '登录成功', '2022-09-27 14:27:08', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574646947346591745, 'admin', '117.136.45.129', '0', '登录成功', '2022-09-27 14:27:42', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574666192201658370, 'admin', '180.101.128.240', '0', '登录成功', '2022-09-27 15:44:11', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574696434668613633, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-27 17:44:21', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574698987066175490, 'admin', '183.209.136.16', '0', '退出成功', '2022-09-27 17:54:30', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699056641290242, 'test01', '183.209.136.16', '1', '密码输入错误1次', '2022-09-27 17:54:46', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699067181576193, 'test01', '183.209.136.16', '1', '密码输入错误2次', '2022-09-27 17:54:49', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699076509708290, 'test01', '183.209.136.16', '1', '密码输入错误3次', '2022-09-27 17:54:51', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699089595936769, 'test01', '183.209.136.16', '1', '密码输入错误4次', '2022-09-27 17:54:54', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699102237569026, 'test01', '183.209.136.16', '1', '密码输入错误5次，帐户锁定10分钟', '2022-09-27 17:54:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699125092331521, 'test01', '183.209.136.16', '1', '密码输入错误5次，帐户锁定10分钟', '2022-09-27 17:55:03', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699147968065537, 'test01', '183.209.136.16', '1', '密码输入错误5次，帐户锁定10分钟', '2022-09-27 17:55:08', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699201181200386, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-27 17:55:21', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699316352593922, 'admin', '183.209.136.16', '0', '退出成功', '2022-09-27 17:55:48', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699384942047233, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-27 17:56:05', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574699745077571585, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-27 17:57:30', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574907493757169666, 'admin', '122.96.105.26', '0', '登录成功', '2022-09-28 07:43:02', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1574919291973611522, 'admin', '122.96.105.26', '0', '登录成功', '2022-09-28 08:29:54', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575022567012380674, 'admin', '122.96.105.26', '0', '登录成功', '2022-09-28 15:20:17', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575022587371532290, 'admin', '122.96.105.26', '0', '退出成功', '2022-09-28 15:20:22', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575022618921086977, 'test01', '122.96.105.26', '0', '登录成功', '2022-09-28 15:20:30', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575022632149921794, 'test01', '122.96.105.26', '0', '退出成功', '2022-09-28 15:20:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575022663217131521, 'admin', '122.96.105.26', '0', '登录成功', '2022-09-28 15:20:40', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575035736623624193, 'admin', '117.136.45.144', '0', '登录成功', '2022-09-28 16:12:37', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575068514098556929, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-28 18:22:52', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575313883495608321, 'admiN', '223.104.150.87', '0', '登录成功', '2022-09-29 10:37:52', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575314051699781634, 'admin', '223.104.150.87', '0', '退出成功', '2022-09-29 10:38:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575314112496218114, 'admin', '223.104.150.87', '1', '密码输入错误1次', '2022-09-29 10:38:47', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575314173829525506, 'admin', '223.104.150.87', '1', '密码输入错误2次', '2022-09-29 10:39:02', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575314216217161730, 'admin', '223.104.150.87', '0', '登录成功', '2022-09-29 10:39:12', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575368130945822722, 'admin', '122.96.105.26', '0', '登录成功', '2022-09-29 14:13:26', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575384031917191169, 'admin', '122.96.105.26', '0', '登录成功', '2022-09-29 15:16:37', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575422170375335937, 'admin', '183.209.136.16', '0', '登录成功', '2022-09-29 17:48:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575426503268253697, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-29 18:05:23', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575426529247772674, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-29 18:05:29', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575808815336243202, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-09-30 19:24:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575808873888727042, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-30 19:24:47', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575818028150140929, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-30 20:01:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575818028166918146, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-30 20:01:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575818028166918147, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-30 20:01:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575818219452350466, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-30 20:01:55', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575819288978898945, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-30 20:06:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575819288978898946, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-30 20:06:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575819288999870466, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-30 20:06:10', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575819343433547778, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-30 20:06:23', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575825448435970050, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-30 20:30:39', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575832610566557698, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-30 20:59:07', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575833550115819522, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-30 21:02:51', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1575833576443465729, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-30 21:02:57', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576008143862460418, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-01 08:36:37', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576012372656234498, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-01 08:53:25', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576014706496901121, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-01 09:02:42', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576027998535778305, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-01 09:55:31', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576035952156721154, 'test01', '127.0.0.1', '1', '密码输入错误1次', '2022-10-01 10:27:07', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576371667310669826, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-02 08:41:08', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576374665814470658, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-02 08:53:03', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576389958519459842, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-02 09:53:49', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576391158019100674, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-02 09:58:35', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576391184061534209, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-02 09:58:41', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576391184183169025, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-02 09:58:41', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576392106661613570, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-02 10:02:21', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576392106804219905, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-02 10:02:21', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576426381779877890, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-02 12:18:33', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576784082833752066, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-03 11:59:55', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1576797567684694018, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-03 12:53:30', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1578548152347860993, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-08 08:49:42', NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (1579779566271717377, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-11 18:22:54', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1579779619669401601, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-11 18:23:07', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1580862586487549954, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-14 18:06:26', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1583428468774522881, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-21 20:02:20', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587004214553726977, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-31 16:51:05', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587004271298465793, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-31 16:51:18', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587004297500282881, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-31 16:51:24', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587027031223447554, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-31 18:21:44', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587239461375451138, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-01 08:25:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587239523434373121, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-01 08:26:07', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587246114216878082, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-01 08:52:18', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587252908481929217, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-01 09:19:18', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587334166499033089, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-01 14:42:11', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587404834041327618, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-01 19:23:00', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587450241047883778, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-01 22:23:26', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587618089644953602, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 09:30:24', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587623026856591362, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 09:50:01', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587656137682317313, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 12:01:35', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587669905564889090, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-02 12:56:18', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587669933096300546, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 12:56:24', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587723455921721345, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 16:29:05', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587723686134484994, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 16:30:00', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587724096194809858, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 16:31:38', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587739981143937026, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 17:34:45', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587771063335759874, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 19:38:16', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587812283537764353, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:22:03', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587947958161391617, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 07:21:11', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587967723189846018, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-03 08:39:43', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587967734917120002, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-03 08:39:46', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1587967769960529921, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 08:39:54', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588052089425367041, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-03 14:14:57', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588052130328219650, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 14:15:07', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588067924260950018, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-03 15:17:53', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588067960461987841, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 15:18:01', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588076593392398337, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 15:52:20', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588090318090473474, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 16:46:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588093763493105666, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-03 17:00:33', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588093773022564354, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 17:00:36', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588094077050884098, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-03 17:01:48', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588094106830442498, 'test01', '127.0.0.1', '1', '密码输入错误1次', '2022-11-03 17:01:55', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588094137348198402, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-03 17:02:02', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588125116846686210, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-03 19:05:08', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588316414497112065, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-04 07:45:17', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588322195552440321, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-04 08:08:16', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588322230130282498, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 08:08:24', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588346471357706242, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 09:44:43', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588346472477585409, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-04 09:44:44', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588346521450278913, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 09:44:55', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588346521647411201, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-04 09:44:55', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588347133923475457, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 09:47:21', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588350818829254658, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-04 10:02:00', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588351115400097794, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 10:03:11', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588731352554164226, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 11:14:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588732290320846849, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 11:17:50', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588823350875766786, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 17:19:40', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588828865051738114, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 17:41:35', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588828875684298754, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 17:41:38', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588838016138055681, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 18:17:57', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588838045984722946, 'test01', '127.0.0.1', '1', '密码输入错误1次', '2022-11-05 18:18:04', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588838087533498369, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-05 18:18:14', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588839622443241473, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-05 18:24:20', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588839681645842434, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 18:24:34', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588839966564913153, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 18:25:42', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588839994943574018, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-05 18:25:49', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588840334933856258, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-05 18:27:10', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588840367049641986, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 18:27:17', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588840654082641922, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 18:28:26', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588840696315088898, 'test01', '127.0.0.1', '1', '密码输入错误1次', '2022-11-05 18:28:36', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588840720298119169, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-05 18:28:42', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588842421457489921, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-05 18:35:27', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588842438788354049, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-05 18:35:31', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588842739775803393, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-05 18:36:43', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588842785401442306, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 18:36:54', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588843055778861057, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 18:37:58', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588843107406548993, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-05 18:38:11', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588843262524493825, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-05 18:38:48', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588843304429785090, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 18:38:58', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588843352106438658, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 18:39:09', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588843393084788738, 'test01', '127.0.0.1', '1', '密码输入错误1次', '2022-11-05 18:39:19', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588843413200670722, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-05 18:39:24', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588844547277557761, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-05 18:43:54', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588844571986202625, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-05 18:44:00', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588844612415098882, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 18:44:10', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588845316160589825, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 18:46:57', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588845343280959490, 'test', '127.0.0.1', '0', '登录成功', '2022-11-05 18:47:04', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588848017422368769, 'test', '127.0.0.1', '0', '退出成功', '2022-11-05 18:57:41', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588848091867070465, 'test', '127.0.0.1', '0', '登录成功', '2022-11-05 18:57:59', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588848206564507650, 'test', '127.0.0.1', '0', '退出成功', '2022-11-05 18:58:26', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588848237094846465, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-05 18:58:34', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588850533916606466, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-05 19:07:41', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588850548214988801, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-05 19:07:45', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588850941829447682, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-05 19:09:19', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588850974196891650, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 19:09:26', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588851064869355521, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 19:09:48', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588851092157497346, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-05 19:09:54', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588851122499092482, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-05 19:10:02', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588851150970028034, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 19:10:08', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1588851397364416514, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 19:11:07', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1589068834735267841, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-06 09:35:08', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1589069203527835650, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-06 09:36:36', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1589069229394108417, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-06 09:36:42', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1589564111653138434, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 18:23:12', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1589575441512644609, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 19:08:13', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591003140869271554, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-11 17:41:23', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591370346023075842, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:00:31', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591654865385017346, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-13 12:51:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591666872284844033, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-13 13:38:49', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591666886499340290, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-13 13:38:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591677352554500097, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-13 14:20:27', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591677364038504450, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-13 14:20:30', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591723287447736321, 'test01', '127.0.0.1', '1', '密码输入错误1次', '2022-11-13 17:22:59', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591723314236755970, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-13 17:23:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591723423460626434, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-13 17:23:32', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591723454037102594, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-13 17:23:39', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591723662192021506, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-13 17:24:29', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591723688821657602, 'test01', '127.0.0.1', '0', '登录成功', '2022-11-13 17:24:35', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591726060029480961, 'test01', '127.0.0.1', '0', '退出成功', '2022-11-13 17:34:00', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1591726115134246913, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-13 17:34:13', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1594125596958093313, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-20 08:28:54', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1594140529141719042, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-20 09:28:14', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598117369808113665, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-01 08:50:47', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598119612141678593, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-01 08:59:42', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598119628704985090, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-01 08:59:46', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598215342470717441, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-01 15:20:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598239695153389570, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-01 16:56:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598483675300380674, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-02 09:06:21', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598521489568256001, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-02 11:36:37', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598522144269783041, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-02 11:39:13', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598526845560209410, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-02 11:57:54', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598526873334890498, 'test', '127.0.0.1', '0', '登录成功', '2022-12-02 11:58:00', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598527081661775874, 'test', '127.0.0.1', '0', '退出成功', '2022-12-02 11:58:50', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598527108152999937, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-02 11:58:56', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598847640584990721, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 09:12:37', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598849131156746242, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 09:18:33', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598855227191836673, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 09:42:46', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598862775340978178, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:12:46', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598862787881947138, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:12:49', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598862838070988801, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:13:01', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598862850138001410, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:13:04', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598862913484574721, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:13:19', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598862956765597697, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:13:29', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598863196952416258, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:14:26', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598863259413991426, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:14:41', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598864118554181633, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:18:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598864163747807234, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:18:17', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598864176636903425, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:18:20', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598864599540187138, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:20:01', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598864695099015169, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:20:23', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598864725566439425, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:20:31', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598864962125258754, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:21:27', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598864979665838081, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:21:31', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598865050088202241, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:21:48', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598865069780459521, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:21:53', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598865228820078594, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:22:31', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598865415185588226, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:23:15', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598866129022484481, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:26:05', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598866129022484482, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 10:26:05', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598874526866350082, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:59:28', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598874544025247746, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 10:59:32', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598880922852855809, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 11:24:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598880936404652034, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 11:24:56', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598881133255921666, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-03 11:25:43', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598881174443986945, 'test', '127.0.0.1', '0', '登录成功', '2022-12-03 11:25:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598881294384304130, 'test', '127.0.0.1', '0', '退出成功', '2022-12-03 11:26:21', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598881322049933314, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 11:26:28', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1598982068007329793, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 18:06:47', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600443319786868738, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-07 18:53:17', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600464916509822977, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-07 20:19:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600465361370288129, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-07 20:20:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600466321249341441, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-07 20:24:41', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600468998016405506, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-07 20:35:19', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600469944079458305, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-07 20:39:05', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600476537626009602, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-07 21:05:17', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600476548132741122, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-07 21:05:19', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600797292200939521, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-08 18:19:50', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600798693949919233, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-08 18:25:25', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1600798711154954241, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-08 18:25:29', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601155945269530625, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-09 18:05:00', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601170383582236673, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-09 19:02:22', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601401480811364353, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-10 10:20:40', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601464695763197953, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-10 14:31:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601480578069921794, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-10 15:34:59', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601525359378640898, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-10 18:32:55', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601769250929401858, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-11 10:42:04', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601798193485053954, 'admin', '127.0.0.1', '0', '????', '2022-12-11 12:37:04', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601802529594363906, 'admin', '127.0.0.1', '0', '????', '2022-12-11 12:54:18', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601802547105583106, 'admin', '127.0.0.1', '1', '??????1?', '2022-12-11 12:54:22', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601802968150753282, 'admin', '127.0.0.1', '1', '??????2?', '2022-12-11 12:56:02', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601803739009376257, 'admin', '127.0.0.1', '1', '密码输入错误3次', '2022-12-11 12:59:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601803777290788865, 'test', '127.0.0.1', '0', '登录成功', '2022-12-11 12:59:15', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804008774426625, 'test', '127.0.0.1', '0', '退出成功', '2022-12-11 13:00:10', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804030823882753, 'admin', '127.0.0.1', '1', '密码输入错误4次', '2022-12-11 13:00:16', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804319345860609, 'admin', '127.0.0.1', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-11 13:01:24', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804411440193537, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-12-11 13:01:46', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804446710095874, 'admin', '127.0.0.1', '1', '密码输入错误2次', '2022-12-11 13:01:55', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804520609538049, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-11 13:02:12', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804611810484225, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-11 13:02:34', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804645432025089, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-11 13:02:42', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804731562057730, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-11 13:03:03', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804768744562690, 'test', '127.0.0.1', '0', '登录成功', '2022-12-11 13:03:12', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804916300177409, 'test', '127.0.0.1', '0', '退出成功', '2022-12-11 13:03:47', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601804981685182465, 'test', '127.0.0.1', '0', '登录成功', '2022-12-11 13:04:02', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1601889233835614209, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-11 18:38:50', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1602632695451213826, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-13 19:53:05', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1602981943107522561, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-14 19:00:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1602982020316270594, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-14 19:01:10', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1602982044022476801, 'test01', '127.0.0.1', '0', '登录成功', '2022-12-14 19:01:16', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1602982617161617409, 'test01', '127.0.0.1', '0', '登录成功', '2022-12-14 19:03:33', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1603917000657670145, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-17 08:56:27', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1603936227846369282, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-17 10:12:51', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604031789241311234, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-17 16:32:35', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604035835800952834, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-17 16:48:39', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604037089159651330, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-17 16:53:38', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604037098814939137, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-17 16:53:41', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604059574894698498, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-17 18:22:59', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604059585384652801, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-17 18:23:02', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604080799016644609, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-17 19:47:20', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604081566104514561, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-17 19:50:22', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604081598761365506, 'test', '127.0.0.1', '0', '登录成功', '2022-12-17 19:50:30', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604081663307509762, 'test', '127.0.0.1', '0', '退出成功', '2022-12-17 19:50:46', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604081691635838978, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-17 19:50:52', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604081749882138625, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-17 19:51:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604081776096538626, 'test', '127.0.0.1', '0', '登录成功', '2022-12-17 19:51:12', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604082129948995585, 'test', '127.0.0.1', '0', '退出成功', '2022-12-17 19:52:37', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604082154661834753, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-17 19:52:43', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604082259603320833, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-17 19:53:08', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604082294076305409, 'test', '127.0.0.1', '0', '登录成功', '2022-12-17 19:53:16', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604281005981167617, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-18 09:02:53', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604281029658013697, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-18 09:02:58', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604281066014240770, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-18 09:03:07', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604282719475986434, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-18 09:09:41', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604282739726086146, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-18 09:09:46', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604282751377862658, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-18 09:09:49', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604282761964285953, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-18 09:09:51', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604406530493960193, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-18 17:21:40', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604412763837878273, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-18 17:46:26', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604778446362824706, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-19 17:59:32', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604795221439729665, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-19 19:06:11', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1604795243698900993, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-19 19:06:16', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1605139633436987393, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-20 17:54:45', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1605155922712825858, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-20 18:59:29', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1605155933487992833, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-20 18:59:32', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1605163672054370306, 'admin', '127.0.0.1', '0', '退出成功', '2022-12-20 19:30:17', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1605163682192003073, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-20 19:30:19', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1605503538122293249, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-21 18:00:47', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609381638455263234, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-01 10:50:58', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609384259719102465, 'admin', '127.0.0.1', '0', '退出成功', '2023-01-01 11:01:23', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609384275070255106, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-01 11:01:27', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609400407156170754, 'admin', '127.0.0.1', '0', '退出成功', '2023-01-01 12:05:33', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609400422075310082, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-01 12:05:36', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609401752911192065, 'admin', '127.0.0.1', '0', '退出成功', '2023-01-01 12:10:54', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609401780736204802, 'test', '127.0.0.1', '0', '登录成功', '2023-01-01 12:11:00', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609401830572924929, 'test', '127.0.0.1', '0', '退出成功', '2023-01-01 12:11:12', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609401856703438849, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-01 12:11:19', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609431084304015362, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-01 14:07:27', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609721547208572929, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-02 09:21:39', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1609763930906406914, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-02 12:10:04', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1610205127810584578, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-03 17:23:13', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1610208175941328897, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-03 17:35:20', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1610571967581745154, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-04 17:40:55', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1610577152668430337, 'admin', '127.0.0.1', '0', '退出成功', '2023-01-04 18:01:31', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1610577167205888001, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-04 18:01:34', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1610936626784579585, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-05 17:49:56', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611297035819421698, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-06 17:42:04', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611303465230274561, 'admin', '127.0.0.1', '0', '退出成功', '2023-01-06 18:07:37', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611303478341668866, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-06 18:07:40', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611307939818639362, 'admin', '127.0.0.1', '0', '退出成功', '2023-01-06 18:25:24', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611307974388092930, 'test', '127.0.0.1', '0', '登录成功', '2023-01-06 18:25:32', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611542060780265474, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 09:55:43', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611543693585063937, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 10:02:12', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611543719581360129, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-07 10:02:18', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611543865148874754, 'admin', '127.0.0.1', '0', '退出成功', '2023-01-07 10:02:53', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611543901559627777, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 10:03:02', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611544613085552641, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 10:05:51', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611544655498354689, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-07 10:06:02', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611544797270024194, 'admin', '127.0.0.1', '0', '退出成功', '2023-01-07 10:06:35', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611544826659512322, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 10:06:42', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611558979017154561, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 11:02:57', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611561522103361538, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 11:13:03', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611561561764700161, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 11:13:12', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611573234550480897, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 11:59:35', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611576133376581633, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 12:11:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611576156046794753, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 12:11:12', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611587714856558594, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 12:57:08', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611587725136797697, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 12:57:10', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611590442890600450, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 13:07:58', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611590458107535362, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 13:08:02', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611594845005586434, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 13:25:28', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611594861338206209, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 13:25:32', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611597659350016001, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 13:36:39', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611597673518374913, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 13:36:42', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611599831357759489, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 13:45:17', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611599846125903874, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 13:45:20', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611611285972660225, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 14:30:48', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611617832274571265, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 14:56:48', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611617841174884353, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 14:56:50', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611620574766379010, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 15:07:42', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611620588964098050, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 15:07:46', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611626463816658945, 'test', '127.0.0.1', '0', '退出成功', '2023-01-07 15:31:06', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1611626477339095042, 'test', '127.0.0.1', '0', '登录成功', '2023-01-07 15:31:09', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-09-10 17:10:48', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-09-10 17:10:48', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-09-10 17:10:48', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (5, '博客管理', 0, 5, 'blog', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'star', 'admin', '2022-09-10 17:10:57', 'admin', '2022-12-17 16:52:06', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-09-10 17:10:48', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-09-10 17:10:48', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-09-10 17:10:48', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-09-10 17:10:48', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-09-10 17:10:48', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-09-10 17:10:48', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'systemconfig', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-13 14:44:57', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1588742925398171649, 1, 'notice', 'basicservice/notice/index', '', 1, 0, 'C', '0', '0', 'basicservice:notice:list', 'message', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 12:01:13', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-09-10 17:10:48', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-09-10 17:10:48', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, 'XxlJob', 2, 7, 'Xxljob', 'monitor/xxljob/index', '', 1, 0, 'C', '0', '0', 'monitor:xxljob:list', 'job', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-23 10:44:19', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel', 2, 6, 'Sentinel', 'monitor/sentinel/index', '', 1, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-23 10:44:15', '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos', 2, 8, 'http://127.0.0.1:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-29 18:06:46', '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'server', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-23 18:33:28', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '1', 'tool:build:list', 'build', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-01 08:32:36', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-09-10 17:10:48', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1591655291324977153, 1, 'oss', 'basicservice/oss/index', '', 1, 0, 'C', '0', '0', 'basicservice:oss:list', 'upload', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-13 12:55:29', '文件管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2022-09-10 17:10:48', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2022-09-10 17:10:48', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:notice:query', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:42:37', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:notice:add', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:42:42', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:notice:edit', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:42:47', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:notice:remove', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:42:52', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2023-01-07 10:06:21', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:query', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:43:03', '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:upload', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:43:07', '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:download', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:43:15', '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:remove', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:43:20', '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 1591655913331871746, 2, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:config:add', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-13 13:00:50', '');
INSERT INTO `sys_menu` VALUES (1605, '配置编辑', 1591655913331871746, 3, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:config:edit', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-13 13:00:43', '');
INSERT INTO `sys_menu` VALUES (1570009901798481921, '缓存监控', 2, 2, 'cache', 'monitor/cache/index', NULL, 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-09-14 19:21:45', 'admin', '2022-11-05 11:18:09', '');
INSERT INTO `sys_menu` VALUES (1570010319794429953, '缓存列表', 2, 3, 'cacheList', 'monitor/cache/list', NULL, 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-09-14 19:23:24', 'admin', '2022-09-14 19:23:24', '');
INSERT INTO `sys_menu` VALUES (1570022388644143106, '服务监控', 2, 4, 'server', 'monitor/server/index', NULL, 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-09-14 20:11:22', 'admin', '2022-09-15 18:39:17', '');
INSERT INTO `sys_menu` VALUES (1570758202780676098, 'Minio', 2, 9, 'http://127.0.0.1:9000', '', NULL, 0, 0, 'C', '0', '0', 'monitor:minio:list', 'upload', 'admin', '2022-09-16 20:55:13', 'admin', '2022-09-29 18:06:55', '');
INSERT INTO `sys_menu` VALUES (1572393811995209730, 'Seata', 2, 10, 'http://127.0.0.1:7091', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:seata:list', 'tool', 'admin', '2022-09-21 09:14:33', 'admin', '2022-09-29 18:07:04', '');
INSERT INTO `sys_menu` VALUES (1588077119135821826, '数据库文档', 3, 2, 'dbDoc', 'tool/dbDoc/index', NULL, 1, 0, 'C', '0', '0', 'tool:database:doc:list', 'date-range', 'admin', '2022-11-03 15:54:25', 'admin', '2022-11-05 17:20:41', '');
INSERT INTO `sys_menu` VALUES (1588092486994432002, '数据库文档导出', 1588077119135821826, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tool:database:doc:export', '#', 'admin', '2022-11-03 16:55:29', 'admin', '2022-11-05 17:41:58', '');
INSERT INTO `sys_menu` VALUES (1588742925398171649, '基础服务', 0, 4, 'basicservice', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'server', 'admin', '2022-11-05 12:00:05', 'admin', '2022-11-05 12:00:05', '');
INSERT INTO `sys_menu` VALUES (1591655291324977153, '文件服务', 1588742925398171649, 2, 'file', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'clipboard', 'admin', '2022-11-13 12:52:48', 'admin', '2022-11-13 14:39:19', '');
INSERT INTO `sys_menu` VALUES (1591655913331871746, '配置管理', 1591655291324977153, 2, 'ossconfig', 'basicservice/oss/config', NULL, 1, 0, 'C', '0', '0', 'basicservice:oss:config:list', 'system', 'admin', '2022-11-13 12:55:16', 'admin', '2022-11-13 14:44:44', '');
INSERT INTO `sys_menu` VALUES (1591657525559414786, '配置查询', 1591655913331871746, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'basicservice:oss:config:query', '#', 'admin', '2022-11-13 13:01:40', 'admin', '2022-11-13 13:01:40', '');
INSERT INTO `sys_menu` VALUES (1591657626285625346, '配置删除', 1591655913331871746, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'basicservice:oss:config:remove', '#', 'admin', '2022-11-13 13:02:04', 'admin', '2022-11-13 13:02:04', '');
INSERT INTO `sys_menu` VALUES (1604042195666051072, '博客文章', 1604778822075994114, 1, 'article', 'blog/article/index', NULL, 1, 0, 'C', '0', '0', 'blog:article:list', 'form', 'admin', '2022-12-17 17:14:05', 'admin', '2022-12-19 18:01:37', '博客文章菜单');
INSERT INTO `sys_menu` VALUES (1604042195666051073, '博客文章查询', 1604042195666051072, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:query', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604042195666051074, '博客文章新增', 1604042195666051072, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:add', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604042195666051075, '博客文章修改', 1604042195666051072, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:edit', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604042195666051076, '博客文章删除', 1604042195666051072, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:remove', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604042195666051077, '博客文章导出', 1604042195666051072, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:export', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604778822075994114, '文章管理', 5, 1, 'article', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2022-12-19 18:01:01', 'admin', '2022-12-19 18:01:28', '');
INSERT INTO `sys_menu` VALUES (1605153186864795648, '博客分类', 1604778822075994114, 2, 'category', 'blog/category/index', NULL, 1, 0, 'C', '0', '0', 'blog:category:list', 'checkbox', 'admin', '2022-12-20 18:48:45', 'admin', '2022-12-20 19:30:58', '博客分类菜单');
INSERT INTO `sys_menu` VALUES (1605153186864795649, '博客分类查询', 1605153186864795648, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:query', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605153186864795650, '博客分类新增', 1605153186864795648, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:add', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605153186864795651, '博客分类修改', 1605153186864795648, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:edit', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605153186864795652, '博客分类删除', 1605153186864795648, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:remove', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605153186864795653, '博客分类导出', 1605153186864795648, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:export', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605160868417998848, '博客标签', 1604778822075994114, 3, 'tag', 'blog/tag/index', NULL, 1, 0, 'C', '0', '0', 'blog:tag:list', 'list', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:31:05', '博客标签菜单');
INSERT INTO `sys_menu` VALUES (1605160868417998849, '博客标签查询', 1605160868417998848, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:query', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:29', '');
INSERT INTO `sys_menu` VALUES (1605160868417998850, '博客标签新增', 1605160868417998848, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:add', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:35', '');
INSERT INTO `sys_menu` VALUES (1605160868417998851, '博客标签修改', 1605160868417998848, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:edit', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:41', '');
INSERT INTO `sys_menu` VALUES (1605160868417998852, '博客标签删除', 1605160868417998848, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:remove', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:46', '');
INSERT INTO `sys_menu` VALUES (1605160868417998853, '博客标签导出', 1605160868417998848, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:export', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:53', '');
INSERT INTO `sys_menu` VALUES (1609385420790530049, '业务管理', 0, 6, 'biz', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2023-01-01 11:06:00', 'admin', '2023-01-01 11:23:33', '');
INSERT INTO `sys_menu` VALUES (1609385690836598786, '财务管理', 1609385420790530049, 1, 'finance', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'money', 'admin', '2023-01-01 11:07:04', 'admin', '2023-01-01 11:07:04', '');
INSERT INTO `sys_menu` VALUES (1609386213455265792, 'ERP工程', 1609385690836598786, 1, 'erpproject', 'biz/finance/erpproject/index', NULL, 1, 0, 'C', '0', '0', 'biz:finance:erpproject:list', 'nested', 'admin', '2023-01-01 11:09:21', 'test', '2023-01-07 09:57:19', 'ERP工程明细菜单');
INSERT INTO `sys_menu` VALUES (1609386213455265793, 'ERP工程明细查询', 1609386213455265792, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:finance:erpproject:query', '#', 'admin', '2023-01-01 11:09:21', 'test', '2023-01-07 09:57:29', '');
INSERT INTO `sys_menu` VALUES (1609386213455265794, 'ERP工程明细新增', 1609386213455265792, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:finance:erpproject:add', '#', 'admin', '2023-01-01 11:09:21', 'test', '2023-01-07 09:57:35', '');
INSERT INTO `sys_menu` VALUES (1609386213455265795, 'ERP工程明细修改', 1609386213455265792, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:finance:erpproject:edit', '#', 'admin', '2023-01-01 11:09:21', 'test', '2023-01-07 09:57:43', '');
INSERT INTO `sys_menu` VALUES (1609386213455265796, 'ERP工程明细删除', 1609386213455265792, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:finance:erpproject:remove', '#', 'admin', '2023-01-01 11:09:21', 'test', '2023-01-07 09:58:08', '');
INSERT INTO `sys_menu` VALUES (1609386213455265797, 'ERP工程明细导出', 1609386213455265792, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:finance:erpproject:export', '#', 'admin', '2023-01-01 11:09:21', 'test', '2023-01-07 09:58:13', '');
INSERT INTO `sys_menu` VALUES (1609400747695906817, 'ERP工程明细导入', 1609386213455265792, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'biz:finance:erpproject:import', '#', 'admin', '2023-01-01 12:06:54', 'test', '2023-01-07 09:58:23', '');
INSERT INTO `sys_menu` VALUES (1609738660390871042, 'Kibana', 2, 11, 'http://1.117.176.57:5601', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:kibana:list', 'log', 'admin', '2023-01-02 10:29:39', 'admin', '2023-01-02 10:33:18', '');
INSERT INTO `sys_menu` VALUES (1609738937630171137, 'Skywalking', 2, 12, 'http://1.117.176.57:18080', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:skywalking:list', 'tree', 'admin', '2023-01-02 10:30:45', 'admin', '2023-01-02 10:33:46', '');
INSERT INTO `sys_menu` VALUES (1609739163833180161, 'Grafana', 2, 13, 'http://1.117.176.57:3000', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:grafana:list', 'system', 'admin', '2023-01-02 10:31:39', 'admin', '2023-01-02 10:31:39', '');
INSERT INTO `sys_menu` VALUES (1609739421833207810, 'Prometheus', 2, 14, 'http://1.117.176.57:9090', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:prometheus:list', 'system', 'admin', '2023-01-02 10:32:40', 'admin', '2023-01-02 10:32:40', '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `execution_time` bigint(0) NULL DEFAULT NULL COMMENT '执行时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1610941651170627586, 'ERP工程', 6, 'com.erahub.biz.finance.controller.BizFinanceERPProjectController.importData()', 'POST', 1, 'admin', '', '/financeERPProject/importData', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":[{\"projectId\":1,\"projectNumber\":\"8301306397\",\"requisitionNumber\":\"5500926332\",\"deviceName\":\"Ⅱ柴油加氢装置\",\"projectName\":\"外委：II柴加2021年大修换热器检维修项目\",\"planType\":\"大修\",\"department\":\"交换\",\"settlementReviewAmount\":\"446104.44\",\"contractNumber\":\"31700000-20-FW1703-0073-BG01\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":2,\"projectNumber\":\"8301559568\",\"requisitionNumber\":\"5501085980\",\"deviceName\":\"异丁烷装置\",\"projectName\":\"外委：C4异构化大修V1401等7台容器常规检修\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"2932.54\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":3,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"1808.53\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":4,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"10774.30\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":5,\"projectNumber\":\"8301667243\",\"requisitionNumber\":\"5501150412\",\"deviceName\":\"四空站\",\"projectName\":\"外委：公用工程气体工区三空站3#离心机电机维修\",\"planType\":\"月度\",\"department\":\"机修\",\"settlementReviewAmount\":\"1319.15\",\"contractNumber\":\"31700000-21-FW1703-0092\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":6,\"projectNumber\":\"8301601285\",\"requisitionNumber\":\"5501103306\",\"deviceName\":\"化工运行二部连续重整装置\",\"projectName\":\"外委：Ⅰ重整E204底等敞口导凝盲盖安装\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"9746.84\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":7,\"projectNumber\":\"8301616291\",\"requisitionNumber\":\"5501115733\",\"deviceName\":\"Ⅱ常减压装置\",\"projectName\":\"外委：Ⅱ常减压装置预热器底部排水管更换\",\"planType\":\"月度\",\"department\":\"管焊\",\"settlementReviewAmount\":\"4812.59\",\"contractNumber\":\"31700000-21-F', 0, '', '2023-01-05 18:09:54', 9);
INSERT INTO `sys_oper_log` VALUES (1610945031385387009, '操作日志', 5, 'com.erahub.base.system.controller.SysOperlogController.export()', 'POST', 1, 'admin', '', '/operlog/export', '127.0.0.1', '', '{\"operId\":null,\"title\":null,\"businessType\":null,\"businessTypes\":null,\"method\":null,\"requestMethod\":null,\"operatorType\":null,\"operName\":null,\"deptName\":null,\"operUrl\":null,\"operIp\":null,\"operParam\":null,\"jsonResult\":null,\"status\":null,\"errorMsg\":null,\"operTime\":null,\"executionTime\":null,\"params\":{}}', '', 0, '', '2023-01-05 18:23:20', 1076);
INSERT INTO `sys_oper_log` VALUES (1610945078642610177, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/user/resetPwd', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2023-01-05 18:23:31\",\"userId\":\"1588845214859759618\",\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-05 18:23:31', 91);
INSERT INTO `sys_oper_log` VALUES (1610945098624274433, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', '', '/user', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-11-05 18:46:33\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-05 18:23:36\",\"userId\":\"1588845214859759618\",\"deptId\":104,\"userName\":\"test\",\"nickName\":\"管理员\",\"userType\":\"sys_user\",\"email\":\"1234@sss.com\",\"phonenumber\":\"15712344556\",\"sex\":\"0\",\"avatar\":\"http://127.0.0.1:9000/erahub/2022/12/02/7029e494212e48a58aefad46e1bb4cc0.jpg\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":101,\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"orderNum\":2,\"leader\":\"erahub\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,101\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":\"1588844816627372034\",\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"1\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[\"1588844816627372034\",\"1588845036673142786\"],\"postIds\":[4],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-05 18:23:36', 56);
INSERT INTO `sys_oper_log` VALUES (1610945110544486402, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', '', '/user', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-11-05 18:46:33\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-05 18:23:38\",\"userId\":\"1588845214859759618\",\"deptId\":104,\"userName\":\"test\",\"nickName\":\"管理员\",\"userType\":\"sys_user\",\"email\":\"1234@sss.com\",\"phonenumber\":\"15712344556\",\"sex\":\"0\",\"avatar\":\"http://127.0.0.1:9000/erahub/2022/12/02/7029e494212e48a58aefad46e1bb4cc0.jpg\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":101,\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"orderNum\":2,\"leader\":\"erahub\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,101\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":\"1588844816627372034\",\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"1\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false},{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":\"1588845036673142786\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":\"1\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[\"1588844816627372034\"],\"postIds\":[4],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-05 18:23:39', 23);
INSERT INTO `sys_oper_log` VALUES (1610945143666905089, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-11-05 18:44:58\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-05 18:23:46\",\"roleId\":\"1588844816627372034\",\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"1\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,108,500,1040,1041,1042,501,1043,1044,1045,1050,2,109,1046,1047,1048,\"1570009901798481921\",\"1570010319794429953\",\"1570022388644143106\",113,111,110,112,\"1570758202780676098\",\"1572393811995209730\",3,114,115,1055,1056,1058,1057,1059,1060,\"1588077119135821826\",\"1588092486994432002\",\"1588742925398171649\",107,1036,1037,1038,1039,\"1591655291324977153\",118,1600,1601,1602,1603,\"1591655913331871746\",\"1591657525559414786\",1604,1605,\"1591657626285625346\",5,\"1604778822075994114\",\"1604042195666051072\",\"1604042195666051073\",\"1604042195666051074\",\"1604042195666051075\",\"1604042195666051076\",\"1604042195666051077\",\"1605153186864795648\",\"1605153186864795649\",\"1605153186864795650\",\"1605153186864795651\",\"1605153186864795652\",\"1605153186864795653\",\"1605160868417998848\",\"1605160868417998849\",\"1605160868417998850\",\"1605160868417998851\",\"1605160868417998852\",\"1605160868417998853\",\"1609385420790530049\",\"1609385690836598786\",\"1609386213455265792\",\"1609386213455265793\",\"1609386213455265794\",\"1609386213455265795\",\"1609386213455265796\",\"1609386213455265797\",\"1609400747695906817\"],\"deptIds\":null,\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-05 18:23:47', 52);
INSERT INTO `sys_oper_log` VALUES (1610945200751382530, 'ERP工程', 6, 'com.erahub.biz.finance.controller.BizFinanceERPProjectController.importData()', 'POST', 1, 'admin', '', '/financeERPProject/importData', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":[{\"projectId\":1,\"projectNumber\":\"8301306397\",\"requisitionNumber\":\"5500926332\",\"deviceName\":\"Ⅱ柴油加氢装置\",\"projectName\":\"外委：II柴加2021年大修换热器检维修项目\",\"planType\":\"大修\",\"department\":\"交换\",\"settlementReviewAmount\":\"446104.44\",\"contractNumber\":\"31700000-20-FW1703-0073-BG01\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":2,\"projectNumber\":\"8301559568\",\"requisitionNumber\":\"5501085980\",\"deviceName\":\"异丁烷装置\",\"projectName\":\"外委：C4异构化大修V1401等7台容器常规检修\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"2932.54\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":3,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"1808.53\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":4,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"10774.30\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":5,\"projectNumber\":\"8301667243\",\"requisitionNumber\":\"5501150412\",\"deviceName\":\"四空站\",\"projectName\":\"外委：公用工程气体工区三空站3#离心机电机维修\",\"planType\":\"月度\",\"department\":\"机修\",\"settlementReviewAmount\":\"1319.15\",\"contractNumber\":\"31700000-21-FW1703-0092\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":6,\"projectNumber\":\"8301601285\",\"requisitionNumber\":\"5501103306\",\"deviceName\":\"化工运行二部连续重整装置\",\"projectName\":\"外委：Ⅰ重整E204底等敞口导凝盲盖安装\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"9746.84\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":7,\"projectNumber\":\"8301616291\",\"requisitionNumber\":\"5501115733\",\"deviceName\":\"Ⅱ常减压装置\",\"projectName\":\"外委：Ⅱ常减压装置预热器底部排水管更换\",\"planType\":\"月度\",\"department\":\"管焊\",\"settlementReviewAmount\":\"4812.59\",\"contractNumber\":\"31700000-21-F', 0, '', '2023-01-05 18:24:00', 8);
INSERT INTO `sys_oper_log` VALUES (1610946193635414018, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'admin', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1610946193346084866\",\"categoryId\":\"1605159324440162305\",\"articleCover\":\"\",\"articleTitle\":\"sss\",\"articleContent\":\"ss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-05 18:27:57', 49);
INSERT INTO `sys_oper_log` VALUES (1610946209158533121, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'admin', '', '/article/1610946193346084866', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-05 18:28:01', 37);
INSERT INTO `sys_oper_log` VALUES (1610946237377810433, '博客文章', 3, 'com.erahub.blog.controller.BlogArticleController.remove()', 'DELETE', 1, 'admin', '', '/article/remove/1610946193346084866', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-05 18:28:08', 9);
INSERT INTO `sys_oper_log` VALUES (1610946325550469121, '博客分类', 2, 'com.erahub.blog.controller.BlogCategoryController.edit()', 'PUT', 1, 'admin', '', '/category', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-20 19:41:54\",\"updateBy\":null,\"updateTime\":null,\"categoryId\":\"1605166598017581057\",\"categoryName\":\"Mysql\",\"status\":\"0\",\"remark\":\"Mysql\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-05 18:28:29', 6);
INSERT INTO `sys_oper_log` VALUES (1610946500062875649, 'ERP工程', 6, 'com.erahub.biz.finance.controller.BizFinanceERPProjectController.importData()', 'POST', 1, 'admin', '', '/financeERPProject/importData', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":[{\"projectId\":1,\"projectNumber\":\"8301306397\",\"requisitionNumber\":\"5500926332\",\"deviceName\":\"Ⅱ柴油加氢装置\",\"projectName\":\"外委：II柴加2021年大修换热器检维修项目\",\"planType\":\"大修\",\"department\":\"交换\",\"settlementReviewAmount\":\"446104.44\",\"contractNumber\":\"31700000-20-FW1703-0073-BG01\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":2,\"projectNumber\":\"8301559568\",\"requisitionNumber\":\"5501085980\",\"deviceName\":\"异丁烷装置\",\"projectName\":\"外委：C4异构化大修V1401等7台容器常规检修\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"2932.54\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":3,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"1808.53\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":4,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"10774.30\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":5,\"projectNumber\":\"8301667243\",\"requisitionNumber\":\"5501150412\",\"deviceName\":\"四空站\",\"projectName\":\"外委：公用工程气体工区三空站3#离心机电机维修\",\"planType\":\"月度\",\"department\":\"机修\",\"settlementReviewAmount\":\"1319.15\",\"contractNumber\":\"31700000-21-FW1703-0092\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":6,\"projectNumber\":\"8301601285\",\"requisitionNumber\":\"5501103306\",\"deviceName\":\"化工运行二部连续重整装置\",\"projectName\":\"外委：Ⅰ重整E204底等敞口导凝盲盖安装\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"9746.84\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":7,\"projectNumber\":\"8301616291\",\"requisitionNumber\":\"5501115733\",\"deviceName\":\"Ⅱ常减压装置\",\"projectName\":\"外委：Ⅱ常减压装置预热器底部排水管更换\",\"planType\":\"月度\",\"department\":\"管焊\",\"settlementReviewAmount\":\"4812.59\",\"contractNumber\":\"31700000-21-F', 0, '', '2023-01-05 18:29:10', 108);
INSERT INTO `sys_oper_log` VALUES (1610946587149209601, 'ERP工程', 5, 'com.erahub.biz.finance.controller.BizFinanceERPProjectController.export()', 'POST', 1, 'admin', '', '/financeERPProject/export', '127.0.0.1', '', '[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"projectId\":1,\"projectNumber\":\"8301306397\",\"requisitionNumber\":\"5500926332\",\"deviceName\":\"Ⅱ柴油加氢装置\",\"projectName\":\"外委：II柴加2021年大修换热器检维修项目\",\"planType\":\"大修\",\"department\":\"交换\",\"settlementReviewAmount\":\"446104.44\",\"contractNumber\":\"31700000-20-FW1703-0073-BG01\",\"projectType\":\"股份\",\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"projectId\":2,\"projectNumber\":\"8301559568\",\"requisitionNumber\":\"5501085980\",\"deviceName\":\"异丁烷装置\",\"projectName\":\"外委：C4异构化大修V1401等7台容器常规检修\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"2932.54\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"projectId\":3,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"1808.53\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"projectId\":4,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"10774.30\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"projectId\":5,\"projectNumber\":\"8301667243\",\"requisitionNumber\":\"5501150412\",\"deviceName\":\"四空站\",\"projectName\":\"外委：公用工程气体工区三空站3#离心机电机维修\",\"planType\":\"月度\",\"department\":\"机修\",\"settlementReviewAmount\":\"1319.15\",\"contractNumber\":\"31700000-21-FW1703-0092\",\"projectType\":\"股份\",\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"projectId\":6,\"projectNumber\":\"8301601285\",\"requisitionNumber\":\"5501103306\",\"deviceName\":\"化工运行二部连续重整装置\",\"projectName\":\"外委：Ⅰ重整E204底等敞口导凝盲盖安装\",\"plan', '', 0, '', '2023-01-05 18:29:31', 936);
INSERT INTO `sys_oper_log` VALUES (1610947556285091841, 'ERP工程', 5, 'com.erahub.biz.finance.controller.BizFinanceERPProjectController.export()', 'POST', 1, 'admin', '', '/financeERPProject/export', '127.0.0.1', '', '[]', '', 0, '', '2023-01-05 18:33:22', 27);
INSERT INTO `sys_oper_log` VALUES (1610947599029243906, '个人信息', 2, 'com.erahub.base.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '', '/user/profile', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-05 18:33:32\",\"userId\":1,\"deptId\":null,\"userName\":null,\"nickName\":\"erahub\",\"userType\":\"sys_user\",\"email\":\"123456@163.com\",\"phonenumber\":\"13912345678\",\"sex\":\"0\",\"avatar\":null,\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"loginDate\":\"2022-09-10 17:10:48\",\"remark\":\"管理员\",\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":101,\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"orderNum\":1,\"leader\":\"erahub\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,101\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":1,\"roleName\":\"超级管理员\",\"roleKey\":\"admin\",\"roleSort\":1,\"dataScope\":\"1\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":true}],\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":true}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-05 18:33:32', 15);
INSERT INTO `sys_oper_log` VALUES (1610948441237098497, '登录日志', 5, 'com.erahub.base.system.controller.SysLogininforController.export()', 'POST', 1, 'admin', '', '/logininfor/export', '127.0.0.1', '', '{\"infoId\":null,\"userName\":null,\"status\":null,\"ipaddr\":null,\"loginLocation\":null,\"browser\":null,\"os\":null,\"msg\":null,\"accessTime\":null,\"params\":{}}', '', 0, '', '2023-01-05 18:36:53', 119);
INSERT INTO `sys_oper_log` VALUES (1611306151472271361, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:18:17\",\"parentName\":null,\"parentId\":\"1609385690836598786\",\"children\":[],\"menuId\":\"1609386213455265792\",\"menuName\":\"ERP工程\",\"orderNum\":1,\"path\":\"eRPProject\",\"component\":\"biz/finance/eRPProject/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:eRPProject:list\",\"icon\":\"nested\",\"remark\":\"ERP工程明细菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:18:18', 31);
INSERT INTO `sys_oper_log` VALUES (1611306244741009410, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:18:40\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265793\",\"menuName\":\"ERP工程明细查询\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:eRPProject:query\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:18:40', 14);
INSERT INTO `sys_oper_log` VALUES (1611306270124937218, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:18:46\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265794\",\"menuName\":\"ERP工程明细新增\",\"orderNum\":2,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:eRPProject:add\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:18:46', 8);
INSERT INTO `sys_oper_log` VALUES (1611306313561149441, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:18:56\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265795\",\"menuName\":\"ERP工程明细修改\",\"orderNum\":3,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:eRPProject:edit\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:18:56', 11);
INSERT INTO `sys_oper_log` VALUES (1611306344649330689, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:19:03\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265796\",\"menuName\":\"ERP工程明细删除\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:eRPProject:remove\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:19:04', 7);
INSERT INTO `sys_oper_log` VALUES (1611306377473953794, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:19:11\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265797\",\"menuName\":\"ERP工程明细导出\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:eRPProject:export\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:19:12', 13);
INSERT INTO `sys_oper_log` VALUES (1611306403059208194, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 12:06:54\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:19:17\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609400747695906817\",\"menuName\":\"ERP工程明细导入\",\"orderNum\":6,\"path\":\"\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:eRPProject:import\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:19:18', 6);
INSERT INTO `sys_oper_log` VALUES (1611307546141265922, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:23:50\",\"parentName\":null,\"parentId\":\"1609385690836598786\",\"children\":[],\"menuId\":\"1609386213455265792\",\"menuName\":\"ERP工程\",\"orderNum\":1,\"path\":\"financeERPProject\",\"component\":\"biz/financeERPProject/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:financeERPProject:list\",\"icon\":\"nested\",\"remark\":\"ERP工程明细菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:23:50', 15);
INSERT INTO `sys_oper_log` VALUES (1611307580350009345, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:23:58\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265793\",\"menuName\":\"ERP工程明细查询\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:financeERPProject:query\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:23:58', 13);
INSERT INTO `sys_oper_log` VALUES (1611307606765735938, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:24:04\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265794\",\"menuName\":\"ERP工程明细新增\",\"orderNum\":2,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:financeERPProject:add\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:24:05', 7);
INSERT INTO `sys_oper_log` VALUES (1611307634943070209, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:24:11\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265795\",\"menuName\":\"ERP工程明细修改\",\"orderNum\":3,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:financeERPProject:edit\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:24:11', 13);
INSERT INTO `sys_oper_log` VALUES (1611307662189268994, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:24:17\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265796\",\"menuName\":\"ERP工程明细删除\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:financeERPProject:remove\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:24:18', 12);
INSERT INTO `sys_oper_log` VALUES (1611307705260576770, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:24:28\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265796\",\"menuName\":\"ERP工程明细删除\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:financeERPProject:remove\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:24:28', 6);
INSERT INTO `sys_oper_log` VALUES (1611307763318132738, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:24:42\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265797\",\"menuName\":\"ERP工程明细导出\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:financeERPProject:export\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:24:42', 12);
INSERT INTO `sys_oper_log` VALUES (1611307801708597250, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 12:06:54\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:24:51\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609400747695906817\",\"menuName\":\"ERP工程明细导入\",\"orderNum\":6,\"path\":\"\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:financeERPProject:import\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:24:51', 12);
INSERT INTO `sys_oper_log` VALUES (1611307909388963842, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-11-05 18:44:58\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-06 18:25:16\",\"roleId\":\"1588844816627372034\",\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"1\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,108,500,1040,1041,1042,501,1043,1044,1045,1050,2,109,1046,1047,1048,\"1570009901798481921\",\"1570010319794429953\",\"1570022388644143106\",113,111,110,112,\"1570758202780676098\",\"1572393811995209730\",\"1609738660390871042\",\"1609738937630171137\",\"1609739163833180161\",\"1609739421833207810\",3,114,115,1055,1056,1058,1057,1059,1060,\"1588077119135821826\",\"1588092486994432002\",\"1588742925398171649\",107,1036,1037,1038,1039,\"1591655291324977153\",118,1600,1601,1602,1603,\"1591655913331871746\",\"1591657525559414786\",1604,1605,\"1591657626285625346\",5,\"1604778822075994114\",\"1604042195666051072\",\"1604042195666051073\",\"1604042195666051074\",\"1604042195666051075\",\"1604042195666051076\",\"1604042195666051077\",\"1605153186864795648\",\"1605153186864795649\",\"1605153186864795650\",\"1605153186864795651\",\"1605153186864795652\",\"1605153186864795653\",\"1605160868417998848\",\"1605160868417998849\",\"1605160868417998850\",\"1605160868417998851\",\"1605160868417998852\",\"1605160868417998853\",\"1609385420790530049\",\"1609385690836598786\",\"1609386213455265792\",\"1609386213455265793\",\"1609386213455265794\",\"1609386213455265795\",\"1609386213455265796\",\"1609386213455265797\",\"1609400747695906817\"],\"deptIds\":null,\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-06 18:25:17', 101);
INSERT INTO `sys_oper_log` VALUES (1611308006864588801, 'ERP工程', 6, 'com.erahub.biz.finance.controller.BizFinanceERPProjectController.importData()', 'POST', 1, 'test', '', '/financeERPProject/importData', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":[{\"projectId\":1,\"projectNumber\":\"8301306397\",\"requisitionNumber\":\"5500926332\",\"deviceName\":\"Ⅱ柴油加氢装置\",\"projectName\":\"外委：II柴加2021年大修换热器检维修项目\",\"planType\":\"大修\",\"department\":\"交换\",\"settlementReviewAmount\":\"446104.44\",\"contractNumber\":\"31700000-20-FW1703-0073-BG01\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":2,\"projectNumber\":\"8301559568\",\"requisitionNumber\":\"5501085980\",\"deviceName\":\"异丁烷装置\",\"projectName\":\"外委：C4异构化大修V1401等7台容器常规检修\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"2932.54\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":3,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"1808.53\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":4,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"10774.30\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":5,\"projectNumber\":\"8301667243\",\"requisitionNumber\":\"5501150412\",\"deviceName\":\"四空站\",\"projectName\":\"外委：公用工程气体工区三空站3#离心机电机维修\",\"planType\":\"月度\",\"department\":\"机修\",\"settlementReviewAmount\":\"1319.15\",\"contractNumber\":\"31700000-21-FW1703-0092\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":6,\"projectNumber\":\"8301601285\",\"requisitionNumber\":\"5501103306\",\"deviceName\":\"化工运行二部连续重整装置\",\"projectName\":\"外委：Ⅰ重整E204底等敞口导凝盲盖安装\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"9746.84\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":7,\"projectNumber\":\"8301616291\",\"requisitionNumber\":\"5501115733\",\"deviceName\":\"Ⅱ常减压装置\",\"projectName\":\"外委：Ⅱ常减压装置预热器底部排水管更换\",\"planType\":\"月度\",\"department\":\"管焊\",\"settlementReviewAmount\":\"4812.59\",\"contractNumber\":\"31700000-21-F', 0, '', '2023-01-06 18:25:40', 381);
INSERT INTO `sys_oper_log` VALUES (1611308769812680706, 'ERP工程', 6, 'com.erahub.biz.finance.controller.BizFinanceERPProjectController.importData()', 'POST', 1, 'test', '', '/financeERPProject/importData', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":[{\"projectId\":1,\"projectNumber\":\"8301306397\",\"requisitionNumber\":\"5500926332\",\"deviceName\":\"Ⅱ柴油加氢装置\",\"projectName\":\"外委：II柴加2021年大修换热器检维修项目\",\"planType\":\"大修\",\"department\":\"交换\",\"settlementReviewAmount\":\"446104.44\",\"contractNumber\":\"31700000-20-FW1703-0073-BG01\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":2,\"projectNumber\":\"8301559568\",\"requisitionNumber\":\"5501085980\",\"deviceName\":\"异丁烷装置\",\"projectName\":\"外委：C4异构化大修V1401等7台容器常规检修\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"2932.54\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":3,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"1808.53\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":4,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"10774.30\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":5,\"projectNumber\":\"8301667243\",\"requisitionNumber\":\"5501150412\",\"deviceName\":\"四空站\",\"projectName\":\"外委：公用工程气体工区三空站3#离心机电机维修\",\"planType\":\"月度\",\"department\":\"机修\",\"settlementReviewAmount\":\"1319.15\",\"contractNumber\":\"31700000-21-FW1703-0092\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":6,\"projectNumber\":\"8301601285\",\"requisitionNumber\":\"5501103306\",\"deviceName\":\"化工运行二部连续重整装置\",\"projectName\":\"外委：Ⅰ重整E204底等敞口导凝盲盖安装\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"9746.84\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":7,\"projectNumber\":\"8301616291\",\"requisitionNumber\":\"5501115733\",\"deviceName\":\"Ⅱ常减压装置\",\"projectName\":\"外委：Ⅱ常减压装置预热器底部排水管更换\",\"planType\":\"月度\",\"department\":\"管焊\",\"settlementReviewAmount\":\"4812.59\",\"contractNumber\":\"31700000-21-F', 0, '', '2023-01-06 18:28:42', 303);
INSERT INTO `sys_oper_log` VALUES (1611542462124826626, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'test', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 09:57:18\",\"parentName\":null,\"parentId\":\"1609385690836598786\",\"children\":[],\"menuId\":\"1609386213455265792\",\"menuName\":\"ERP工程\",\"orderNum\":1,\"path\":\"erpproject\",\"component\":\"biz/finance/erpproject/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:erpproject:list\",\"icon\":\"nested\",\"remark\":\"ERP工程明细菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:57:19', 31);
INSERT INTO `sys_oper_log` VALUES (1611542506135658497, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'test', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 09:57:29\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265793\",\"menuName\":\"ERP工程明细查询\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:erpproject:query\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:57:29', 7);
INSERT INTO `sys_oper_log` VALUES (1611542532542996481, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'test', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 09:57:35\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265794\",\"menuName\":\"ERP工程明细新增\",\"orderNum\":2,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:erpproject:add\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:57:35', 7);
INSERT INTO `sys_oper_log` VALUES (1611542563148832769, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'test', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 09:57:42\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265795\",\"menuName\":\"ERP工程明细修改\",\"orderNum\":3,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:erpproject:edit\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:57:43', 7);
INSERT INTO `sys_oper_log` VALUES (1611542667540865026, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'test', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 09:58:07\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265796\",\"menuName\":\"ERP工程明细删除\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:erpproject:remove\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:58:08', 5);
INSERT INTO `sys_oper_log` VALUES (1611542691607781377, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'test', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 11:09:21\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 09:58:13\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609386213455265797\",\"menuName\":\"ERP工程明细导出\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:erpproject:export\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:58:13', 8);
INSERT INTO `sys_oper_log` VALUES (1611542732732932097, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'test', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 12:06:54\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 09:58:23\",\"parentName\":null,\"parentId\":\"1609386213455265792\",\"children\":[],\"menuId\":\"1609400747695906817\",\"menuName\":\"ERP工程明细导入\",\"orderNum\":6,\"path\":\"\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"biz:finance:erpproject:import\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:58:23', 13);
INSERT INTO `sys_oper_log` VALUES (1611542815213920258, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.edit()', 'PUT', 1, 'test', '', '/role', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-11-05 18:44:58\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 09:58:42\",\"roleId\":\"1588844816627372034\",\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"1\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,108,500,1040,1041,1042,501,1043,1044,1045,1050,2,109,1046,1047,1048,\"1570009901798481921\",\"1570010319794429953\",\"1570022388644143106\",113,111,110,112,\"1570758202780676098\",\"1572393811995209730\",\"1609738660390871042\",\"1609738937630171137\",\"1609739163833180161\",\"1609739421833207810\",3,114,115,1055,1056,1058,1057,1059,1060,\"1588077119135821826\",\"1588092486994432002\",\"1588742925398171649\",107,1036,1037,1038,1039,\"1591655291324977153\",118,1600,1601,1602,1603,\"1591655913331871746\",\"1591657525559414786\",1604,1605,\"1591657626285625346\",5,\"1604778822075994114\",\"1604042195666051072\",\"1604042195666051073\",\"1604042195666051074\",\"1604042195666051075\",\"1604042195666051076\",\"1604042195666051077\",\"1605153186864795648\",\"1605153186864795649\",\"1605153186864795650\",\"1605153186864795651\",\"1605153186864795652\",\"1605153186864795653\",\"1605160868417998848\",\"1605160868417998849\",\"1605160868417998850\",\"1605160868417998851\",\"1605160868417998852\",\"1605160868417998853\",\"1609385420790530049\",\"1609385690836598786\",\"1609386213455265792\",\"1609386213455265793\",\"1609386213455265794\",\"1609386213455265795\",\"1609386213455265796\",\"1609386213455265797\",\"1609400747695906817\"],\"deptIds\":null,\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:58:43', 117);
INSERT INTO `sys_oper_log` VALUES (1611542861179297794, 'ERP工程', 6, 'com.erahub.biz.finance.controller.FinanceERPProjectController.importData()', 'POST', 1, 'test', '', '/finance/erpproject/importData', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":[{\"projectId\":1,\"projectNumber\":\"8301306397\",\"requisitionNumber\":\"5500926332\",\"deviceName\":\"Ⅱ柴油加氢装置\",\"projectName\":\"外委：II柴加2021年大修换热器检维修项目\",\"planType\":\"大修\",\"department\":\"交换\",\"settlementReviewAmount\":\"446104.44\",\"contractNumber\":\"31700000-20-FW1703-0073-BG01\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":2,\"projectNumber\":\"8301559568\",\"requisitionNumber\":\"5501085980\",\"deviceName\":\"异丁烷装置\",\"projectName\":\"外委：C4异构化大修V1401等7台容器常规检修\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"2932.54\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":3,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"1808.53\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":4,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"10774.30\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":5,\"projectNumber\":\"8301667243\",\"requisitionNumber\":\"5501150412\",\"deviceName\":\"四空站\",\"projectName\":\"外委：公用工程气体工区三空站3#离心机电机维修\",\"planType\":\"月度\",\"department\":\"机修\",\"settlementReviewAmount\":\"1319.15\",\"contractNumber\":\"31700000-21-FW1703-0092\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":6,\"projectNumber\":\"8301601285\",\"requisitionNumber\":\"5501103306\",\"deviceName\":\"化工运行二部连续重整装置\",\"projectName\":\"外委：Ⅰ重整E204底等敞口导凝盲盖安装\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"9746.84\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":7,\"projectNumber\":\"8301616291\",\"requisitionNumber\":\"5501115733\",\"deviceName\":\"Ⅱ常减压装置\",\"projectName\":\"外委：Ⅱ常减压装置预热器底部排水管更换\",\"planType\":\"月度\",\"department\":\"管焊\",\"settlementReviewAmount\":\"4812.59\",\"contractNumber\":\"31700000-21-F', 0, '', '2023-01-07 09:58:54', 320);
INSERT INTO `sys_oper_log` VALUES (1611542904422572033, 'ERP工程', 1, 'com.erahub.biz.finance.controller.FinanceERPProjectController.add()', 'POST', 1, 'test', '', '/finance/erpproject', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"projectId\":\"1611542904347131905\",\"projectNumber\":\"ss\",\"requisitionNumber\":\"ss\",\"deviceName\":null,\"projectName\":null,\"planType\":null,\"department\":null,\"settlementReviewAmount\":null,\"contractNumber\":null,\"projectType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:59:04', 48);
INSERT INTO `sys_oper_log` VALUES (1611542931903651842, 'ERP工程', 2, 'com.erahub.biz.finance.controller.FinanceERPProjectController.edit()', 'PUT', 1, 'test', '', '/finance/erpproject', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"projectId\":\"1611542904347131905\",\"projectNumber\":\"ss\",\"requisitionNumber\":\"ss\",\"deviceName\":\"sss\",\"projectName\":\"ss\",\"planType\":null,\"department\":null,\"settlementReviewAmount\":null,\"contractNumber\":null,\"projectType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:59:11', 19);
INSERT INTO `sys_oper_log` VALUES (1611542941609271298, 'ERP工程', 3, 'com.erahub.biz.finance.controller.FinanceERPProjectController.remove()', 'DELETE', 1, 'test', '', '/finance/erpproject/1611542904347131905', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 09:59:13', 18);
INSERT INTO `sys_oper_log` VALUES (1611542974819770369, '数据库文档', 5, 'com.erahub.base.tool.controller.ToDatabaseDocController.exportHtml()', 'GET', 1, 'test', '', '/db-doc/export-html', '127.0.0.1', '', '{}', '', 0, '', '2023-01-07 09:59:21', 246);
INSERT INTO `sys_oper_log` VALUES (1611543176700010497, '代码生成', 3, 'com.erahub.base.tool.controller.ToGenController.remove()', 'DELETE', 1, 'test', '', '/gen/1605139861988806657', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:00:09', 18);
INSERT INTO `sys_oper_log` VALUES (1611543204885733377, '代码生成', 6, 'com.erahub.base.tool.controller.ToGenController.importTableSave()', 'POST', 1, 'test', '', '/gen/importTable', '127.0.0.1', '', '\"sys_oper_log\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:00:16', 39);
INSERT INTO `sys_oper_log` VALUES (1611543216248102914, '代码生成', 2, 'com.erahub.base.tool.controller.ToGenController.synchDb()', 'GET', 1, 'test', '', '/gen/synchDb/sys_oper_log', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:00:18', 50);
INSERT INTO `sys_oper_log` VALUES (1611543225299410946, '代码生成', 3, 'com.erahub.base.tool.controller.ToGenController.remove()', 'DELETE', 1, 'test', '', '/gen/1611543204759904258', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:00:21', 8);
INSERT INTO `sys_oper_log` VALUES (1611543384510996481, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.edit()', 'PUT', 1, 'test', '', '/role', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-11-05 18:44:58\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 10:00:58\",\"roleId\":\"1588844816627372034\",\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"1\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,108,500,1040,1041,1042,501,1043,1044,1045,1050,2,109,1046,1047,1048,\"1570009901798481921\",\"1570010319794429953\",\"1570022388644143106\",113,111,110,112,\"1570758202780676098\",\"1572393811995209730\",\"1609738660390871042\",\"1609738937630171137\",\"1609739163833180161\",\"1609739421833207810\",3,114,115,1055,1056,1058,1057,1059,1060,\"1588077119135821826\",\"1588092486994432002\",\"1588742925398171649\",107,1036,1037,1038,1039,\"1591655291324977153\",118,1600,1601,1602,1603,\"1591655913331871746\",\"1591657525559414786\",1604,1605,\"1591657626285625346\",5,\"1604778822075994114\",\"1604042195666051072\",\"1604042195666051073\",\"1604042195666051074\",\"1604042195666051075\",\"1604042195666051076\",\"1604042195666051077\",\"1605153186864795648\",\"1605153186864795649\",\"1605153186864795650\",\"1605153186864795651\",\"1605153186864795652\",\"1605153186864795653\",\"1605160868417998848\",\"1605160868417998849\",\"1605160868417998850\",\"1605160868417998851\",\"1605160868417998852\",\"1605160868417998853\",\"1609385420790530049\",\"1609385690836598786\",\"1609386213455265792\",\"1609386213455265793\",\"1609386213455265794\",\"1609386213455265795\",\"1609386213455265796\",\"1609386213455265797\",\"1609400747695906817\"],\"deptIds\":null,\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:00:59', 32);
INSERT INTO `sys_oper_log` VALUES (1611543765802590210, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-11-05 18:44:58\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-07 10:02:29\",\"roleId\":\"1588844816627372034\",\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"1\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,108,500,1040,1041,1042,501,1043,1044,1045,1050,2,109,1046,1047,1048,\"1570009901798481921\",\"1570010319794429953\",\"1570022388644143106\",113,111,110,112,\"1570758202780676098\",\"1572393811995209730\",\"1609738660390871042\",\"1609738937630171137\",\"1609739163833180161\",\"1609739421833207810\",3,114,115,1055,1056,1058,1057,1059,1060,\"1588077119135821826\",\"1588092486994432002\",\"1588742925398171649\",107,1036,1037,1038,1039,\"1591655291324977153\",118,1600,1601,1602,1603,\"1591655913331871746\",\"1591657525559414786\",1604,1605,\"1591657626285625346\",5,\"1604778822075994114\",\"1604042195666051072\",\"1604042195666051073\",\"1604042195666051074\",\"1604042195666051075\",\"1604042195666051076\",\"1604042195666051077\",\"1605153186864795648\",\"1605153186864795649\",\"1605153186864795650\",\"1605153186864795651\",\"1605153186864795652\",\"1605153186864795653\",\"1605160868417998848\",\"1605160868417998849\",\"1605160868417998850\",\"1605160868417998851\",\"1605160868417998852\",\"1605160868417998853\",\"1609385420790530049\",\"1609385690836598786\",\"1609386213455265792\",\"1609386213455265793\",\"1609386213455265794\",\"1609386213455265795\",\"1609386213455265796\",\"1609386213455265797\",\"1609400747695906817\"],\"deptIds\":null,\"permissions\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:02:29', 35);
INSERT INTO `sys_oper_log` VALUES (1611543811520503810, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', '', '/user', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-11-05 18:46:33\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-07 10:02:40\",\"userId\":\"1588845214859759618\",\"deptId\":104,\"userName\":\"test\",\"nickName\":\"管理员\",\"userType\":\"sys_user\",\"email\":\"1234@sss.com\",\"phonenumber\":\"15712344556\",\"sex\":\"0\",\"avatar\":\"http://127.0.0.1:9000/erahub/2022/12/02/7029e494212e48a58aefad46e1bb4cc0.jpg\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":101,\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"orderNum\":2,\"leader\":\"erahub\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,101\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":\"1588844816627372034\",\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"1\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"permissions\":null,\"admin\":false}],\"roleIds\":[\"1588844816627372034\"],\"postIds\":[4],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:02:40', 33);
INSERT INTO `sys_oper_log` VALUES (1611544738033868802, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-07 10:06:21\",\"parentName\":null,\"parentId\":115,\"children\":[],\"menuId\":1055,\"menuName\":\"生成查询\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"tool:gen:query\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:06:21', 9);
INSERT INTO `sys_oper_log` VALUES (1611545090187632642, '代码生成', 2, 'com.erahub.base.tool.controller.ToGenController.editSave()', 'PUT', 1, 'test', '', '/gen', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 10:07:45\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1609385690836598786\"},\"tableId\":\"1609381755329544193\",\"tableName\":\"biz_finance_erp_project\",\"tableComment\":\"ERP工程明细表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"FinanceERPProject\",\"tplCategory\":\"crud\",\"packageName\":\"com.erahub.business.finance\",\"moduleName\":\"business\",\"businessName\":\"finance:erpproject\",\"functionName\":\"ERP工程明细\",\"functionAuthor\":\"erahub\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"subTable\":null,\"columns\":[{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 10:51:26\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 10:07:45\",\"columnId\":\"1609381755354710018\",\"tableId\":\"1609381755329544193\",\"columnName\":\"project_id\",\"columnComment\":\"ERP工程ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"projectId\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":false,\"list\":true,\"pk\":true,\"superColumn\":false,\"usableColumn\":false,\"edit\":true,\"insert\":true,\"capJavaField\":\"ProjectId\",\"increment\":false,\"query\":false},{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 10:51:26\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 10:07:45\",\"columnId\":\"1609381755405041666\",\"tableId\":\"1609381755329544193\",\"columnName\":\"project_number\",\"columnComment\":\"ERP工单号\",\"columnType\":\"varchar(50)\",\"javaType\":\"String\",\"javaField\":\"projectNumber\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"superColumn\":false,\"usableColumn\":false,\"edit\":true,\"insert\":true,\"capJavaField\":\"ProjectNumber\",\"increment\":false,\"query\":true},{\"createBy\":\"admin\",\"createTime\":\"2023-01-01 10:51:26\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 10:07:45\",\"columnId\":\"1609381755405041667\",\"tab', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:07:45', 24);
INSERT INTO `sys_oper_log` VALUES (1611547178426736642, 'ERP工程', 1, 'com.erahub.biz.finance.controller.FinanceERPProjectController.add()', 'POST', 1, 'test', '', '/finance/erpproject', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"projectId\":\"1611547177915056130\",\"projectNumber\":\"s\",\"requisitionNumber\":\"sss\",\"deviceName\":null,\"projectName\":null,\"planType\":null,\"department\":null,\"settlementReviewAmount\":null,\"contractNumber\":null,\"projectType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:16:03', 42);
INSERT INTO `sys_oper_log` VALUES (1611547185347338242, 'ERP工程', 3, 'com.erahub.biz.finance.controller.FinanceERPProjectController.remove()', 'DELETE', 1, 'test', '', '/finance/erpproject/1611547177915056130', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 10:16:05', 15);
INSERT INTO `sys_oper_log` VALUES (1611560300948529153, '博客文章', 5, 'com.erahub.blog.controller.BlogArticleController.export()', 'POST', 1, 'test', '', '/article/export', '127.0.0.1', '', '{\"createBy\":\"t\",\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":null,\"categoryId\":null,\"articleCover\":null,\"articleTitle\":null,\"articleContent\":null,\"isTop\":null,\"isFeatured\":null,\"isDelete\":\"0\",\"status\":null,\"type\":null,\"originalUrl\":null,\"tagIds\":null}', '', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\r\n### The error may exist in com/erahub/blog/mapper/BlogArticleMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT article_id, category_id, article_cover, article_title, article_content, is_top, is_featured, is_delete, status, type, password, original_url, blog_category, blog_tag_list, create_by, create_time, update_by, update_time FROM blog_article WHERE (create_by LIKE ? AND is_delete = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'', '2023-01-07 11:08:12', 31);
INSERT INTO `sys_oper_log` VALUES (1611560305474183170, '博客文章', 5, 'com.erahub.blog.controller.BlogArticleController.export()', 'POST', 1, 'test', '', '/article/export', '127.0.0.1', '', '{\"createBy\":\"t\",\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":null,\"categoryId\":null,\"articleCover\":null,\"articleTitle\":null,\"articleContent\":null,\"isTop\":null,\"isFeatured\":null,\"isDelete\":\"0\",\"status\":null,\"type\":null,\"originalUrl\":null,\"tagIds\":null}', '', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\r\n### The error may exist in com/erahub/blog/mapper/BlogArticleMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  article_id,category_id,article_cover,article_title,article_content,is_top,is_featured,is_delete,status,type,password,original_url,blog_category,blog_tag_list,create_by,create_time,update_by,update_time  FROM blog_article     WHERE (create_by LIKE ? AND is_delete = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'', '2023-01-07 11:08:13', 3);
INSERT INTO `sys_oper_log` VALUES (1611577131620933633, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-17 18:25:43\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 19:10:23\",\"articleId\":\"1604060262542467074\",\"categoryId\":\"1605166598017581057\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2022/12/02/4cc68162eeff43d88b1b751adde1bb95.jpg\",\"articleTitle\":\"docker入门\",\"articleContent\":\"#  1.docker概述\\n\\n## 1.1 基本介绍\\n\\nDocker 是一个开源的应用容器引擎，基于 Go 语言 并遵从 Apache2.0 协议开源。\\n\\nDocker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。\\n\\n容器是完全使用沙箱机制，相互之间不会有任何接口,更重要的是容器性能开销极低。\\n\\nDocker 从 17.03 版本之后分为 CE（Community Edition: 社区版） 和 EE（Enterprise Edition: 企业版），我们用社区版就可以了。[官网](https://docs.docker.com/)\\n\\n##  1.2 应用场景\\n\\n1. Web 应用的自动化打包和发布。\\n\\n2. 自动化测试和持续集成、发布。\\n\\n3. 在服务型环境中部署和调整数据库或其他的后台应用。\\n\\n4. 从头编译或者扩展现有的 Openshellift 或 Cloud Foundry 平台来搭建自己的 PaaS 环境。\\n\\n## 1.3 docker 的优势\\n\\nDocker 是一个用于开发，交付和运行应用程序的开放平台。Docker 使您能够将应用程序与基础架构分开，从而可以快速交付软件。借助 Docker，您可以与管理应用程序相同的方式来管理基础架构。通过利用 Docker 的方法来快速交付，测试和部署代码，您可以大大减少编写代码和在生产环境中运行代码之间的延迟。\\n\\n1. 快速，一致地交付您的应用程序。Docker 允许开发人员使用您提供的应用程序或服务的本地容器在标准化环境中工作，从而简化了开发的生命周期。\\n\\n容器非常适合持续集成和持续交付（CI / CD）工作流程，请考虑以下示例方案：\\n\\n您的开发人员在本地编写代码，并使用 Docker 容器与同事共享他们的工作。\\n他们使用 Docker 将其应用程序推送到测试环境中，并执行自动或手动测试。\\n当开发人员发现错误时，他们可以在开发环境中对其进行修复，然后将其重新部署到测试环境中，以进行测试和验证。\\n测试完成后，将修补程序推送给生产环境，就像将更新的镜像推送到生产环境一样简单。\\n\\n2. 响应式部署和扩展\\n   Docker 是基于容器的平台，允许高度可移植的工作负载。Docker 容器可以在开发人员的本机上，数据中心的物理或虚拟机上，云服务上或混合环境中运行。\\n\\nDocker 的可移植性和轻量级的特性，还可以使您轻松地完成动态管理的工作负担，并根据业务需求指示，实时扩展或拆除应用程序和服务。\\n\\n3. 在同一硬件上运行更多工作负载\\n   Docker 轻巧快速。它为基于虚拟机管理程序的虚拟机提供了可行、经济、高效的替代方案，因此您可以利用更多的计算能力来实现业务目标。Docker 非常适合于高密度环境以及中小型部署，而您可以用更少的资源做更多的事情。\\n\\n# 2.虚拟化技术和容器化技术\\n\\n虚拟化技术特点：\\n\\n1. 资源占用多\\n2. 冗余步骤多 \\n3. 启动很慢\\n\\n容器化技术：容器化技术不是模拟的一个完整的操作系统\\n\\n比较Docker和虚拟机的不同：\\n\\n1. 传统虚拟机，虚拟出硬件，运行一个完整的操作系统，然后在这个系统上安装和运行软件。\\n2. Docker容器内的应用直接运行在宿主机的内容，容器是没有自己的内核的，也没有虚拟硬件。\\n3. 每个容器都是相互隔离的，每个容器都有属于自己的文件系统，互不影响。\\n\\n![20210717124434988.png](https://static.linhaojun.top/articles/c7ae4abaa3a228f0344dd4b480ff7445.png)\\n\\n# 3.docker的基本组成\\n\\nDocker的基本组成图如下：\\n![20210717120256284.png](https', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:15:04', 24);
INSERT INTO `sys_oper_log` VALUES (1611577192547393537, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-17 18:25:43\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 12:15:04\",\"articleId\":\"1604060262542467074\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2022/12/02/4cc68162eeff43d88b1b751adde1bb95.jpg\",\"articleTitle\":\"docker入门\",\"articleContent\":\"#  1.docker概述\\n\\n## 1.1 基本介绍\\n\\nDocker 是一个开源的应用容器引擎，基于 Go 语言 并遵从 Apache2.0 协议开源。\\n\\nDocker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。\\n\\n容器是完全使用沙箱机制，相互之间不会有任何接口,更重要的是容器性能开销极低。\\n\\nDocker 从 17.03 版本之后分为 CE（Community Edition: 社区版） 和 EE（Enterprise Edition: 企业版），我们用社区版就可以了。[官网](https://docs.docker.com/)\\n\\n##  1.2 应用场景\\n\\n1. Web 应用的自动化打包和发布。\\n\\n2. 自动化测试和持续集成、发布。\\n\\n3. 在服务型环境中部署和调整数据库或其他的后台应用。\\n\\n4. 从头编译或者扩展现有的 Openshellift 或 Cloud Foundry 平台来搭建自己的 PaaS 环境。\\n\\n## 1.3 docker 的优势\\n\\nDocker 是一个用于开发，交付和运行应用程序的开放平台。Docker 使您能够将应用程序与基础架构分开，从而可以快速交付软件。借助 Docker，您可以与管理应用程序相同的方式来管理基础架构。通过利用 Docker 的方法来快速交付，测试和部署代码，您可以大大减少编写代码和在生产环境中运行代码之间的延迟。\\n\\n1. 快速，一致地交付您的应用程序。Docker 允许开发人员使用您提供的应用程序或服务的本地容器在标准化环境中工作，从而简化了开发的生命周期。\\n\\n容器非常适合持续集成和持续交付（CI / CD）工作流程，请考虑以下示例方案：\\n\\n您的开发人员在本地编写代码，并使用 Docker 容器与同事共享他们的工作。\\n他们使用 Docker 将其应用程序推送到测试环境中，并执行自动或手动测试。\\n当开发人员发现错误时，他们可以在开发环境中对其进行修复，然后将其重新部署到测试环境中，以进行测试和验证。\\n测试完成后，将修补程序推送给生产环境，就像将更新的镜像推送到生产环境一样简单。\\n\\n2. 响应式部署和扩展\\n   Docker 是基于容器的平台，允许高度可移植的工作负载。Docker 容器可以在开发人员的本机上，数据中心的物理或虚拟机上，云服务上或混合环境中运行。\\n\\nDocker 的可移植性和轻量级的特性，还可以使您轻松地完成动态管理的工作负担，并根据业务需求指示，实时扩展或拆除应用程序和服务。\\n\\n3. 在同一硬件上运行更多工作负载\\n   Docker 轻巧快速。它为基于虚拟机管理程序的虚拟机提供了可行、经济、高效的替代方案，因此您可以利用更多的计算能力来实现业务目标。Docker 非常适合于高密度环境以及中小型部署，而您可以用更少的资源做更多的事情。\\n\\n# 2.虚拟化技术和容器化技术\\n\\n虚拟化技术特点：\\n\\n1. 资源占用多\\n2. 冗余步骤多 \\n3. 启动很慢\\n\\n容器化技术：容器化技术不是模拟的一个完整的操作系统\\n\\n比较Docker和虚拟机的不同：\\n\\n1. 传统虚拟机，虚拟出硬件，运行一个完整的操作系统，然后在这个系统上安装和运行软件。\\n2. Docker容器内的应用直接运行在宿主机的内容，容器是没有自己的内核的，也没有虚拟硬件。\\n3. 每个容器都是相互隔离的，每个容器都有属于自己的文件系统，互不影响。\\n\\n![20210717124434988.png](https://static.linhaojun.top/articles/c7ae4abaa3a228f0344dd4b480ff7445.png)\\n\\n# 3.docker的基本组成\\n\\nDocker的基本组成图如下：\\n![20210717120256284.png](https:', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:15:19', 8);
INSERT INTO `sys_oper_log` VALUES (1611577324001075201, '博客文章', 5, 'com.erahub.blog.controller.BlogArticleController.export()', 'POST', 1, 'test', '', '/article/export', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":null,\"categoryId\":null,\"tagId\":null,\"articleCover\":null,\"articleTitle\":null,\"articleContent\":null,\"isTop\":null,\"isFeatured\":null,\"isDelete\":\"0\",\"status\":null,\"type\":null,\"originalUrl\":null,\"tagIds\":null}', '', 0, '', '2023-01-07 12:15:50', 990);
INSERT INTO `sys_oper_log` VALUES (1611577546861223937, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-17 18:25:43\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 12:15:19\",\"articleId\":\"1604060262542467074\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2022/12/02/4cc68162eeff43d88b1b751adde1bb95.jpg\",\"articleTitle\":\"docker入门\",\"articleContent\":\"#  1.docker概述\\n\\n## 1.1 基本介绍\\n\\nDocker 是一个开源的应用容器引擎，基于 Go 语言 并遵从 Apache2.0 协议开源。\\n\\nDocker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。\\n\\n容器是完全使用沙箱机制，相互之间不会有任何接口,更重要的是容器性能开销极低。\\n\\nDocker 从 17.03 版本之后分为 CE（Community Edition: 社区版） 和 EE（Enterprise Edition: 企业版），我们用社区版就可以了。[官网](https://docs.docker.com/)\\n\\n##  1.2 应用场景\\n\\n1. Web 应用的自动化打包和发布。\\n\\n2. 自动化测试和持续集成、发布。\\n\\n3. 在服务型环境中部署和调整数据库或其他的后台应用。\\n\\n4. 从头编译或者扩展现有的 Openshellift 或 Cloud Foundry 平台来搭建自己的 PaaS 环境。\\n\\n## 1.3 docker 的优势\\n\\nDocker 是一个用于开发，交付和运行应用程序的开放平台。Docker 使您能够将应用程序与基础架构分开，从而可以快速交付软件。借助 Docker，您可以与管理应用程序相同的方式来管理基础架构。通过利用 Docker 的方法来快速交付，测试和部署代码，您可以大大减少编写代码和在生产环境中运行代码之间的延迟。\\n\\n1. 快速，一致地交付您的应用程序。Docker 允许开发人员使用您提供的应用程序或服务的本地容器在标准化环境中工作，从而简化了开发的生命周期。\\n\\n容器非常适合持续集成和持续交付（CI / CD）工作流程，请考虑以下示例方案：\\n\\n您的开发人员在本地编写代码，并使用 Docker 容器与同事共享他们的工作。\\n他们使用 Docker 将其应用程序推送到测试环境中，并执行自动或手动测试。\\n当开发人员发现错误时，他们可以在开发环境中对其进行修复，然后将其重新部署到测试环境中，以进行测试和验证。\\n测试完成后，将修补程序推送给生产环境，就像将更新的镜像推送到生产环境一样简单。\\n\\n2. 响应式部署和扩展\\n   Docker 是基于容器的平台，允许高度可移植的工作负载。Docker 容器可以在开发人员的本机上，数据中心的物理或虚拟机上，云服务上或混合环境中运行。\\n\\nDocker 的可移植性和轻量级的特性，还可以使您轻松地完成动态管理的工作负担，并根据业务需求指示，实时扩展或拆除应用程序和服务。\\n\\n3. 在同一硬件上运行更多工作负载\\n   Docker 轻巧快速。它为基于虚拟机管理程序的虚拟机提供了可行、经济、高效的替代方案，因此您可以利用更多的计算能力来实现业务目标。Docker 非常适合于高密度环境以及中小型部署，而您可以用更少的资源做更多的事情。\\n\\n# 2.虚拟化技术和容器化技术\\n\\n虚拟化技术特点：\\n\\n1. 资源占用多\\n2. 冗余步骤多 \\n3. 启动很慢\\n\\n容器化技术：容器化技术不是模拟的一个完整的操作系统\\n\\n比较Docker和虚拟机的不同：\\n\\n1. 传统虚拟机，虚拟出硬件，运行一个完整的操作系统，然后在这个系统上安装和运行软件。\\n2. Docker容器内的应用直接运行在宿主机的内容，容器是没有自己的内核的，也没有虚拟硬件。\\n3. 每个容器都是相互隔离的，每个容器都有属于自己的文件系统，互不影响。\\n\\n![20210717124434988.png](https://static.linhaojun.top/articles/c7ae4abaa3a228f0344dd4b480ff7445.png)\\n\\n# 3.docker的基本组成\\n\\nDocker的基本组成图如下：\\n![20210717120256284.png](https:', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:16:43', 11);
INSERT INTO `sys_oper_log` VALUES (1611577797118566401, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1611577797093425154\",\"categoryId\":\"1605166598017581057\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"sss\",\"articleContent\":\"ss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:17:43', 10);
INSERT INTO `sys_oper_log` VALUES (1611577920523378689, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611577797093425154', '127.0.0.1', '', '{}', '', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\r\n### The error may exist in com/erahub/blog/mapper/BlogArticleMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT article_id, category_id, article_cover, article_title, article_content, is_top, is_featured, is_delete, status, type, password, original_url, blog_category, blog_tag_list, create_by, create_time, update_by, update_time FROM blog_article WHERE article_id IN (?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'', '2023-01-07 12:18:13', 55);
INSERT INTO `sys_oper_log` VALUES (1611578111288713217, '博客文章', 5, 'com.erahub.blog.controller.BlogArticleController.export()', 'POST', 1, 'test', '', '/article/export', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":null,\"categoryId\":null,\"tagId\":\"1605165450388885506\",\"articleCover\":null,\"articleTitle\":null,\"articleContent\":null,\"isTop\":null,\"isFeatured\":null,\"isDelete\":\"0\",\"status\":null,\"type\":null,\"originalUrl\":null,\"tagIds\":null}', '', 0, '', '2023-01-07 12:18:58', 58);
INSERT INTO `sys_oper_log` VALUES (1611578267841110018, '博客分类', 2, 'com.erahub.blog.controller.BlogCategoryController.edit()', 'PUT', 1, 'test', '', '/category', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-20 19:41:54\",\"updateBy\":null,\"updateTime\":null,\"categoryId\":\"1605166598017581057\",\"categoryName\":\"MySQL\",\"status\":\"0\",\"remark\":\"MySQL\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:19:35', 6);
INSERT INTO `sys_oper_log` VALUES (1611578935716913153, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1611578838161620994\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"ss\",\"articleContent\":\"ss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:22:15', 23243);
INSERT INTO `sys_oper_log` VALUES (1611578935788216322, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1611578935767269377\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"ss\",\"articleContent\":\"ss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:22:15', 7);
INSERT INTO `sys_oper_log` VALUES (1611578995267641345, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1611578995242500098\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"sss\",\"articleContent\":\"ssss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:22:29', 1);
INSERT INTO `sys_oper_log` VALUES (1611579488278716417, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1611579446990012417\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:24:26', 9837);
INSERT INTO `sys_oper_log` VALUES (1611584700624183297, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611579446990012417', '127.0.0.1', '', '{}', '', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\r\n### The error may exist in com/erahub/blog/mapper/BlogArticleMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT article_id, category_id, article_cover, article_title, article_content, is_top, is_featured, is_delete, status, type, password, original_url, blog_category, blog_tag_list, create_by, create_time, update_by, update_time FROM blog_article WHERE article_id IN (?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'', '2023-01-07 12:45:09', 68);
INSERT INTO `sys_oper_log` VALUES (1611584855419166722, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611579446990012417', '127.0.0.1', '', '{}', '', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\r\n### The error may exist in com/erahub/blog/mapper/BlogArticleMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT article_id,category_id,article_cover,article_title,article_content,is_top,is_featured,is_delete,status,type,password,original_url,blog_category,blog_tag_list,create_by,create_time,update_by,update_time FROM blog_article WHERE article_id IN (   ?  )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'', '2023-01-07 12:45:46', 3);
INSERT INTO `sys_oper_log` VALUES (1611584941159129090, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611579446990012417', '127.0.0.1', '', '{}', '', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\r\n### The error may exist in com/erahub/blog/mapper/BlogArticleMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT article_id,category_id,article_cover,article_title,article_content,is_top,is_featured,is_delete,status,type,password,original_url,blog_category,blog_tag_list,create_by,create_time,update_by,update_time FROM blog_article WHERE article_id IN (   ?  )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'blog_category\' in \'field list\'', '2023-01-07 12:46:06', 14228);
INSERT INTO `sys_oper_log` VALUES (1611585536142123009, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611579446990012417', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:48:28', 41);
INSERT INTO `sys_oper_log` VALUES (1611585570459918337, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611578995242500098', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:48:36', 9);
INSERT INTO `sys_oper_log` VALUES (1611585610490355713, '博客文章', 3, 'com.erahub.blog.controller.BlogArticleController.remove()', 'DELETE', 1, 'test', '', '/article/remove/1611579446990012417', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:48:46', 28);
INSERT INTO `sys_oper_log` VALUES (1611585664936615938, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:22:29\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 12:48:36\",\"articleId\":\"1611578995242500098\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"sss\",\"articleContent\":\"ssss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"1\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:48:59', 14);
INSERT INTO `sys_oper_log` VALUES (1611585718271385602, '博客文章', 3, 'com.erahub.blog.controller.BlogArticleController.remove()', 'DELETE', 1, 'test', '', '/article/remove/1611578995242500098', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:49:12', 8);
INSERT INTO `sys_oper_log` VALUES (1611585779072016385, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2022-12-17 19:51:40\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-04 19:17:17\",\"articleId\":\"1604081892463243265\",\"categoryId\":\"1605166598017581057\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2022/12/11/49b8cc3fe7d0461f8c44f02d3ef830c7.jpg\",\"articleTitle\":\"MySQL 覆盖索引\",\"articleContent\":\"## 1.什么是索引\\n索引（在 MySQL 中也叫“键key”）是存储引擎快速找到记录的一种数据结构，通俗来说类似书本的目录，这个比方虽然被用的最多但是也是最恰如其当的，在查询书本中的某个知识点不借助目录的情况下，往往都找的够呛，那么索引相较于数据库的重要性也可见一斑。\\n## 2.索引的有哪些种类？\\n索引的种类这里只罗列出InnoDB支持的索引：主键索引(PRIMARY)，普通索引(INDEX)，唯一索引(UNIQUE)，组合索引，总体划分为两类，主键索引也被称为聚簇索引（clustered index），其余都称呼为非主键索引也被称为二级索引（secondary index）。\\n## 3.InnoDB的不同的索引组织结构是怎样的呢？\\n众所周知在InnoDB引用的是B+树索引模型，这里对B+树结构暂时不做过多阐述，很多文章都有描述，在第二问中我们对索引的种类划分为两大类主键索引和非主键索引，那么问题就在于比较两种索引的区别了，我们这里建立一张学生表，其中包含字段id设置主键索引、name设置普通索引、age(无处理)，并向数据库中插入4条数据：（\\\"小赵\\\", 10）（\\\"小王\\\", 11）（\\\"小李\\\", 12）（\\\"小陈\\\", 13）\\n```sql\\nCREATE TABLE `student` (\\n  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT \'自增主键\',\\n  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT \'名称\',\\n  `age` int(3) unsigned NOT NULL DEFAULT \'1\' COMMENT \'年龄\',\\n  PRIMARY KEY (`id`),\\n  KEY `I_name` (`name`)\\n) ENGINE=InnoDB;\\n\\nINSERT INTO student (name, age) VALUES(\\\"小赵\\\", 10),(\\\"小王\\\", 11),(\\\"小李\\\", 12),(\\\"小陈\\\", 13);\\n```\\n这里我们设置了主键为自增，那么此时数据库里数据为\\n![image.png](https://static.linhaojun.top/articles/9f480278926cf7780795ac1d9a1b19f8.png)\\n每一个索引在 InnoDB 里面对应一棵B+树，那么此时就存着两棵B+树。\\n![image.png](https://static.linhaojun.top/articles/72e270f3bf165ce9f71a2585a43fb0fa.png)\\n可以发现区别在与叶子节点中，主键索引存储了整行数据，而非主键索引中存储的值为主键id, 在我们执行如下sql后\\n```sql\\nSELECT age FROM student WHERE name = \'小李\'；\\n```\\n流程为：\\n\\n1. 在name索引树上找到名称为小李的节点 id为03\\n2. 从id索引树上找到id为03的节点 获取所有数据\\n3. 从数据中获取字段命为age的值返回 12\\n``在流程中从非主键索引树搜索回到主键索引树搜索的过程称为：回表``，在本次查询中因为查询结果只存在主键索引树中，我们必须回表才能查询到结果，那么如何优化这个过程呢？引入正文覆盖索引\\n## 4.什么是覆盖索引\\n覆盖索引（covering index ，或称为索引覆盖）即从非主键索引中就能查到的记录，而不需要查询主键索引中的记录，避免了回表的产生减少了树的搜索次数，显著提升性能。\\n## 5.如何使用是覆盖索引？\\n之前我们已经建立了表student，那么现在出现的业务需求中要求根据名称获取学生的年龄，并且该搜索场景非常频繁，那么先在我们删除掉之前以字段name建立的普通索引，以name和age两个字段建立', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:49:26', 9);
INSERT INTO `sys_oper_log` VALUES (1611585824429219841, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2022-12-17 19:51:40\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 12:49:26\",\"articleId\":\"1604081892463243265\",\"categoryId\":\"1605166598017581057\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2022/12/11/49b8cc3fe7d0461f8c44f02d3ef830c7.jpg\",\"articleTitle\":\"MySQL 覆盖索引\",\"articleContent\":\"## 1.什么是索引\\n索引（在 MySQL 中也叫“键key”）是存储引擎快速找到记录的一种数据结构，通俗来说类似书本的目录，这个比方虽然被用的最多但是也是最恰如其当的，在查询书本中的某个知识点不借助目录的情况下，往往都找的够呛，那么索引相较于数据库的重要性也可见一斑。\\n## 2.索引的有哪些种类？\\n索引的种类这里只罗列出InnoDB支持的索引：主键索引(PRIMARY)，普通索引(INDEX)，唯一索引(UNIQUE)，组合索引，总体划分为两类，主键索引也被称为聚簇索引（clustered index），其余都称呼为非主键索引也被称为二级索引（secondary index）。\\n## 3.InnoDB的不同的索引组织结构是怎样的呢？\\n众所周知在InnoDB引用的是B+树索引模型，这里对B+树结构暂时不做过多阐述，很多文章都有描述，在第二问中我们对索引的种类划分为两大类主键索引和非主键索引，那么问题就在于比较两种索引的区别了，我们这里建立一张学生表，其中包含字段id设置主键索引、name设置普通索引、age(无处理)，并向数据库中插入4条数据：（\\\"小赵\\\", 10）（\\\"小王\\\", 11）（\\\"小李\\\", 12）（\\\"小陈\\\", 13）\\n```sql\\nCREATE TABLE `student` (\\n  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT \'自增主键\',\\n  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT \'名称\',\\n  `age` int(3) unsigned NOT NULL DEFAULT \'1\' COMMENT \'年龄\',\\n  PRIMARY KEY (`id`),\\n  KEY `I_name` (`name`)\\n) ENGINE=InnoDB;\\n\\nINSERT INTO student (name, age) VALUES(\\\"小赵\\\", 10),(\\\"小王\\\", 11),(\\\"小李\\\", 12),(\\\"小陈\\\", 13);\\n```\\n这里我们设置了主键为自增，那么此时数据库里数据为\\n![image.png](https://static.linhaojun.top/articles/9f480278926cf7780795ac1d9a1b19f8.png)\\n每一个索引在 InnoDB 里面对应一棵B+树，那么此时就存着两棵B+树。\\n![image.png](https://static.linhaojun.top/articles/72e270f3bf165ce9f71a2585a43fb0fa.png)\\n可以发现区别在与叶子节点中，主键索引存储了整行数据，而非主键索引中存储的值为主键id, 在我们执行如下sql后\\n```sql\\nSELECT age FROM student WHERE name = \'小李\'；\\n```\\n流程为：\\n\\n1. 在name索引树上找到名称为小李的节点 id为03\\n2. 从id索引树上找到id为03的节点 获取所有数据\\n3. 从数据中获取字段命为age的值返回 12\\n``在流程中从非主键索引树搜索回到主键索引树搜索的过程称为：回表``，在本次查询中因为查询结果只存在主键索引树中，我们必须回表才能查询到结果，那么如何优化这个过程呢？引入正文覆盖索引\\n## 4.什么是覆盖索引\\n覆盖索引（covering index ，或称为索引覆盖）即从非主键索引中就能查到的记录，而不需要查询主键索引中的记录，避免了回表的产生减少了树的搜索次数，显著提升性能。\\n## 5.如何使用是覆盖索引？\\n之前我们已经建立了表student，那么现在出现的业务需求中要求根据名称获取学生的年龄，并且该搜索场景非常频繁，那么先在我们删除掉之前以字段name建立的普通索引，以name和age两个字段建立联', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:49:37', 8);
INSERT INTO `sys_oper_log` VALUES (1611585875809443842, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:17:43\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 12:17:43\",\"articleId\":\"1611577797093425154\",\"categoryId\":\"1605166598017581057\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"sss\",\"articleContent\":\"ss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:49:49', 10);
INSERT INTO `sys_oper_log` VALUES (1611585903986778114, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:21:51\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 12:21:51\",\"articleId\":\"1611578838161620994\",\"categoryId\":\"1605166598017581057\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"ss\",\"articleContent\":\"ss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:49:56', 10);
INSERT INTO `sys_oper_log` VALUES (1611585928175329281, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:22:15\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 12:22:15\",\"articleId\":\"1611578935767269377\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"ss\",\"articleContent\":\"ss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:50:02', 7);
INSERT INTO `sys_oper_log` VALUES (1611585951646654465, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611577797093425154,1611578838161620994,1611578935767269377', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:50:07', 10);
INSERT INTO `sys_oper_log` VALUES (1611585986182553601, '博客文章', 3, 'com.erahub.blog.controller.BlogArticleController.remove()', 'DELETE', 1, 'test', '', '/article/remove/1611577797093425154,1611578838161620994,1611578935767269377', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:50:16', 8);
INSERT INTO `sys_oper_log` VALUES (1611586708177461250, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 12:53:08', 13);
INSERT INTO `sys_oper_log` VALUES (1611589483279982593, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"3f51a9b35d2947f893b326b3557568ea.png\",\"originalName\":\"2b62583abc3ba593.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 13:04:09', 19);
INSERT INTO `sys_oper_log` VALUES (1611589648174850050, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/3f51a9b35d2947f893b326b3557568ea.png', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 13:04:49', 8);
INSERT INTO `sys_oper_log` VALUES (1611589715342434305, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"cc818341162a4589927334dda46da13b.jpg\",\"originalName\":\"-1b1a7260f5581b4e.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:05:05', 2);
INSERT INTO `sys_oper_log` VALUES (1611590502168698882, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"7f55c0f2b11f4aba8d327478aa92b23e.jpg\",\"originalName\":\"-1b1a7260f5581b4e.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:08:12', 1);
INSERT INTO `sys_oper_log` VALUES (1611591369437519874, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"dd89b2ee1f164c55963f5d690fee334e.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:11:39', 0);
INSERT INTO `sys_oper_log` VALUES (1611594931676684289, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"bdf4bf814fcf49adaf50421ab9380583.jpg\",\"originalName\":\"-1b1a7260f5581b4e.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:25:48', 4);
INSERT INTO `sys_oper_log` VALUES (1611597729692688386, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"82a822fe13934970bb1d57b9a0a6f21d.jpg\",\"originalName\":\"-1b1a7260f5581b4e.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:36:55', 3);
INSERT INTO `sys_oper_log` VALUES (1611598403834781697, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"bacfaef3036e4eda8de62ded63d2ad34.jpg\",\"originalName\":\"-1b1a7260f5581b4e.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:39:36', 4);
INSERT INTO `sys_oper_log` VALUES (1611598520197357569, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"3beb8f39726a43c58b5d847162c9116c.png\",\"originalName\":\"2b62583abc3ba593.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 13:40:04', 2);
INSERT INTO `sys_oper_log` VALUES (1611598660958199809, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"484409bf28094b30b2713dc9a0bca6bc.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:40:37', 1);
INSERT INTO `sys_oper_log` VALUES (1611598777979281410, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"c929ccd5031542ea98966149725329dc.jpg\",\"originalName\":\"-1de35f61cb2a15bf.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:41:05', 3);
INSERT INTO `sys_oper_log` VALUES (1611598930849079297, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"0562086a1de7450993b9c6122372a5ca.jpg\",\"originalName\":\"-1de35f61cb2a15bf.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:41:42', 2);
INSERT INTO `sys_oper_log` VALUES (1611599008233988098, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"5f26a78868104f3286fb5409d5363148.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:42:00', 2);
INSERT INTO `sys_oper_log` VALUES (1611599094934446081, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"11655ce9ba464719ae7999494747e805.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:42:21', 1);
INSERT INTO `sys_oper_log` VALUES (1611599303680761857, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"73fc44e1f2e44929aeb1669b13011442.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:43:11', 0);
INSERT INTO `sys_oper_log` VALUES (1611599455774613505, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"944040eb04d44963b820af210623ba67.jpg\",\"originalName\":\"-1de35f61cb2a15bf.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:43:47', 2);
INSERT INTO `sys_oper_log` VALUES (1611599902904197121, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"e5f8d4951bab4bd88c8e519475329c77.png\",\"originalName\":\"1ea5cd776a448528.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 13:45:34', 0);
INSERT INTO `sys_oper_log` VALUES (1611599984097533953, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"80ab3f99072049e382daf1c641b53f46.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:45:53', 0);
INSERT INTO `sys_oper_log` VALUES (1611600422893035521, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"ccd59b77680447cd894b293fb5957df4.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 13:47:38', 2);
INSERT INTO `sys_oper_log` VALUES (1611600478287208450, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 12:53:08\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":null,\"imageName\":\"ccd59b77680447cd894b293fb5957df4.jpg\",\"originalImageName\":\"-1c1009017f8b7159.jpg\",\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 13:47:51', 9054);
INSERT INTO `sys_oper_log` VALUES (1611611363948965890, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"54d1fd18eb994f5386cb2ca8cfbcdf64.jpg\",\"originalName\":\"-1de35f61cb2a15bf.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:31:06', 42);
INSERT INTO `sys_oper_log` VALUES (1611611932889526274, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"84f7d993a991471284323a02c9e2fcf2.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:33:22', 1);
INSERT INTO `sys_oper_log` VALUES (1611611950111338498, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 13:47:51\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"blogArticleImageBo\":{\"fileName\":\"84f7d993a991471284323a02c9e2fcf2.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:33:26', 938);
INSERT INTO `sys_oper_log` VALUES (1611612181553033218, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"68527f4284b84df5b7e72bc74c96e8d8.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:34:21', 5);
INSERT INTO `sys_oper_log` VALUES (1611612413078614018, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:33:26\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"blogArticleImageBo\":{\"fileName\":\"68527f4284b84df5b7e72bc74c96e8d8.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:35:16', 54024);
INSERT INTO `sys_oper_log` VALUES (1611612629840244738, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.remove()', 'DELETE', 1, 'test', '', '/oss/1611612412881481729,1611611949767405570,1605504850842976257,1605504850842976258,1602983362942451714,1598526544908304385,1598522678536032261,1598522678536032262', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:36:08', 67);
INSERT INTO `sys_oper_log` VALUES (1611612908312670210, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'test', '', '/config/updateByKey', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:37:14\",\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"false\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:37:14', 10);
INSERT INTO `sys_oper_log` VALUES (1611612914499268609, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'test', '', '/config/updateByKey', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:37:15\",\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"true\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:37:16', 5);
INSERT INTO `sys_oper_log` VALUES (1611612926192988162, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'test', '', '/config/updateByKey', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:37:18\",\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"false\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:37:19', 6);
INSERT INTO `sys_oper_log` VALUES (1611612932807405570, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'test', '', '/config/updateByKey', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:37:20\",\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"true\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:37:20', 6);
INSERT INTO `sys_oper_log` VALUES (1611613621474373633, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"7bcab9ebc9864180b0c840768b37a72a.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:40:04', 1);
INSERT INTO `sys_oper_log` VALUES (1611613627619028994, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:35:16\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/bd9009d75a8e4ae28a8b1ebfe4a7a53e.jpg\",\"blogArticleImageBo\":{\"fileName\":\"7bcab9ebc9864180b0c840768b37a72a.jpg\",\"originalName\":\"-1c1009017f8b7159.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:40:06', 445);
INSERT INTO `sys_oper_log` VALUES (1611613696464334849, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.remove()', 'DELETE', 1, 'test', '', '/oss/1611613626989883393', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:40:22', 11);
INSERT INTO `sys_oper_log` VALUES (1611613785157087234, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"e7215ec1a7184867998ad63675fb7d7a.jpg\",\"originalName\":\"2be4264be9b35a5755298952340d31556167e027_raw.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:40:43', 0);
INSERT INTO `sys_oper_log` VALUES (1611613849292189698, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:40:06\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/75bfc35b17b341ce9f16d1421adcc3ea.jpg\",\"blogArticleImageBo\":{\"fileName\":\"e7215ec1a7184867998ad63675fb7d7a.jpg\",\"originalName\":\"2be4264be9b35a5755298952340d31556167e027_raw.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:40:59', 14318);
INSERT INTO `sys_oper_log` VALUES (1611614094004662274, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"883d3e7beee444f88a3deed4d49da4cf.jpg\",\"originalName\":\"2be4264be9b35a5755298952340d31556167e027_raw.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:41:57', 0);
INSERT INTO `sys_oper_log` VALUES (1611614098169606145, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:40:59\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"blogArticleImageBo\":{\"fileName\":\"883d3e7beee444f88a3deed4d49da4cf.jpg\",\"originalName\":\"2be4264be9b35a5755298952340d31556167e027_raw.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:41:58', 153);
INSERT INTO `sys_oper_log` VALUES (1611615088914542594, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"46895a5eafa640d69efb36b9f7cecdd7.png\",\"originalName\":\"2b62583abc3ba593.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 14:45:54', 5);
INSERT INTO `sys_oper_log` VALUES (1611615093335339010, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:41:58\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/48534f3983404445a79d87efc6053aa5.jpg\",\"blogArticleImageBo\":{\"fileName\":\"46895a5eafa640d69efb36b9f7cecdd7.png\",\"originalName\":\"2b62583abc3ba593.png\",\"fileSuffix\":\".png\",\"contentType\":\"image/png\"},\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:45:55', 47);
INSERT INTO `sys_oper_log` VALUES (1611615615773650945, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:48:00', 1);
INSERT INTO `sys_oper_log` VALUES (1611615630151725057, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"f84e5ee70cde4506b6022bda7b4ffb77.png\",\"originalName\":\"1ea5cd776a448528.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 14:48:03', 13);
INSERT INTO `sys_oper_log` VALUES (1611615643049209858, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:45:55\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/aae1ce66cfa14c44b9da83cb116d6aaa.png\",\"blogArticleImageBo\":{\"fileName\":\"f84e5ee70cde4506b6022bda7b4ffb77.png\",\"originalName\":\"1ea5cd776a448528.png\",\"fileSuffix\":\".png\",\"contentType\":\"image/png\"},\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:48:06', 83);
INSERT INTO `sys_oper_log` VALUES (1611615697940066306, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.remove()', 'DELETE', 1, 'test', '', '/oss/1611613789351391233', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:48:19', 23);
INSERT INTO `sys_oper_log` VALUES (1611615704579649538, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.remove()', 'DELETE', 1, 'test', '', '/oss/1611615642956935170', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:48:21', 9);
INSERT INTO `sys_oper_log` VALUES (1611615750125596674, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (1611615762712702978, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"1be5a92a4de54fbf9ad1d42a233a9218.jpg\",\"originalName\":\"2f5be056684f465d.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:48:35', 2);
INSERT INTO `sys_oper_log` VALUES (1611615767632621570, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:48:06\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/deac4a3e3c57420f9dc13a921f9b3967.png\",\"blogArticleImageBo\":{\"fileName\":\"1be5a92a4de54fbf9ad1d42a233a9218.jpg\",\"originalName\":\"2f5be056684f465d.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:48:36', 34);
INSERT INTO `sys_oper_log` VALUES (1611615828328394754, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:48:51', 0);
INSERT INTO `sys_oper_log` VALUES (1611615838482804738, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"47e8324a1e8249b5b281a31de9969d11.jpg\",\"originalName\":\"-4f1e593e16149d26.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:48:53', 1);
INSERT INTO `sys_oper_log` VALUES (1611615842941349889, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 12:53:08\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:48:36\",\"articleId\":\"1611586708194271233\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/fb9592d147dd4df48e34159631e9d6a8.jpg\",\"blogArticleImageBo\":{\"fileName\":\"47e8324a1e8249b5b281a31de9969d11.jpg\",\"originalName\":\"-4f1e593e16149d26.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"sss\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"3\",\"originalUrl\":\"ss\",\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:48:54', 47);
INSERT INTO `sys_oper_log` VALUES (1611616129936601090, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611586708194271233', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:50:02', 17);
INSERT INTO `sys_oper_log` VALUES (1611616162421485569, '博客文章', 3, 'com.erahub.blog.controller.BlogArticleController.remove()', 'DELETE', 1, 'test', '', '/article/remove/1611586708194271233', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:50:10', 38);
INSERT INTO `sys_oper_log` VALUES (1611618307568906241, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"0bf111a3005b4c00afa77f004bd74432.jpg\",\"originalName\":\"2f5be056684f465d.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:58:42', 2);
INSERT INTO `sys_oper_log` VALUES (1611618570916671489, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"8f7766d5734e4eb6ba44da4d09ad814e.jpg\",\"originalName\":\"2f5be056684f465d.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 14:59:44', 1);
INSERT INTO `sys_oper_log` VALUES (1611618575618486274, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":null,\"blogArticleImageBo\":{\"fileName\":\"8f7766d5734e4eb6ba44da4d09ad814e.jpg\",\"originalName\":\"2f5be056684f465d.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"搜索\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 14:59:46', 103);
INSERT INTO `sys_oper_log` VALUES (1611618687224721409, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"53c468f8d7d04e94a2fea0319f7338c2.jpg\",\"originalName\":\"2be4264be9b35a5755298952340d31556167e027_raw.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:00:12', 4);
INSERT INTO `sys_oper_log` VALUES (1611618694770274306, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/53c468f8d7d04e94a2fea0319f7338c2.jpg', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:00:14', 1);
INSERT INTO `sys_oper_log` VALUES (1611618707210579970, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"96ded3eb9ec642b5808c584ab3363394.jpg\",\"originalName\":\"-5ca154ce1a4dab55.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:00:17', 2);
INSERT INTO `sys_oper_log` VALUES (1611618713657225217, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1611618713590132738\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":null,\"blogArticleImageBo\":{\"fileName\":\"96ded3eb9ec642b5808c584ab3363394.jpg\",\"originalName\":\"-5ca154ce1a4dab55.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"dasd\",\"articleContent\":\" ```大大\\n\\n```\\n\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:00:18', 22);
INSERT INTO `sys_oper_log` VALUES (1611618779180642306, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:00:34', 0);
INSERT INTO `sys_oper_log` VALUES (1611618788236144641, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"038c66f043414b52ba3f9ed97dce8704.jpg\",\"originalName\":\"5ea62a1e4fbffff.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:00:36', 2);
INSERT INTO `sys_oper_log` VALUES (1611618791432204289, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 15:00:18\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:00:18\",\"articleId\":\"1611618713590132738\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/7a39c0cc575a473fa68a27ad3ce5c57f.jpg\",\"blogArticleImageBo\":{\"fileName\":\"038c66f043414b52ba3f9ed97dce8704.jpg\",\"originalName\":\"5ea62a1e4fbffff.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"dasd\",\"articleContent\":\" ```大大\\n\\n```\\n\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:00:37', 61);
INSERT INTO `sys_oper_log` VALUES (1611619342605692930, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611618713590132738', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:02:48', 20);
INSERT INTO `sys_oper_log` VALUES (1611619367121399810, '博客文章', 3, 'com.erahub.blog.controller.BlogArticleController.remove()', 'DELETE', 1, 'test', '', '/article/remove/1611618713590132738', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:02:54', 36);
INSERT INTO `sys_oper_log` VALUES (1611619482762555394, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:03:22', 1);
INSERT INTO `sys_oper_log` VALUES (1611619496213688322, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"9e0c715ec4da44edb65888933a7b6f6b.jpg\",\"originalName\":\"7a6ba4056ecb878a.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:03:25', 2);
INSERT INTO `sys_oper_log` VALUES (1611619500177305602, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 14:59:45\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/67d2a14773bd490c8b508a4c5d48cf5c.jpg\",\"blogArticleImageBo\":{\"fileName\":\"9e0c715ec4da44edb65888933a7b6f6b.jpg\",\"originalName\":\"7a6ba4056ecb878a.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"搜索\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"1\",\"originalUrl\":null,\"tagIds\":[\"1605165450388885506\",\"1605166617282019330\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:03:26', 40);
INSERT INTO `sys_oper_log` VALUES (1611619782407827457, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:04:33', 1);
INSERT INTO `sys_oper_log` VALUES (1611619801164754945, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"9398762509a540b68c617b688e796238.jpg\",\"originalName\":\"-5ca154ce1a4dab55.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:04:38', 1);
INSERT INTO `sys_oper_log` VALUES (1611619804734107649, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:03:26\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/80c8c83cbb334f32a97cc084bda8ed56.jpg\",\"blogArticleImageBo\":{\"fileName\":\"9398762509a540b68c617b688e796238.jpg\",\"originalName\":\"-5ca154ce1a4dab55.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"搜索\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"2\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:04:39', 45);
INSERT INTO `sys_oper_log` VALUES (1611619949152382977, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:05:13', 0);
INSERT INTO `sys_oper_log` VALUES (1611619961311670273, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"718d16a8047c407dadbbf843d81571b0.jpg\",\"originalName\":\"7a6ba4056ecb878a.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:05:16', 1);
INSERT INTO `sys_oper_log` VALUES (1611619967695400961, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:04:39\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/02f095ac078e481586b707c4e3054a88.jpg\",\"blogArticleImageBo\":{\"fileName\":\"718d16a8047c407dadbbf843d81571b0.jpg\",\"originalName\":\"7a6ba4056ecb878a.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"搜索\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"2\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:05:17', 38);
INSERT INTO `sys_oper_log` VALUES (1611619998125076481, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:05:25', 0);
INSERT INTO `sys_oper_log` VALUES (1611620008518561793, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"21be705a365c47bea3a02e2ef304d85b.png\",\"originalName\":\"-13b45a0c0a8dc754.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 15:05:27', 3);
INSERT INTO `sys_oper_log` VALUES (1611620013077770241, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:05:17\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/2889ae58ceee484f93f40f4714834dfb.jpg\",\"blogArticleImageBo\":{\"fileName\":\"21be705a365c47bea3a02e2ef304d85b.png\",\"originalName\":\"-13b45a0c0a8dc754.png\",\"fileSuffix\":\".png\",\"contentType\":\"image/png\"},\"articleTitle\":\"ss\",\"articleContent\":\"搜索\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"2\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:05:28', 54);
INSERT INTO `sys_oper_log` VALUES (1611620047508811778, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:05:36', 0);
INSERT INTO `sys_oper_log` VALUES (1611620055029198850, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"e95a0cdcb30c4db1adf69cfe9c6dc82b.jpg\",\"originalName\":\"5ea62a1e4fbffff.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:05:38', 2);
INSERT INTO `sys_oper_log` VALUES (1611620066076995585, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:05:28\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/1463e9bc851b419e9ef7acdc3598056a.png\",\"blogArticleImageBo\":{\"fileName\":\"e95a0cdcb30c4db1adf69cfe9c6dc82b.jpg\",\"originalName\":\"5ea62a1e4fbffff.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"搜索\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:05:41', 51);
INSERT INTO `sys_oper_log` VALUES (1611620141251506178, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:05:59', 0);
INSERT INTO `sys_oper_log` VALUES (1611620155361144834, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"2deac47bd0d74c22b03df38fbc06dd80.jpg\",\"originalName\":\"7a6ba4056ecb878a.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:06:02', 2);
INSERT INTO `sys_oper_log` VALUES (1611620160612413441, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:05:41\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/088d3dbb9fb04ef087ee0c38d92a575a.jpg\",\"blogArticleImageBo\":{\"fileName\":\"2deac47bd0d74c22b03df38fbc06dd80.jpg\",\"originalName\":\"7a6ba4056ecb878a.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ss\",\"articleContent\":\"搜索\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:06:03', 38);
INSERT INTO `sys_oper_log` VALUES (1611620200563159041, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:06:13', 0);
INSERT INTO `sys_oper_log` VALUES (1611620219370418177, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"3449af8a8fc2427790ace601f8ceb3a4.jpg\",\"originalName\":\"7c381762b8823873.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:06:17', 1);
INSERT INTO `sys_oper_log` VALUES (1611620225414410242, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:06:03\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/801e75b1169e44f88a0a309dc73cd03f.jpg\",\"blogArticleImageBo\":{\"fileName\":\"3449af8a8fc2427790ace601f8ceb3a4.jpg\",\"originalName\":\"7c381762b8823873.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:06:19', 42);
INSERT INTO `sys_oper_log` VALUES (1611622328300023810, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:06:19\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/08be45d9b9c34feb8e13a47faa8d3a56.jpg\",\"blogArticleImageBo\":{\"fileName\":null,\"originalName\":null,\"fileSuffix\":null,\"contentType\":null},\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '', 1, 'File not exist: E:\\Program\\java\\project\\erahub-auth-simple\\erahub-auth-simple\\temp_files\\null', '2023-01-07 15:14:40', 16);
INSERT INTO `sys_oper_log` VALUES (1611623621206814721, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:19:48', 0);
INSERT INTO `sys_oper_log` VALUES (1611623636583133186, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"c7c765db546d4fd8906d100ea69423e3.png\",\"originalName\":\"4f7ff690c64bfc18.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 15:19:52', 0);
INSERT INTO `sys_oper_log` VALUES (1611623832234831873, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"7dfd36106b5948eaafc1d551de8cfdb6.png\",\"originalName\":\"4f7ff690c64bfc18.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 15:20:39', 2);
INSERT INTO `sys_oper_log` VALUES (1611624441516208129, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"85507adebce248cb91b87f289c1fcea0.jpg\",\"originalName\":\"2be4264be9b35a5755298952340d31556167e027_raw.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:23:04', 2);
INSERT INTO `sys_oper_log` VALUES (1611624445605654530, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:06:19\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"blogArticleImageBo\":{\"fileName\":\"85507adebce248cb91b87f289c1fcea0.jpg\",\"originalName\":\"2be4264be9b35a5755298952340d31556167e027_raw.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:23:05', 45);
INSERT INTO `sys_oper_log` VALUES (1611624551616688130, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"5d3aea960d404173b5f4750444acd45f.png\",\"originalName\":\"2b62583abc3ba593.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 15:23:30', 2);
INSERT INTO `sys_oper_log` VALUES (1611624607824556034, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:23:05\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"blogArticleImageBo\":{\"fileName\":\"5d3aea960d404173b5f4750444acd45f.png\",\"originalName\":\"2b62583abc3ba593.png\",\"fileSuffix\":\".png\",\"contentType\":\"image/png\"},\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:23:44', 12157);
INSERT INTO `sys_oper_log` VALUES (1611624998565916673, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"dfd85a839e6d406fb58e046a543523a1.jpg\",\"originalName\":\"2be4264be9b35a5755298952340d31556167e027_raw.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:25:17', 2);
INSERT INTO `sys_oper_log` VALUES (1611625005675261954, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/dfd85a839e6d406fb58e046a543523a1.jpg', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:25:19', 0);
INSERT INTO `sys_oper_log` VALUES (1611625016521732098, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"f0253c4b7a8c46698df0e54331809ae3.jpg\",\"originalName\":\"7a6ba4056ecb878a.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:25:21', 1);
INSERT INTO `sys_oper_log` VALUES (1611625020258856961, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:23:44\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"\",\"blogArticleImageBo\":{\"fileName\":\"f0253c4b7a8c46698df0e54331809ae3.jpg\",\"originalName\":\"7a6ba4056ecb878a.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:25:22', 145);
INSERT INTO `sys_oper_log` VALUES (1611625848222855169, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:28:39', 0);
INSERT INTO `sys_oper_log` VALUES (1611625859643944962, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"787b433d39314f5fa7c6442940a605e6.jpg\",\"originalName\":\"4c5a6e0688ff2048aee5becdd823b028dd3b8d77.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:28:42', 1);
INSERT INTO `sys_oper_log` VALUES (1611625864991682562, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:25:22\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/7493a65696814dbcb91789e56dda68a9.jpg\",\"blogArticleImageBo\":{\"fileName\":\"787b433d39314f5fa7c6442940a605e6.jpg\",\"originalName\":\"4c5a6e0688ff2048aee5becdd823b028dd3b8d77.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:28:43', 8);
INSERT INTO `sys_oper_log` VALUES (1611626882559193090, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:28:43\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/7493a65696814dbcb91789e56dda68a9.jpg\",\"blogArticleImageBo\":null,\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:32:46', 42);
INSERT INTO `sys_oper_log` VALUES (1611626917048954882, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:32:46\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/7493a65696814dbcb91789e56dda68a9.jpg\",\"blogArticleImageBo\":null,\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:32:54', 10);
INSERT INTO `sys_oper_log` VALUES (1611626944349679617, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:33:01', 1);
INSERT INTO `sys_oper_log` VALUES (1611626957595291649, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"0a89f8cf2bad4e8baaf3daa1be64f527.png\",\"originalName\":\"-28c12020bfa82069.png\",\"fileSuffix\":\".png\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/png\"}}', 0, '', '2023-01-07 15:33:04', 2);
INSERT INTO `sys_oper_log` VALUES (1611626962699759617, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:32:54\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/7493a65696814dbcb91789e56dda68a9.jpg\",\"blogArticleImageBo\":{\"fileName\":\"0a89f8cf2bad4e8baaf3daa1be64f527.png\",\"originalName\":\"-28c12020bfa82069.png\",\"fileSuffix\":\".png\",\"contentType\":\"image/png\"},\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:33:05', 66);
INSERT INTO `sys_oper_log` VALUES (1611626981800620033, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:33:05\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/f057f2e3fa1f46149795198644cb0c21.png\",\"blogArticleImageBo\":null,\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:33:10', 8);
INSERT INTO `sys_oper_log` VALUES (1611627000570130434, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:33:14', 0);
INSERT INTO `sys_oper_log` VALUES (1611627008258289665, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"0203a1aec2554c5a8f841945e3c49b98.jpg\",\"originalName\":\"5c66ee25816ddb19.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:33:16', 1);
INSERT INTO `sys_oper_log` VALUES (1611627013320814594, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 14:59:45\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:33:10\",\"articleId\":\"1611618575421370369\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/f057f2e3fa1f46149795198644cb0c21.png\",\"blogArticleImageBo\":{\"fileName\":\"0203a1aec2554c5a8f841945e3c49b98.jpg\",\"originalName\":\"5c66ee25816ddb19.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"ssfdsfds\",\"articleContent\":\"搜索 发是发生的\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"2\",\"type\":\"1\",\"originalUrl\":\"水水水水\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:33:17', 41);
INSERT INTO `sys_oper_log` VALUES (1611627128957775874, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"2ab6bacd8726482d9bf1e5d75be986c3.jpg\",\"originalName\":\"-1de35f61cb2a15bf.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:33:45', 2);
INSERT INTO `sys_oper_log` VALUES (1611627133785419778, '博客文章', 1, 'com.erahub.blog.controller.BlogArticleController.add()', 'POST', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"articleId\":\"1611627133785382913\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":null,\"blogArticleImageBo\":{\"fileName\":\"2ab6bacd8726482d9bf1e5d75be986c3.jpg\",\"originalName\":\"-1de35f61cb2a15bf.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"casas\",\"articleContent\":\"aca\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"3\",\"originalUrl\":\"啊撒擦撒\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:33:46', 41);
INSERT INTO `sys_oper_log` VALUES (1611627156745039873, 'OSS对象存储', 3, 'com.erahub.base.basicservice.controller.BSOssController.removeTempFiles()', 'DELETE', 1, 'test', '', '/oss/removeTempFiles/undefined', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:33:51', 0);
INSERT INTO `sys_oper_log` VALUES (1611627166895255554, 'OSS对象存储', 1, 'com.erahub.base.basicservice.controller.BSOssController.upload()', 'POST', 1, 'test', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":null,\"fileName\":\"8b797c5f70d446bc92b4fb3abaead814.jpg\",\"originalName\":\"-3db93c10377e7f7b.jpg\",\"fileSuffix\":\".jpg\",\"url\":null,\"createTime\":null,\"createBy\":null,\"service\":null,\"contentType\":\"image/jpeg\"}}', 0, '', '2023-01-07 15:33:54', 1);
INSERT INTO `sys_oper_log` VALUES (1611627175162228738, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.edit()', 'PUT', 1, 'test', '', '/article', '127.0.0.1', '', '{\"createBy\":\"test\",\"createTime\":\"2023-01-07 15:33:46\",\"updateBy\":\"test\",\"updateTime\":\"2023-01-07 15:33:46\",\"articleId\":\"1611627133785382913\",\"categoryId\":\"1605159324440162305\",\"tagId\":null,\"articleCover\":\"http://127.0.0.1:9000/erahub/2023/01/07/7dc99816bc314bf5aa81692cc9fddc14.jpg\",\"blogArticleImageBo\":{\"fileName\":\"8b797c5f70d446bc92b4fb3abaead814.jpg\",\"originalName\":\"-3db93c10377e7f7b.jpg\",\"fileSuffix\":\".jpg\",\"contentType\":\"image/jpeg\"},\"articleTitle\":\"casas\",\"articleContent\":\"aca\",\"isTop\":\"0\",\"isFeatured\":\"0\",\"isDelete\":\"0\",\"status\":\"1\",\"type\":\"3\",\"originalUrl\":\"啊撒擦撒\",\"tagIds\":[\"1605165450388885506\"]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:33:56', 43);
INSERT INTO `sys_oper_log` VALUES (1611627187673837570, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611627133785382913', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:33:59', 18);
INSERT INTO `sys_oper_log` VALUES (1611627196502847489, '博客文章', 2, 'com.erahub.blog.controller.BlogArticleController.delete()', 'DELETE', 1, 'test', '', '/article/1611618575421370369', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:34:01', 5);
INSERT INTO `sys_oper_log` VALUES (1611627233815375874, '博客文章', 3, 'com.erahub.blog.controller.BlogArticleController.remove()', 'DELETE', 1, 'test', '', '/article/remove/1611618575421370369,1611627133785382913', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-07 15:34:10', 56);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 18:39:04', '管理员');
INSERT INTO `sys_role` VALUES (3, '本部门及以下', 'test1', 3, '4', 1, 1, '0', '2', 'admin', '2022-09-10 17:10:57', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '仅本人', 'test2', 4, '5', 1, 1, '0', '2', 'admin', '2022-09-10 17:10:57', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (1569245300584591362, 'test01', 'test01', 3, '1', 1, 1, '0', '2', 'admin', '2022-09-12 16:43:29', 'admin', '2022-11-05 18:39:07', NULL);
INSERT INTO `sys_role` VALUES (1575818848019136513, '11111', '1111', 11, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:04:25', 'admin', '2022-09-30 20:04:25', NULL);
INSERT INTO `sys_role` VALUES (1575820925898309634, '111', '111', 111, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:12:41', 'admin', '2022-09-30 20:12:41', NULL);
INSERT INTO `sys_role` VALUES (1575821813400453122, '222', '222', 222, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:16:12', 'admin', '2022-09-30 20:16:12', NULL);
INSERT INTO `sys_role` VALUES (1575826547146485762, 'zzz', 'zzz', 11, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:35:01', 'admin', '2022-09-30 20:35:01', NULL);
INSERT INTO `sys_role` VALUES (1575832652555735042, '11', '11', 11, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:59:17', 'admin', '2022-09-30 20:59:17', NULL);
INSERT INTO `sys_role` VALUES (1575836920754982913, '111', '11', 11, '1', 1, 1, '0', '2', 'admin', '2022-09-30 21:16:14', 'admin', '2022-09-30 21:16:14', NULL);
INSERT INTO `sys_role` VALUES (1575838078710042626, '22', '22', 22, '1', 1, 1, '0', '2', 'admin', '2022-09-30 21:20:50', 'admin', '2022-09-30 21:20:50', NULL);
INSERT INTO `sys_role` VALUES (1588844816627372034, '管理员', 'common', 2, '1', 1, 1, '0', '0', 'admin', '2022-11-05 18:44:58', 'admin', '2023-01-07 10:02:29', NULL);
INSERT INTO `sys_role` VALUES (1588845036673142786, 'test01', 'test01', 3, '1', 1, 1, '0', '0', 'admin', '2022-11-05 18:45:51', 'admin', '2022-12-17 08:58:06', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 2);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 3);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 5);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 100);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 101);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 102);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 103);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 104);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 105);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 106);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 107);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 108);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 109);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 110);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 111);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 112);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 113);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 114);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 115);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 118);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 500);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 501);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1001);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1002);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1003);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1004);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1005);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1006);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1007);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1008);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1009);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1010);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1011);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1012);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1013);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1014);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1015);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1016);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1017);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1018);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1019);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1020);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1021);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1022);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1023);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1024);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1025);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1026);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1027);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1028);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1029);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1030);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1031);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1032);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1033);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1034);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1035);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1036);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1037);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1038);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1039);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1040);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1041);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1042);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1043);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1044);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1045);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1046);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1047);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1048);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1050);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1055);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1056);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1057);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1058);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1059);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1060);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1600);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1601);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1602);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1603);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1570009901798481921);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1570010319794429953);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1570022388644143106);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1570758202780676098);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1572393811995209730);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1588077119135821826);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1588092486994432002);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1588742925398171649);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1591655291324977153);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1591655913331871746);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1591657525559414786);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1591657626285625346);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051072);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051073);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051074);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051075);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051076);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051077);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604778822075994114);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795648);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795649);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795650);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795651);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795652);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795653);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998848);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998849);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998850);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998851);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998852);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998853);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609385420790530049);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609385690836598786);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265792);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265793);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265794);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265795);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265796);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265797);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609400747695906817);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609738660390871042);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609738937630171137);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609739163833180161);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609739421833207810);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 2);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 3);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 100);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 101);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 102);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 103);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 104);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 105);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 106);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 107);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 108);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 109);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 110);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 111);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 112);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 113);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 115);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 118);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 500);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 501);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1001);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1002);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1003);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1004);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1005);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1006);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1007);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1008);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1009);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1010);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1011);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1012);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1013);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1014);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1015);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1016);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1017);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1018);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1019);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1020);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1021);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1022);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1023);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1024);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1025);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1026);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1027);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1028);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1029);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1030);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1031);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1032);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1033);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1034);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1035);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1036);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1038);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1040);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1041);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1042);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1043);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1044);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1045);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1046);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1047);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1048);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1050);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1055);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1600);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1601);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1570009901798481921);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1570010319794429953);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1570022388644143106);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1570758202780676098);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1572393811995209730);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1588742925398171649);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1591655291324977153);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1591655913331871746);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1591657525559414786);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'erahub', 'sys_user', '123456@163.com', '13912345678', '0', 'http://127.0.0.1:9000/erahub/2022/12/11/49b8cc3fe7d0461f8c44f02d3ef830c7.jpg', '$2a$10$AzrC.0tmwFX.ML5E1KfcoOz.4o3zii06W/52Gwvic/G..jU3dUwS6', '0', '0', '127.0.0.1', '2022-09-10 17:10:48', 'admin', '2022-09-10 17:10:48', 'admin', '2023-01-05 18:33:32', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'lionli', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2022-09-10 17:10:48', 'admin', '2022-09-10 17:10:48', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', '', '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '2', '127.0.0.1', '2022-09-10 17:10:57', 'admin', '2022-09-10 17:10:57', 'admin', '2022-09-11 08:41:22', NULL);
INSERT INTO `sys_user` VALUES (4, 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', '', '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '2', '127.0.0.1', '2022-09-10 17:10:57', 'admin', '2022-09-10 17:10:57', 'test1', '2022-09-10 17:10:57', NULL);
INSERT INTO `sys_user` VALUES (5, 101, 'test03', 'test03', 'sys_user', '', '', '0', '', '$2a$10$FH9R/Swubpy/0Shjly10Ref8Qd3X2F6W.b7mi8Ft3fZJ/8VYTqOCW', '0', '2', '', NULL, 'admin', '2022-09-12 19:56:26', 'admin', '2022-09-12 19:56:26', NULL);
INSERT INTO `sys_user` VALUES (6, 101, 'test04', 'test04', 'sys_user', '', '', '0', '', '$2a$10$FH9R/Swubpy/0Shjly10Ref8Qd3X2F6W.b7mi8Ft3fZJ/8VYTqOCW', '0', '2', '', NULL, 'admin', '2022-09-12 19:56:26', 'admin', '2022-09-12 19:56:26', NULL);
INSERT INTO `sys_user` VALUES (1569245585432358914, 109, 'test01', 'test01', 'sys_user', '', '', '0', 'http://127.0.0.1:9000/erahub/2022/11/03/f7b4be827e554cb0ac4ac31fb16b0c33.jpg', '$2a$10$dkRxXcQOGg8VviVsdmvzCOOqWNAJWPainhFcGNIcaQ/Sq0WsGC33a', '0', '2', '', NULL, 'admin', '2022-09-12 16:44:37', 'admin', '2022-11-05 18:37:56', NULL);
INSERT INTO `sys_user` VALUES (1569246527183630337, 100, 'test02', 'test02', 'sys_user', '', '', '0', '', '$2a$10$b23OzYJjt0x7fVMYhHJNDej3R9DWP2MFa83LdcZY9ArhobhfstxWm', '0', '2', '', NULL, 'admin', '2022-09-12 16:48:22', 'admin', '2022-11-05 18:37:53', NULL);
INSERT INTO `sys_user` VALUES (1569254790117699586, 108, 'test03', 'test03', 'sys_user', '', '', '0', '', '$2a$10$bMaY30XqbcZ3lxc/1OK7eugTJRXFwBQyEni9YQwBKT7fWdz.nKTwe', '0', '2', '', NULL, 'admin', '2022-09-12 17:21:12', 'admin', '2022-09-12 17:21:12', NULL);
INSERT INTO `sys_user` VALUES (1588845214859759618, 104, 'test', '管理员', 'sys_user', '1234@sss.com', '15712344556', '0', 'http://127.0.0.1:9000/erahub/2022/12/02/7029e494212e48a58aefad46e1bb4cc0.jpg', '$2a$10$8m9WcC1OBtip3nMPrT7lpOgP0kGGrd2VGj5ErKWMQxua/jJlpymyK', '0', '0', '', NULL, 'admin', '2022-11-05 18:46:33', 'admin', '2023-01-07 10:02:40', NULL);
INSERT INTO `sys_user` VALUES (1588845286838210561, 106, 'test01', 'test01', 'sys_user', '', '', '0', 'http://127.0.0.1:9000/erahub/2022/12/14/89eb1fba4cf046f2b190a81d80ea4c8f.jpg', '$2a$10$5xbv8WSwyVvxOspxfXK4QuUKC5Scrv8ZIxvrSOT99EBohYDAVTzGK', '0', '0', '', NULL, 'admin', '2022-11-05 18:46:50', 'admin', '2022-12-14 19:01:05', NULL);
INSERT INTO `sys_user` VALUES (1604081020035493890, NULL, 'erahub', 'admin', 'sys_user', '', '', '0', '', '$2a$10$oYN9L232rM4vpVZYcdnnY.Sy0U4.fopgrjJ3rMlkzkBgsgezKtPTi', '0', '2', '', NULL, 'admin', '2022-12-17 19:48:12', 'admin', '2022-12-17 19:48:12', NULL);
INSERT INTO `sys_user` VALUES (1604081128693133313, NULL, 'erahub', 'erahuhb', 'sys_user', '', '', '0', '', '$2a$10$6wfm6Gb0FfajvoBcZhccReH7/PZHdM6y5ROUMwaBzqNYA7s0aEt/i', '0', '2', '', NULL, 'admin', '2022-12-17 19:48:38', 'admin', '2022-12-17 19:48:38', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (1588845214859759618, 4);
INSERT INTO `sys_user_post` VALUES (1588845286838210561, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1588845214859759618, 1588844816627372034);
INSERT INTO `sys_user_role` VALUES (1588845286838210561, 1588845036673142786);

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '排序号',
  `test_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(0) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_demo
-- ----------------------------
INSERT INTO `test_demo` VALUES (1, 102, 4, 1, '测试数据权限', '测试', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (2, 102, 3, 2, '子节点1', '111', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (3, 102, 3, 3, '子节点2', '222', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (4, 108, 4, 4, '测试数据', 'demo', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (5, 108, 3, 13, '子节点11', '1111', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (6, 108, 3, 12, '子节点22', '2222', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (7, 108, 3, 11, '子节点33', '3333', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (8, 108, 3, 10, '子节点44', '4444', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (9, 108, 3, 9, '子节点55', '5555', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (10, 108, 3, 8, '子节点66', '6666', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (11, 108, 3, 7, '子节点77', '7777', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (12, 108, 3, 6, '子节点88', '8888', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (13, 108, 3, 5, '子节点99', '9999', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父id',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(0) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试树表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES (1, 0, 102, 4, '测试数据权限', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (2, 1, 102, 3, '子节点1', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (3, 2, 102, 3, '子节点2', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (4, 0, 108, 4, '测试树1', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (5, 4, 108, 3, '子节点11', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (6, 4, 108, 3, '子节点22', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (7, 4, 108, 3, '子节点33', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (8, 5, 108, 3, '子节点44', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (9, 6, 108, 3, '子节点55', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (10, 7, 108, 3, '子节点66', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (11, 7, 108, 3, '子节点77', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (12, 10, 108, 3, '子节点88', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (13, 10, 108, 3, '子节点99', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);

-- ----------------------------
-- Table structure for to_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `to_gen_table`;
CREATE TABLE `to_gen_table`  (
  `table_id` bigint(0) NOT NULL COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of to_gen_table
-- ----------------------------
INSERT INTO `to_gen_table` VALUES (1600469115549192194, 'blog_user', '博客用户信息表', NULL, NULL, 'BlogUser', 'crud', 'com.erahub.base', 'base', 'user', '博客用户信息', 'erahub', '0', '/', NULL, 'admin', '2022-12-03 13:39:50', 'admin', '2022-12-03 13:39:50', NULL);
INSERT INTO `to_gen_table` VALUES (1604032297792282626, 'blog_article', '博客文章表', NULL, NULL, 'BlogArticle', 'crud', 'com.erahub.blog', 'blog', 'article', '博客分类', 'erahub', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1604778822075994114\"}', 'admin', '2022-12-17 16:34:22', 'admin', '2022-12-20 18:39:09', NULL);
INSERT INTO `to_gen_table` VALUES (1605139861862977537, 'blog_category', '博客分类表', NULL, NULL, 'BlogCategory', 'crud', 'com.erahub.blog', 'blog', 'category', '博客分类', 'erahub', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1604778822075994114\"}', 'admin', '2022-12-20 17:54:08', 'admin', '2022-12-20 18:47:39', NULL);
INSERT INTO `to_gen_table` VALUES (1605165953176932354, 'blog_article_tag', '博客文章和标签关联表', NULL, NULL, 'BlogArticleTag', 'crud', 'com.erahub.base', 'base', 'tag', '博客文章和标签关联', 'erahub', '0', '/', NULL, 'admin', '2022-12-20 17:48:52', 'admin', '2022-12-20 17:48:52', NULL);
INSERT INTO `to_gen_table` VALUES (1609381755329544193, 'biz_finance_erp_project', 'ERP工程明细表', NULL, NULL, 'FinanceERPProject', 'crud', 'com.erahub.business.finance', 'business', 'finance:erpproject', 'ERP工程明细', 'erahub', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1609385690836598786\"}', 'admin', '2023-01-01 10:43:23', 'test', '2023-01-07 10:07:45', NULL);

-- ----------------------------
-- Table structure for to_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `to_gen_table_column`;
CREATE TABLE `to_gen_table_column`  (
  `column_id` bigint(0) NOT NULL COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of to_gen_table_column
-- ----------------------------
INSERT INTO `to_gen_table_column` VALUES (1600469115616301057, 1600469115549192194, 'blog_user_id', '博客用户ID', 'bigint', 'Long', 'blogUserId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301058, 1600469115549192194, 'email', '邮箱号', 'varchar(50)', 'String', 'email', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301059, 1600469115549192194, 'blog_user_name', '博客用户名称', 'varchar(30)', 'String', 'blogUserName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301060, 1600469115549192194, 'nick_name', '博客用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301061, 1600469115549192194, 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301062, 1600469115549192194, 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301063, 1600469115549192194, 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301064, 1600469115549192194, 'intro', '用户简介', 'varchar(255)', 'String', 'intro', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301065, 1600469115549192194, 'website', '个人网站', 'varchar(255)', 'String', 'website', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301066, 1600469115549192194, 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301067, 1600469115549192194, 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301068, 1600469115549192194, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301069, 1600469115549192194, 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301070, 1600469115549192194, 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301071, 1600469115549192194, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301072, 1600469115549192194, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301073, 1600469115549192194, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301074, 1600469115549192194, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301075, 1600469115549192194, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282627, 1604032297792282626, 'id', '文章ID', 'int', 'Long', 'id', '1', '1', '1', NULL, '0', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282628, 1604032297792282626, 'user_id', '作者ID', 'int', 'Long', 'userId', '0', '0', '1', '0', '0', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282629, 1604032297792282626, 'category_id', '文章分类ID', 'int', 'Long', 'categoryId', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282630, 1604032297792282626, 'article_cover', '文章缩略图', 'varchar(1024)', 'String', 'articleCover', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 4, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282631, 1604032297792282626, 'article_title', '标题', 'varchar(50)', 'String', 'articleTitle', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282632, 1604032297792282626, 'article_content', '内容', 'longtext', 'String', 'articleContent', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'editor', '', 6, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282633, 1604032297792282626, 'is_top', '置顶', 'tinyint(1)', 'Integer', 'isTop', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'blog_article_top', 7, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282634, 1604032297792282626, 'is_featured', '推荐', 'tinyint(1)', 'Integer', 'isFeatured', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'blog_article_featured', 8, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282635, 1604032297792282626, 'is_delete', '删除', 'tinyint(1)', 'Integer', 'isDelete', '0', '0', '1', '0', '0', '0', '0', 'EQ', 'radio', '', 9, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282636, 1604032297792282626, 'status', '状态', 'tinyint(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_status', 10, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282637, 1604032297792282626, 'type', '文章类型', 'tinyint(1)', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_type', 11, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282638, 1604032297792282626, 'password', '访问密码', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 12, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282639, 1604032297792282626, 'original_url', '原文链接', 'varchar(255)', 'String', 'originalUrl', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'input', '', 13, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282640, 1604032297792282626, 'create_time', '发表时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282641, 1604032297792282626, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 15, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1605139861938475009, 1605139861862977537, 'category_id', '分类ID', 'bigint', 'Long', 'categoryId', '1', '0', '1', NULL, '0', '1', '1', 'EQ', 'input', '', 1, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861938475010, 1605139861862977537, 'category_name', '分类名', 'varchar(30)', 'String', 'categoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861938475011, 1605139861862977537, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, '0', '0', 'EQ', 'input', '', 4, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861963640833, 1605139861862977537, 'create_time', '发表时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861963640834, 1605139861862977537, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861963640835, 1605139861862977537, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861963640836, 1605139861862977537, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 8, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605146769781002242, 1605139861862977537, 'status', '分类状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'blog_category_status', 3, 'admin', '2022-12-20 18:23:07', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605165953206292482, 1605165953176932354, 'article_id', '文章ID', 'bigint', 'Long', 'articleId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-12-20 19:39:20', 'admin', '2022-12-20 19:39:20');
INSERT INTO `to_gen_table_column` VALUES (1605165953206292483, 1605165953176932354, 'tag_id', '标签ID', 'bigint', 'Long', 'tagId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2022-12-20 19:39:20', 'admin', '2022-12-20 19:39:20');
INSERT INTO `to_gen_table_column` VALUES (1609381755354710018, 1609381755329544193, 'project_id', 'ERP工程ID', 'bigint', 'Long', 'projectId', '1', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041666, 1609381755329544193, 'project_number', 'ERP工单号', 'varchar(50)', 'String', 'projectNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041667, 1609381755329544193, 'requisition_number', 'ERP请购单号', 'varchar(50)', 'String', 'requisitionNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041668, 1609381755329544193, 'device_name', 'ERP装置名称', 'varchar(255)', 'String', 'deviceName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 4, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041669, 1609381755329544193, 'project_name', 'ERP工程名称', 'varchar(255)', 'String', 'projectName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 5, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041670, 1609381755329544193, 'plan_type', '计划类别', 'varchar(255)', 'String', 'planType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', '', 6, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041671, 1609381755329544193, 'department', '单位', 'varchar(255)', 'String', 'department', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207489, 1609381755329544193, 'settlement_review_amount', '结算审核额', 'decimal(60,0)', 'BigDecimal', 'settlementReviewAmount', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207490, 1609381755329544193, 'contract_number', '合同编号', 'varchar(255)', 'String', 'contractNumber', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207491, 1609381755329544193, 'project_type', '工程类别', 'varchar(255)', 'String', 'projectType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', '', 10, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207492, 1609381755329544193, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207493, 1609381755329544193, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207494, 1609381755329544193, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207495, 1609381755329544193, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207496, 1609381755329544193, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2023-01-01 10:51:26', 'test', '2023-01-07 10:07:45');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint(0) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(0) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
