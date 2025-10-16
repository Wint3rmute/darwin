all: fmt flake nix os

fmt:
	nix fmt .

flake:
	nix flake update
	
nix:
	sudo darwin-rebuild --flake . switch
	
os:
	sudo softwareupdate -ia

.PHONY: all fmt flake nix os
