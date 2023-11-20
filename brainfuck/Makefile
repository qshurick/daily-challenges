mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

run:
	docker run -it --rm -v"$(current_dir):/app" esolang/brainfuck-esotope ash -c "brainfuck-esotope /app/pentagon.bf > /app/data"

read:
	hexdump -C data
