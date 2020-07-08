{rustPlatform, fetchFromGitHub}:

rustPlatform.buildRustPackage rec {
	pname = "script_entry_list_tool";
	version = "1.0.0";

	src = fetchFromGitHub {
	 	owner = "marius851000";
	 	repo = pname;
	 	rev = "1a93b76ab5c6a110c1b211684c80de69407c38d9";
	 	sha256 = "1zg69fjajxx150bgarclf8gvbr3fcgr6fxw7cric8s7inz99bqfm";
 	};

 	cargoSha256 = "1bdcmrpwbhny09384v97za7afjsx9xmqcar7sd4dgv5hp54fmyjh";
}
