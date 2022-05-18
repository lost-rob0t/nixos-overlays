{ pkgs ? import <nixpkgs> { }, nimPackages }:
let
  inherit (pkgs) callPackage fetchurl;
in
{

  i2p = callPackage ./pkgs/i2p/default.nix { };
  maltego = callPackage ./pkgs/maltego/default.nix { };
  clouseau = callPackage ./pkgs/clouseau/default.nix {  };
  puffer = callPackage ./pkgs/puffer/default.nix {  };
  nimsuggest = nimPackages.callPackage ./pkgs/nimsuggest/default.nix {  };
}
