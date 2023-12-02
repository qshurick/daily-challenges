mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

all: clean build run

build:
	docker run -it --rm -w /app -v"$(current_dir):/app" haskell ghc -o hours hours.hs

run:
	./hours

clean:
	rm -rf *.o
	rm -rf *.hi
	rm -rf hours
