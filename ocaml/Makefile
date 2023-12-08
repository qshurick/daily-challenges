mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
image := "ocaml/opam"

all: build run

build:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image) ocamlc -o runme broken_keyboard.ml

run:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image) ./runme

shell:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image) 

