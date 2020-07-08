{ stdenv, flowtool, script_entry_list_tool, plbEdit_wine, python3, lua, mdbook, zip, wine }:

source: stdenv.mkDerivation {
	name = "discern-psmd-hack-ci-git";

	nativeBuildInputs = [
		flowtool
		script_entry_list_tool
		python3
		lua
		plbEdit_wine
		mdbook
		zip
		wine
	];

	enableParallelBuilding = true;

	src = source;

	configurePhase = ''
		export WINEPREFIX=$(mktemp -d)
		wineboot
		echo "include config/nix-ci.mk
		PLBEDIT = wine ${plbEdit_wine}/winbin/plbEdit.exe" > config.mk
		make clean
	'';

	makeFlags = [ "patch" "patch.zip" "book" "book.zip" ];

	installPhase = ''
		mkdir $out
		cp -rf patch $out
		cp patch.zip $out
		cp -rf book $out
		cp book.zip $out
	'';
}
