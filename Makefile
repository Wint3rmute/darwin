all: fmt flake nix garbage os

fmt:
	nix fmt .

flake:
	nix flake update
	
nix:
	sudo darwin-rebuild --flake . switch
	
os:
	sudo softwareupdate -ia

garbge:
	sudo nix-collect-garbage -m

.PHONY: all fmt flake nix os garbage
