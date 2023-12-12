mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
image := "sritchie/mechanics"

app:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image) --load hello.scm
