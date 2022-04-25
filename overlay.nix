self: super:
let
  mypkgs = import ./default.nix { pkgs = super; };
in
{
  i2p = mypkgs.i2p;
  maltego = mypkgs.i2p;
}
