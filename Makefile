USERID = `id -u`
USERNAME = `id -un`
GROUPID = `id -g`
GROUPNAME = `id -gn`

default: help

help:
	@echo "\n\
	    \e[1;1;33mSome Help needed?\e[0m\n\n\
	    \e[1;1;32mmake setup\e[0m - Prefills the .env file with sync required parameters \n\
	        and prepares all modifieble custom files from dist. Run this \n\
	        once before everything!\n\
	    \e[1;1;32mmake file=... addservice\e[0m - Prepend file contents to current docker-compose.yml file\n\n\
	    \e[1;1;32mmake up\e[0m - Start all configured containers (have you run setup command already?)!\n\
	    \e[1;1;32mmake down\e[0m - Stop all configured containers\n\n\
	    \e[1;1;32mmake examples\e[0m - Copy example files to source for trying basic box functionality\n\
	    \e[1;1;32mmake php\e[0m - Connect to php container shell\n\
	    \e[1;1;32mmake node\e[0m - Connect to node container shell\n\
	"

setup:
	@cat .env.dist | \
		sed "s/<userId>/$(USERID)/;\
		     s/<userName>/$(USERNAME)/;\
		     s/<groupId>/$(GROUPID)/;\
		     s/<groupName>/$(GROUPNAME)/"\
		> .env
	@cp -n containers/httpd/project.conf.dist containers/httpd/project.conf
	@cp -n containers/php-fpm/custom.ini.dist containers/php-fpm/custom.ini
	@make setupservices
	@./recipes/default/example/run.sh
	@echo "Setup done! Proceed with \e[1;1;32mmake up\e[0m"

up:
	docker-compose up --build -d

down:
	docker-compose down --remove-orphans

php:
	docker-compose exec php bash

node:
	docker-compose run --rm node bash

addservice:
	@cat $(file) >> docker-compose.yml
	@echo "\n" >> docker-compose.yml
	@echo "Service file $(file) contents added\n";

setupservices:
	@make file=docker-compose.yml.dist addservice
	@make file=services/apache.yml addservice
	@make file=services/php.yml addservice
	@make file=services/mysql.yml addservice
