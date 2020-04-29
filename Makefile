build: 
	@docker build --no-cache -t dgmora/menu .

clean:
	@docker-compose down -v --remove-orphans
	@docker-compose rm -vfs
	@if docker volume inspect dbdata | grep 'Mountpoint'; then\
		echo "Removing DBData";\
        docker volume rm -f dbdata;\
	fi

console:
	@docker-compose exec app bundle exec rails c || docker-compose run --rm app bin/spring rails c

fresh:
	@docker-compose down
	@docker volume create --name=dbdata
	@docker-compose run app bundle exec rake db:create db:schema:load db:migrate db:seed db:test:prepare

guard:
	@docker-compose run --rm app bundle exec guard

init: clean build fresh

shell:
	@docker-compose exec app bash || docker-compose run --rm app bash

test:
	@docker-compose run --rm app bundle exec rspec

server:
	@docker-compose up
