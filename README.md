centos：centos6
----------------



 build dockerfile
------------------
 docker build -t kent/centos-ssh ./
 
 
 example
-----------------
 docker run -d -p 22223:22 kent/centos-ssh


Use ssh connect to container
-------------------------------
ssh root@ip_adress -p 22223
