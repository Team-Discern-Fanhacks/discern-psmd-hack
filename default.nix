{ pkgs ? import (builtins.fetchTarball {
	url = "https://github.com/NixOS/nixpkgs/archive/36eb2d22e7310fdd35be926e3945da23bf3c8699.tar.gz";
	sha256 = "1246p3ak2jf3hazsnclp65cd0q56aqz2ychn2c8bqpd0pvsk3rja";
}) {}}:

let
	flowtool = pkgs.callPackage ./nix/flowtool.nix {};

	script_entry_list_tool = pkgs.callPackage ./nix/script_entry_list_tool.nix {};

	plbEdit_wine = pkgs.callPackage ./nix/plbedit_wine.nix {};

	discern_builder = pkgs.callPackage ./nix/discern_native.nix {
		inherit flowtool script_entry_list_tool plbEdit_wine;
	};
in {
	inherit flowtool script_entry_list_tool plbEdit_wine;

	discern_git = discern_builder (builtins.fetchGit ./.);

	discern = discern_builder ./.;
}
