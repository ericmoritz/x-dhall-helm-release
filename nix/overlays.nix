pkgsNew: pkgsOld: {
    dhall-openapi =
        let
            json =
                builtins.fromJSON (builtins.readFile ./dhall-haskell.json);

            dhall-haskell = pkgsNew.fetchFromGitHub {
                owner = "dhall-lang";
                repo = "dhall-haskell";
                inherit (json) rev sha256 fetchSubmodules;
            };

            in
            (import "${dhall-haskell}/default.nix").dhall-openapi;
}
