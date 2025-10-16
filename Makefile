all: fmt update rebuild softwareupdate

fmt:
	nix fmt .

update:
	nix flake update
	
rebuild:
	sudo darwin-rebuild --flake . switch
	
softwareupdate:
	sudo softwareupdate -ia

.PHONY: all update rebuild softwareupdate