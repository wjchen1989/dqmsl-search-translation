FLAGS=--compilation_level SIMPLE_OPTIMIZATIONS --charset utf-8

all: dqmsl.min.js dqmsl.user.js

dqmsl.min.js: dqmsl.js
	closure-compiler $(FLAGS) $< > $@

dqmsl.user.js: dqmsl.min.js firefox.header
	cat firefox.header | cat - $< > $@

clean:
	rm *.bak

.PHONY: clean all
