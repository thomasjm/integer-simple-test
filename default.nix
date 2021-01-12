{ haskellNix ? import /home/tom/tools/haskell.nix {}
, nixpkgsSrc ? haskellNix.sources.nixpkgs-2003
, nixpkgsArgs ? haskellNix.nixpkgsArgs
, nixpkgs ? import nixpkgsSrc nixpkgsArgs
, pkgs ? nixpkgs.pkgsCross.musl64
}: pkgs.haskell-nix.project {
  modules = [{
    # Workaround for https://github.com/input-output-hk/haskell.nix/issues/985
    ghc.package =
      let ghc = pkgs.buildPackages.haskell-nix.compiler.ghc884.override { enableIntegerSimple = true; };
      in ghc // { passthru = ghc.passthru // { buildGHC = ghc; }; };
    packages.hashable.flags.integer-gmp = false;
  }];

  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "integer-simple-test";
    src = ./.;
  };
}
