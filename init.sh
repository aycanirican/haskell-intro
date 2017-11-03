nix-env -f '<nixpkgs>' -iA \
  haskellPackages.cabal2nix \
  haskellPackages.cabal-install \
  haskellPackages.styx \
  haskellPackages.ghc
