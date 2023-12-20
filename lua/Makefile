mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
image := "nickblah/lua"

all:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image) lua integral.lua
