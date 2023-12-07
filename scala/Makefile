mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
image := "sbtscala/scala-sbt:eclipse-temurin-17.0.4_1.7.1_3.2.0"

run:
	docker run -it -w /app -v "$(current_dir):/app" $(image) scala -explain bigram.scala

shell:
	docker run -it -w /app -v "$(current_dir):/app" $(image) bash
