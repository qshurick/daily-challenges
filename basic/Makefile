mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

run:
	docker run --rm -it -w /app -v"$(current_dir):/app" my-basic bas hello.bas

build-image:
	docker build --file build/Dockerfile --tag my-basic:latest build/
