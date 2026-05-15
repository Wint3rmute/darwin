OS := $(shell uname)

REBUILD := $(if $(filter Darwin,$(OS)), darwin-rebuild, nixos-rebuild)

all: fmt flake build switch commit garbage

fmt:
	nix fmt .

flake:
	nix flake update

build:
	$(REBUILD) --flake . build

switch:
	sudo $(REBUILD) --flake . switch

commit:
	git add -A && git commit -m flake && git push

garbage:
	sudo nix-collect-garbage -d

.PHONY: all fmt flake build switch garbage commit
