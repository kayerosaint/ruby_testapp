# DEVELOPMENT TARGETS
setup: destroy_shell build_shell prepare_shell up

destroy_shell:
	docker-compose down -v

build_shell:
	docker-compose build

prepare_shell:
	docker-compose run --rm web bash -c "make prepare"

up:
	docker-compose run --rm --service-ports --use-aliases web

shell:
	docker-compose run --rm web bash

toolbox:
	docker-compose run --rm toolbox bash

prepare_bundle:
	bundle -j 4

prepare_db:
	bundle exec rails db:create db:migrate

prepare: prepare_bundle prepare_db

check: test_web lint_web

lint_web:
	bundle exec rubocop -a

test_web:
	bundle exec rake test
