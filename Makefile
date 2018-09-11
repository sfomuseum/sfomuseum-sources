# There are only two rules:
# 1. Variables at the top of the Makefile.
# 2. Targets are listed alphabetically. No, really.

WHOAMI = $(shell basename `pwd`)
YMD = $(shell date "+%Y%m%d")

external:
	curl -s -o sources/whosonfirst.json https://raw.githubusercontent.com/whosonfirst/whosonfirst-sources/master/sources/whosonfirst.json
	curl -s -o sources/metazen.json https://raw.githubusercontent.com/whosonfirst/whosonfirst-sources/master/sources/metazen.json

all: spec docs

docs:
	python2 ./bin/docs.py

spec:
	python2 ./bin/compile.py > data/sources-spec-`date "+%Y%m%d"`.json
	cp data/sources-spec-`date "+%Y%m%d"`.json data/sources-spec-latest.json
