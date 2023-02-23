@echo off

start cmd /k "cd/d E:\Program\java\minio && minio.exe server E:\Program\java\minio\minioData"

start cmd /k "cd/d E:\Program\tools\software\Redis && redis-server redis.windows.conf"

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-visual\erahub-nacos-dev\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -jar erahub-nacos-dev.jar 8848"

timeout /nobreak /t 30

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-visual\erahub-seata-server\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -jar erahub-seata-server.jar"

timeout /nobreak /t 30

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-modules\erahub-base\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -Dserver.port=9201 -jar erahub-base.jar" 

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-modules\erahub-biz\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -Dserver.port=9201 -jar erahub-biz.jar" 

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-auth\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -Dserver.port=9201 -jar erahub-auth.jar" 

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-gateway\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -Dserver.port=9201 -jar erahub-gateway.jar" 