mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

run:
	docker run --rm -it -w /app -v"$(current_dir):/app" test_xslt:latest java -cp /var/java/saxon/saxon-he-12.3.jar net.sf.saxon.Transform -t -s:data.xml -xsl:doubleSwap.xslt

build:
	docker build --tag test_xslt:latest build/
