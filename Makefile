all: fmt flake nix commit garbage os

fmt:
	nix fmt .

flake:
	nix flake update
	
nix:
	sudo darwin-rebuild --flake . switch

commit:
	git add -A && git commit -m flake && git push
	
os:
	sudo softwareupdate -ia

garbage:
	sudo nix-collect-garbage

.PHONY: all fmt flake nix os garbage commit
