sudo docker run -p 3000:3000 --restart always -e RDS_HOSTNAME=${rds_hostname} -e RDS_USERNAME=${rds_username} -e RDS_PASSWORD=${rds_password} -e RDS_PORT=${rds_port} -e RDS_DB_NAME=${rds_db_name} -d app-layer:latest