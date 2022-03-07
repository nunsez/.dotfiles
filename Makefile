%:
	@:
.SILENT:
.PHONY: all install help linux macos link unlink
.DEFAULT_GOAL = all
ARGS = $(filter-out $@, $(MAKECMDGOALS))

DOTFILES_DIR := "${HOME}/dotfiles"
USER := "${USER}"
SHELL := $(shell command -v bash)
UNAME := $(shell uname -s)

ifeq ($(UNAME), Darwin)
	OS := macos
else ifeq ($(UNAME), Linux)
	OS := linux
endif

help:
	echo TODO help

all: install

install: $(OS)

linux:
	echo linux
	echo $(DOTFILES_DIR)

macos:
	echo macos config is not available now

link:
	echo TODO link

unlink:
	echo TODO unlink
