%:
	@:
SHELL := $(shell command -v bash)
ARGS = $(filter-out $@, $(MAKECMDGOALS))
.DEFAULT_GOAL = install

.EXPORT_ALL_VARIABLES:

UNAME := $(shell uname -s)
DOTFILES_DIR := $(HOME)/.dotfiles
SCRIPTS := Linux MacOS link unlink notify_os

ifeq ($(UNAME), Darwin)
	export OS=MacOS
else ifeq ($(UNAME), Linux)
	export OS=Linux
endif

.PHONY: help install $(SCRIPTS)
.SILENT:

help:
	echo TODO help

install: os_notify $(OS) done

done:
	echo done!

$(SCRIPTS):
	$(SHELL) "$(DOTFILES_DIR)/scripts/$(@).sh"
