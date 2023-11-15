mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

all: up run down

up:
	docker run --rm -e POSTGRES_PASSWORD=root -d -v"$(current_dir):/app" --name=postgres-test postgres:alpine
	echo "Waiting postgres booting..."
	sleep 30

down:
	docker stop $(shell docker ps -a -q --filter="name=postgres-test" --format="{{.ID}}")

run:
	docker exec $(shell docker ps -a -q --filter="name=postgres-test" --format="{{.ID}}") bash -c "psql -U postgres < /app/smooth.sql"
