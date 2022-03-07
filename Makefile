%:
	@:
.SILENT:
.PHONY: help install Linux MacOS link unlink
.DEFAULT_GOAL = install
ARGS = $(filter-out $@, $(MAKECMDGOALS))

SHELL := $(shell command -v bash)
UNAME := $(shell uname -s)
SCRIPTS := Linux MacOS link unlink notify_os

export DOTFILES_DIR=$(HOME)/.dotfiles

ifeq ($(UNAME), Darwin)
	export OS=MacOS
else ifeq ($(UNAME), Linux)
	export OS=Linux
endif

help:
	echo TODO help

install: os_notify $(OS) done

done:
	echo done!

$(SCRIPTS):
	$(SHELL) "$(DOTFILES_DIR)/scripts/$(@).sh"
