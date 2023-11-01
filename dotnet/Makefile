mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

run: build
	docker run -it -w /app -v "$(current_dir):/app" bitnami/dotnet-sdk out/dotnet

build:
	docker run -it -w /app -v "$(current_dir):/app" bitnami/dotnet-sdk dotnet publish -c Release -o out
