#!/bin/sh

[ -z ${DB_USER} ] && DB_USER=root
[ -z ${DB_NAME} ] && DB_NAME=all-databases

[ -z ${DB_HOST} ] && echo "Error: DB_HOST is invalid" && exit 1
[ -z ${DB_PASSWORD} ] && echo "Error: DB_PASSWORD is invalid" && exit 1
BACKUP_DIR=/backup/${DB_HOST}
BACKUP_FILE=backup_${DB_NAME}_$(date +"%Y%m%d_%h%M%s").sql
[ -d ${BACKUP_DIR} ] || mkdir -p ${BACKUP_DIR} || (echo "Error: Failed to create directory" && exit 1)

if [ ${DB_NAME} = "all-databases" ]; then
    mysqldump -h ${DB_HOST} --all-databases -u${DB_USER} -p${DB_PASSWORD} >${BACKUP_DIR}/${BACKUP_FILE}
    [ $? -ne 0 ] && echo "Error: Failed to create database backup" && exit 1
else
    mysqldump -h ${DB_HOST} ${DB_NAME} -u${DB_USER} -p${DB_PASSWORD} >${BACKUP_DIR}/${BACKUP_FILE}
    [ $? -ne 0 ] && echo "Error: Failed to create database backup" && exit 1
fi
[ -z ${UID} ] || chown -R ${UID}: ${BACKUP_DIR}
echo "Completed backup to ${BACKUP_DIR}/${BACKUP_FILE}"
exit 0
