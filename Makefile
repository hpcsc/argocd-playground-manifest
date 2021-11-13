.DEFAULT_GOAL := help

SHELL = bash

include kustomize/Makefile
include helm/Makefile

##@ Help
.PHONY: help
help:  ## Display this help.
	./scripts/list-make-targets.sh $(MAKEFILE_LIST)
