mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

run:
	docker run -it --rm -w /app -v "$(current_dir):/app" ruby:alpine ruby main.rb
