mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

run: build
	./main

build:
	docker run -it --rm -w /app -v "$(current_dir):/app" rust rustc main.rs
