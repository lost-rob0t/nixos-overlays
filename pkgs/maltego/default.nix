{ lib
, stdenv
, fetchurl
, testVersion
, hello
}:
with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "maltego";
  version = "4.3.0";

  src = fetchgit {
    url = "https://gitlab.com/kalilinux/packages/maltego";
    sha256 = "sha256-i7mnOGpRdSCXECevZ0yc1h5R/qljI7sO4sSwuw4sBEw=";

  };
  # Add the derivation to the PATH
  buildInputs = [ pkgs.jdk ];
  dontBuild = true;
  installPhase = ''
  mkdir $out
  mkdir $out/{bin,etc,groovy,ide,java,maltegp,maltego-core-platform,maltego-ui,platform}
  cp -rv * $out
  rm -rv $out/debian
  chmod +x $out/bin/maltego
'';
  meta = with lib; {
    description = "Maltego is a comprehensive tool for graphical link analyses that offers real-time data mining and information gathering, as well as the representation of this information on a node-based graph, making patterns and multiple order connections between said information easily identifiable.";
    homepage = "https://www.maltego.com/";
    #license = licenses.gpl2;
    platforms = [ "x86_64-linux" "i686-linux" ];
    maintainers = with maintainers; [ nsaspy ];
  };
}
