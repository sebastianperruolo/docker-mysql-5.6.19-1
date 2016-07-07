# docker-mysql-5.6.19-1
Docker image with MySQL 5.6.19-1 based on Docker Official Image packaging for MySQL Community Server https://dev.mysql.com/

## Build image

Download this project and go to the directory on a terminal, then run:

```bash
docker build -t mysql5619:1 .
```

## Create container

First we need to create the directory where the DB files are going to be stored:

```bash
sudo mkdir /var/lib/mysql5619
```

Then we need to run the following command in order to create the container:

```bash
docker run --name mysql5619i -v /var/lib/mysql5619:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql5619:1
```

NOTE: you could change the container's name, the root password, or the path for the DB files.



