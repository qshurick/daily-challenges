mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

all:
	docker run -it --rm -w /app -v"$(current_dir):/app" elixir elixir search.ex
