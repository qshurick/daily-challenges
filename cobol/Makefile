mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

run: build
	cobcrun BINARY-SWAP

build:
	cobc BINARY-SWAP.cbl

shell:
	docker run -it --rm -w /app -v"$(current_dir):/app" opensourcecobol/opensource-cobol
