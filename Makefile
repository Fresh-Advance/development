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
                 once before everything!\n\n\
	    \e[1;1;32mmake up\e[0m - Start the fun! :D\n\
	    \e[1;1;32mmake down\e[0m - Stop the fun! :(\n\n\
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
	@cp -n docker-compose.yml.dist docker-compose.yml
	@echo "Setup done! Proceed with \e[1;1;32mmake up\e[0m"

up:
	docker-compose up --build -d

down:
	docker-compose down

php:
	docker-compose exec php bash

node:
	docker-compose run --rm node bash