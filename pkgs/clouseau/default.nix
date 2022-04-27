{ config, lib, pkgs, stdenv, jdk11, fetchzip, coreutils, bash, writeShellApplication }:



stdenv.mkDerivation rec {
  pname = "clouseau";
  version = "2.21.0";
  src = fetchzip {
    url = "https://github.com/cloudant-labs/clouseau/releases/download/${version}/clouseau-${version}-dist.zip";
    sha256 = "sha256-9SkXe54RFq7gcuQkAAPbHtTGb7bxnEh0Pt7UuGfnEho=";
  };
  #nativeBuildInputs = [ makeWrapper ];
  nativeBuildInputs = [ jdk11 ];
  buildInputs = [ jdk11  bash coreutils ];


  installPhase = ''
  mkdir -v $out
  mkdir -v $out/share
  mkdir -v $out/share/java
  cp -rv * $out/share/java/
  '';
}
