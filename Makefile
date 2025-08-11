
COMPOSE_CMD = docker-compose -f ./src/docker-compose.yml

up :
	@$(COMPOSE_CMD) up --build

down :
	@$(COMPOSE_CMD) down

stop :
	@$(COMPOSE_CMD) stop

start :
	@$(COMPOSE_CMD) start

ps :
	@$(COMPOSE_CMD) ps

.PHONY : up down stop start ps