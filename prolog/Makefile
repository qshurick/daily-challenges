mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
image := swipl

all:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image)

test:
	docker run -it --rm -w /app -v"$(current_dir):/app" $(image) swipl -l track_robot.tests.pl -t run_tests

