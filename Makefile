all: fmt update rebuild softwareupdate

fmt:
	nix fmt .

flake:
	nix flake update
	
nix:
	sudo darwin-rebuild --flake . switch
	
os:
	sudo softwareupdate -ia

.PHONY: all flake nix os
