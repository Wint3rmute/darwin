all: fmt flake build switch commit garbage os

fmt:
	nix fmt .

flake:
	nix flake update

build:
	darwin-rebuild --flake . build
	
switch:
	sudo darwin-rebuild --flake . switch

commit:
	git add -A && git commit -m flake && git push
	
os:
	sudo softwareupdate -ia

garbage:
	sudo nix-collect-garbage

.PHONY: all fmt flake build switch os garbage commit
