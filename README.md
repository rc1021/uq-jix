```
ssh uqjix 
cd uq-jix/
git fetch --all
git pull origin 
docker-compose build
docker tag fpm-alpine-7.4/uq-jix rc701021/uq-jix:2.0.5
docker tag fpm-alpine-7.4/uq-jix rc701021/uq-jix:latest
cd ..
docker-compose up -d
docker exec -it ec2-user_webapp_1 php artisan storage:link

```
