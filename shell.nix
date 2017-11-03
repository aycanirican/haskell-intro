let

  pkgs = import <nixpkgs> {};

  hask = pkgs.haskellPackages.ghcWithPackages (p: with p; [
    #alex
    #happy
    styx
    cabal-install 
    cabal2nix
    hlint
    stylish-haskell
    hasktags
  ]);
  
  macs = pkgs.emacsWithPackages (p: with p; [
    magit
    flycheck
    haskell-mode
    dante
    use-package
    undo-tree
    company
    company-ghc
    multiple-cursors
    nix-mode
    markdown-mode
    editorconfig
    hindent
    rainbow-delimiters
  ]);
  
in 

with pkgs;

stdenv.mkDerivation rec {
  name = "haskell-env";
  buildInputs = [ 
    git
    hask # ghc   with specific packages 
    macs # emacs with specific packages
  ];
  shellHook = ''
    export IN_HASKELL_SHELL=true
  '';
}
