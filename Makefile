#build:
#	docker build . -t laravel-8
#
#run:
#	docker run -dp 8080:80 -v /home/francisco/dev/laravel-8-practice-1:/var/www/html/ --name laravel-p laravel-8
#
#stop:
#	docker stop laravel-p
#	docker rm laravel-p
#
#login-php:
#	docker exec -it laravel-p /bin/bash
#
#chmod-storage:
#	sudo chmod -R 777 storage/

build:
	docker-compose -f docker-compose.yml build

up:
	docker-compose -f docker-compose.yml up -d

start:
	docker-compose -f docker-compose.yml start

down:
	docker-compose -f docker-compose.yml down

destroy:
	docker-compose -f docker-compose.yml down -v

stop:
	docker-compose -f docker-compose.yml stop

restart:
	docker-compose -f docker-compose.yml stop
	docker-compose -f docker-compose.yml up -d
ps:
	docker-compose -f docker-compose.yml ps

logs:
	docker-compose -f docker-compose.yml logs --tail=100 -f

logs-php:
	docker-compose -f docker-compose.yml logs --tail=100 -f php

login-php:
	docker-compose -f docker-compose.yml exec php sh

logs-mysql:
	docker-compose -f docker-compose.yml logs --tail=100 -f mysql

login-mysql:
	docker-compose -f docker-compose.yml exec mysql /bin/bash

migrate:
	docker-compose exec php php artisan migrate

migrate-refresh:
	docker-compose exec php php artisan migrate:refresh

migrate-rollback:
	docker-compose exec php php artisan migrate:rollback
