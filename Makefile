OS := $(shell uname)

REBUILD  := $(if $(filter Darwin,$(OS)), darwin-rebuild --flake ., nixos-rebuild --flake .#asus)

all: fmt flake build switch commit garbage os

fmt:
	nix fmt .

flake:
	nix flake update

build:
	$(REBUILD) build

switch:
	sudo $(REBUILD) switch

commit:
	git add -A && git commit -m flake && git push

garbage:
	sudo nix-collect-garbage -d

.PHONY: all fmt flake build switch garbage commit
