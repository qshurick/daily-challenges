mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
image := "prudge/pascal"

all: build run

build:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image) fpc vowels.pas

run:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image) ./vowels
