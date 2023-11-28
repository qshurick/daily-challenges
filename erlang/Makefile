mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
input := "one plus one"

all: build run

build:
	docker run -it --rm -w /app -v"$(current_dir):/app" erlang erlc -W math.erl

clean:
	rm -rf *.beam

run:
	docker run -it --rm -w /app -v"$(current_dir):/app" erlang escript main.escript $(input)
