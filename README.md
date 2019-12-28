# mbbak
mbbak is simple mariadb backup tool

# Usage
## Backup All database
```sh
docker run --rm -e DB_HOST=my-db -e DB_PASSWORD=mypassword -v <docker_host_dir>:/backup origuchi4k/mbbak
```

## Specify database name and user
```sh
docker run --rm -e DB_HOST=my-db -e DB_PASSWORD=mypassword -e DB_NAME=dbname -e DB_USER=dbuser -v <docker_host_dir>:/backup origuchi4k/mbbak
```

## Change backup file owner
```sh
docker run --rm -e UID=docker_host_uid -e DB_HOST=my-db -e DB_PASSWORD=mypassword -v <docker_host_dir>:/backup origuchi4k/mbbak
```
