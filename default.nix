let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  dhallOpenapi = (import "${sources.dhall-haskell}/default.nix").dhall-openapi;
in
pkgs.stdenv.mkDerivation {
    name = "scratch";
    inherit dhallOpenapi;
}
