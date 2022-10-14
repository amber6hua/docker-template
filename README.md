# docker-template

#### 介绍
php+nginx+mysql+redis的docker环境

自用的Fastadmin（基于TP5框架） docker环境


### 说明

## 自动化启动

> docker-compose.yml 定义了端口|映射|命令等内容 (可根据需要自定义,注意端口不要冲突)
> up.sh 启动docker容器
> down.sh 停止docker容器

### 使用方法
> 常规方式
- 把 docker-template/ 下的所有文件和目录，复制到项目根目录下(不包括docker-template)
- 在根目录下执行启动停止
- sh up.sh 或 docker-compose up --remove-orphans -d
- sh down.sh 或 docker-compose down

> 也可以把整个 docker-template/ 把含这个目录，复制到项目根目录下(包括docker-template)
- 并且做了些小修改，如 docker-compose-v2.yml (把nginx和php的项目映射目录改成上级)
- 在根目录下执行启动停止
- docker-compose -f ./docker-template/docker-compose-v2.yml -p projectname up --remove-orphans -d
- docker-compose -f ./docker-template/docker-compose-v2.yml -p projectname down
- 可以自行复制上面的命令，写入sh中,方便在项目根目录启动、停止

:::info
-f：指定使用的compose模板文件，默认为当前目录下的docker-compose.yaml文件，可以多次指定。
-p：指定项目的名称，默认将使用所在目录名称作为项目名。
:::

### 环境说明

## php

> Dockerfile 定义了我构建的php (可根据需要自定义)
> docker_build_php_fpm.sh 构建脚本
> 也可以直接使用 gettingfat/om-php-fpm:0.01 上传在dockerhub上的镜像，或自己上传
> ./php/conf.d/security.ini 定义了php的基本配置 (可根据需要自定义)

## nginx

> ./nginx/conf.d/admin.app.conf 定义了nginx web配置 (可根据需要自定义)
> ./nginx/log 日志保存的目录

## redis

> ./redis/conf/redis.conf redis的基本配置,如设置密码 requirepass youpassword (可根据需要自定义)
> ./redis/data 数据的保存目录
> ./redis/log 日志保存的目录

## mysql

> ./mysql/conf.d/slow_query_log.cnf 定义mysql额外配置 (可根据需要自定义)
> ./mysql/data 数据的保存目录
> ./mysql/setup 存放sql和基本脚本的目录

+ ./mysql/setup/sql/init-user.sql 删除root权限 新建一个用户并设置密码 (可根据需要自定义)
+ ./mysql/setup/sql 可把项目数据库的sql文件存放在这里
+ 可以通过sh脚本 导入数据库和修改mysql用户权限
+ 也可以直接执行命令

### 注意事项

> 需要注意端口不要冲突
> 需要注意mysql和redis密码
> 填写数据库链接配置时 hostname=mysql 填写docker-compose.yml 定义的服务名 (如admin-php-fpm、mysql)
