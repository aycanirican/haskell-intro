let

  pkgs = import <nixpkgs> {};

  hask = pkgs.haskellPackages.ghcWithPackages (p: with p; [
    alex
    cabal-install 
    cabal2nix
    dhall
    happy
    hasktags
    hlint
    stylish-haskell
    styx
  ]);
  
  macs = pkgs.emacsWithPackages (p: with p; [
    company
    company-ghc
    dante
    editorconfig
    flycheck
    haskell-mode
    hindent
    magit
    markdown-mode
    multiple-cursors
    nix-mode
    rainbow-delimiters
    smex
    undo-tree
    use-package
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
    alias emacs="emacs -q -l $PWD/.emacs" # start emacs with local configuration
  '';
}
