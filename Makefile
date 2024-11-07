NAME = inception
COMPOSE = ./srcs/docker-compose.yml

all: conf up

conf:
	@cp ~/.env ./srcs/
	@mkdir -p /home/dcarrilh/data/v_mariadb /home/dcarrilh/data/v_wordpress
	@sudo grep -Fq "dcarrilh.42.fr" /etc/hosts || sudo sed -i '/127\.0\.0\.1/ s/$$/ dcarrilh.42.fr/' /etc/hosts

up: conf
	docker compose -p $(NAME) -f $(COMPOSE) up --build -d

down:
	docker compose -p $(NAME) down --volumes

start:
	docker compose -p $(NAME) start

stop:
	docker compose -p $(NAME) stop

clean-images:
	docker rmi -f $$(docker images -q) || true

clean: down clean-images

fclean: clean
	@docker system prune -a
	@rm -f ./srcs/.env

re: fclean conf up
