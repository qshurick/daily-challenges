mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
image := "ghcr.io/joshuanianji/idris-2-docker/ubuntu:v0.5.1"

all: 
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image) hello.idr

shell:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image)

clean:
	rm -rf build
