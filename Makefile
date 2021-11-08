
DOCK_COM = sudo docker-compose
DOCK = sudo docker
USER = asaadi
RM = sudo /usr/bin/rm -rf
YML = ./srcs/docker-compose.yaml

all: create_start

create_start:
	@echo "\033[4;37mCreating and starting containers\033[0m... "
	@$(DOCK_COM) -f $(YML) build
	@$(DOCK_COM) -f $(YML) up
	@echo "\033[1;32m\tdone\033[0m"
	

stop:
	$(DOCK_COM) -f $(YML) stop

restart:
	@echo -n "\033[4;37mRestarting containers\033[0m... "
	@$(DOCK_COM) -f $(YML) restart
	@echo "\033[1;32m\tdone\033[0m"

display:
	@echo "\033[4;37mDisplaying containers and images\033[0m "
	@$(DOCK_COM) -f $(YML) ps -a
	@echo "\n"
	@$(DOCK_COM) -f $(YML) images
	@echo "\n"
	@sudo docker ps -a
	@echo "\n"
	@sudo docker images -a

clean:
	@echo "\033[4;37mStoping and removing containers, networks, images\033[0m... " 
	@$(DOCK_COM) -f $(YML) down
	@$(DOCK_COM) -f $(YML) rm
	@echo "\033[1;32m\tdone\033[0m"

fclean: clean
	@echo "\033[4;37mRemoving host-volumes\033[0m... " 
	@$(RM) ~/data/wp-data/*
	@$(RM) ~/data/db-data/*
	@echo "\033[1;32m\tdone\033[0m"

re: fclean all