COMPOSE_CMD = docker compose -f ./src/docker-compose.yml

mandatory:
	@$(COMPOSE_CMD) up --build mariadb nginx wordpress $(SERVICE) 

up :
	@$(COMPOSE_CMD) up --build $(SERVICE)

down :
	@$(COMPOSE_CMD) down $(SERVICE)

stop :
	@$(COMPOSE_CMD) stop $(SERVICE)

start :
	@$(COMPOSE_CMD) start $(SERVICE)

ps :
	@$(COMPOSE_CMD) ps

.PHONY : up down stop start ps