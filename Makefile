down:
	docker-compose down

up:
	docker-compose up -d

full:
	make down
	sleep 10
	make up