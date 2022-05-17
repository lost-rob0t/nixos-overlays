{ lib, stdenv, nimPackages, fetchurl }:

let
  cligen = nimPackages.buildNimPackage rec {
    name = "cligen";
    version = "1.5.23";
    src = fetchurl {
    url = "https://github.com/c-blake/cligen/archive/refs/tags/v${version}.tar.gz";
    sha256 = "sha256-Qg3+yrvsItEEhSfDVY9t+5CHj1fSJTpYokWPQObgH0g=";

  };


  };
puffer = nimPackages.buildNimPackage rec {
  name = "puffer";
  rev = "d0c7d6a9a9e48e31eb24807f8a24118bc19c031c";

  nimBinOnly = true;

  src = fetchurl {
    url = "https://github.com/lost-rob0t/puffer.nim/archive/${rev}.tar.gz";
    sha256 = "sha256-hAqlBGiOQk9QVbtDhNHpk5Z7EtyeW02hRlYMxbvb++Q=";
  };
  buildInputs = with nimPackages; [
    cligen
  ];
};

in
  stdenv.mkDerivation rec {
    pname = "puffer";
    buildInputs = [ puffer ];
    meta = with lib; {
    description = "count puffs";
    homepage = "https://github.com/lost-rob0t/puffer.ni,";
    license = licenses.mit;
    maintainers = [ "nsaspy" ];
    };
  }
