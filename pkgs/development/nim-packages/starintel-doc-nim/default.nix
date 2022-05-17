{ lib, buildNimPackage, fetchGit }:

buildNimPackage rec {
  pname = "starintel-doc-nim";
  version = "0.1.2";

  src = fetchGit {
    url = pname;
    rev = "61b0750fa227f5593ccb3320db3cf78a029ac7b3";
  };

  meta = with lib;
    src.meta // {
      description = "Star intel documentation specification";
      license = [ licenses.mit ];
      maintainers = [ "nsaspy" ];
    };
}
