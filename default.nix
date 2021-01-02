{ haskellNix ? import (builtins.fetchTarball "https://github.com/input-output-hk/haskell.nix/archive/master.tar.gz") {}
, nixpkgsSrc ? haskellNix.sources.nixpkgs-2003
, nixpkgsArgs ? haskellNix.nixpkgsArgs
, pkgs ? import nixpkgsSrc nixpkgsArgs
}: pkgs.haskell-nix.project {
  modules = [{
    ghc.package = pkgs.buildPackages.haskell-nix.compiler.ghc884.override {
      enableIntegerSimple = true;
    };
    packages.hashable.flags.integer-gmp = false;
  }];

  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "integer-simple-test";
    src = ./.;
  };
}
