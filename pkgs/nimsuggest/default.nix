{ lib, nimPackages, fetchFromGitHub, pkgs }:

nimPackages.buildNimPackage rec {
  pname = "nimsuggest";
  version = "0.1.0";
  src = fetchFromGitHub {
    owner = "nim-lang";
    repo = pname;
    rev = "f780247b651f28d6e3f1ae8d0067316a8086027e";
    sha256 = "0670phk1bq3l9j2zaa8i5wcpc5dyfrc0l2a6c21g0l2mmdczffa7";
  };
  binOnly = true;
  buildInputs = [ pkgs.nim ];
  meta =  {
    description = "Tool for providing auto completion data for Nim source code.";
    homepage = "https://github.com/nim-lang/nimsuggest/";
    license = lib.licenses.mit;
    maintainers = [ "nsaspy" ];
    };
  }
