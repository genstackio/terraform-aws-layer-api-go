all: install

format:
	@terraform fmt

install:
	@terraform get

pr:
	@hub pull-request -b $(b)

.PHONY: all install pr