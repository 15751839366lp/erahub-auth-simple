@echo off

start cmd /k "cd/d E:\Program\java\minio && minio.exe server E:\Program\java\minio\minioData"

start cmd /k "cd/d E:\Program\tools\software\Redis && redis-server redis.windows.conf"
