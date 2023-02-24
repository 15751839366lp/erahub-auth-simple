@echo off

start cmd /k "wmic process where "name like '%java%'" delete"

