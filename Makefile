stop:
	echo 'Clean dangling images, volumes and containers'
	docker-compose -f sensors/docker-compose.yml down
	docker stack rm prom
	docker images -qf dangling=true | xargs -r docker image rm -f
	docker volume ls -qf dangling=true | xargs -r docker volume rm -f
	# docker rm -v $(shell docker ps -a -q -f status=exited)
	#docker ps --filter status=dead --filter status=exited -aq | xargs -r docker rm -v

#$(eval export NORDVPN_USER=$(shell bash -c 'read -p "NORDVPN_USER: " pass; echo $$pass'))
#$(eval export NORDVPN_PSW=$(shell bash -c 'read -s -p "NORDVPN_PSW: " pass; echo $$pass'))
run:
	docker-compose up -d

full:
	make stop
	sleep 10
	make run