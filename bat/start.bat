@echo off

start cmd /k "cd/d E:\Program\java\minio && minio.exe server E:\Program\java\minio\minioData"

start cmd /k "cd/d E:\Program\tools\software\Redis && redis-server redis.windows.conf"

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-visual\erahub-nacos-dev\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -jar -Xms256m -Xmx512m erahub-nacos-dev.jar 8848"

timeout /nobreak /t 15

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-visual\erahub-seata-server\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -jar -Xms256m -Xmx512m erahub-seata-server.jar"

timeout /nobreak /t 15

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-modules\erahub-base\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -Dserver.port=9201 -jar -Xms256m -Xmx512m erahub-base.jar" 

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-modules\erahub-biz\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -Dserver.port=9205 -jar -Xms256m -Xmx512m erahub-biz.jar" 

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-auth\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -Dserver.port=9210 -jar -Xms256m -Xmx512m erahub-auth.jar" 

start cmd /k "cd/d E:\Program\java\project\erahub-auth-simple\erahub-auth-simple\erahub-gateway\target && java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -Dserver.port=8080 -jar -Xms256m -Xmx512m erahub-gateway.jar" 