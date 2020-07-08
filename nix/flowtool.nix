{rustPlatform, fetchFromGitHub}:

rustPlatform.buildRustPackage rec {
	pname = "flowtool";
	version = "1.0.0";

	src = fetchFromGitHub {
		owner = "marius851000";
		repo = pname;
		rev = "8a4770bc97a435f0f4c2c39e6ef934011a5746f5";
		sha256 = "03bbsmkl98d3hgsflq44xg2hfqy4yh7qp40zkr8aik12zriyl80f";
	};


	cargoSha256 = "1lmdpgpwaxxmklckpygi0lckjdkd9hdndzahfvawryb9sl4j0fh5";
}
