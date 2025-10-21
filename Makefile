all: fmt flake nix garbage os

fmt:
	nix fmt .

flake:
	nix flake update
	
nix:
	sudo darwin-rebuild --flake . switch
	
os:
	sudo softwareupdate -ia

garbage:
	sudo nix-collect-garbage

.PHONY: all fmt flake nix os garbage
