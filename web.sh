sudo docker run --restart always -e APPLICATION_LOAD_BALANCER=${application_load_balancer} -p 3000:3000 -d web-layer:latest