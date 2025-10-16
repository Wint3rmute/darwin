all: update rebuild softwareupdate

update:
	nix flake update
	
rebuild:
	sudo darwin-rebuild --flake . switch
	
softwareupdate:
	sudo softwareupdate -ia

.PHONY: all update rebuild softwareupdate