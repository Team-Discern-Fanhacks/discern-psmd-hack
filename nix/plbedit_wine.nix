{stdenv, fetchurl, coreutils, wine, bash}:

stdenv.mkDerivation rec {
	pname = "plbEdit";
	version = "0.1.0";

	src = fetchurl {
		url = "https://github.com/EddyK28/plbEdit/releases/download/v0.1.0/plbEdit.exe";
		sha256 = "1dcprnyjy0cjwhg52rcmll5ipd6cb3k4a2841bl6vm0348a079kf";
	};

	unpackPhase = ''
		cp $src plbEdit.exe
	'';

	nativeBuildInputs = [ wine ];
	buildInputs = [ wine ];

	installPhase = ''
		mkdir -p $out/winbin
		cp plbEdit.exe $out/winbin
		mkdir -p $out/bin/
		echo "#!${bash}/bin/bash
			export TMP_DIR=\$(${coreutils}/bin/mktemp -d)
			WINEPREFIX=\$TMP_DIR ${wine}/bin/wine $out/winbin/plbEdit.exe \"\$@\"
			rm -rf \$TMP_DIR" > $out/bin/plbEdit
		chmod +x $out/bin/plbEdit
	'';
}
