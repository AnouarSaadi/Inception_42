
DOCK_COM = sudo docker-compose
DOCK_RMALL = sudo docker system prune -a
USER = asaadi


all:
	sudo usermod -aG sudo $(USER)
	build_run

build_run:
	$(DOCK_COM) -f ./srcs/docker-compose.yaml up

clean:
	$(DOCK_RMALL)
	@/usr/bin/rm -rf ~/data/wp-data/*
	@/usr/bin/rm -rf ~/data/db-data/*

