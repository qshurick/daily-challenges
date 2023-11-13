mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

all: up run down

up:
	docker run --rm -e MYSQL_ROOT_PASSWORD=root -d -v"$(current_dir):/app" --name=mysql-test mysql
	echo "Waiting mysql booting..."
	sleep 30

down:
	docker stop $(shell docker ps -a -q --filter="name=mysql-test" --format="{{.ID}}")

run:
	docker exec $(shell docker ps -a -q --filter="name=mysql-test" --format="{{.ID}}") bash -c "mysql -proot < /app/legendre.sql"
