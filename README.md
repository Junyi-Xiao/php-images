# php-images
自用的 php 相关镜像 Dockerfile

> https://hub.docker.com/r/xiaojunyi/php-fpm  
https://hub.docker.com/r/xiaojunyi/nginx

## 使用示例

### docker-compose

简单示例可见此项目 `example/docker-compose/`

```bash
cd example/docker-compose/
docker-compose up -d
```

浏览器访问：http://127.0.0.1:8080/phpinfo.php ，即可见`phpinfo()`的输出
> 如果在非本地环境（虚拟机或线上 ECS），对应修改 127.0.0.1 即可
