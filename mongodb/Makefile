mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

all: up run down

up:
	docker run --rm -d -v"$(current_dir):/app" --name=mongodb-test mongo
	echo "Waiting mongodb booting..."
	sleep 10

down:
	docker stop $(shell docker ps -a -q --filter="name=mongodb-test" --format="{{.ID}}")

run:
	docker exec $(shell docker ps -a -q --filter="name=mongodb-test" --format="{{.ID}}") bash -c "mongosh -f /app/setup.js --shell < /app/uncensored.js"
