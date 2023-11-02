mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

run: build
	docker run -it -w /app -v "$(current_dir):/app" eclipse-temurin java -classpath target com.qshurick.Application

build:
	docker run -it -w /app -v "$(current_dir):/app" eclipse-temurin javac -verbose -d target src/*
