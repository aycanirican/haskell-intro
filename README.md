# Haskell Development Environment

## Install Nix
Installing Nix Package Manager is easy. Just execute: 

```
curl https://nixos.org/nix/install | sh
```

Your next login should include `nix-env` executable.

## Install styx and it's dependencies

Install them by executing `sh ./init.sh` included in this repository.

## Enter development shell

You should all set at this point, fire `nix-shell --pure` for a pure
environment which includes `emacs` and haskell related tools like
hlint, hscolour etc...

## Link ~/.emacs to .emacs

Since it's not possible to wrap emacs with a default configuration, you should link included `.emacs` file to your HOME directory.

```
ln -sf <abs_path_to_.emacs_included> ~/.emacs
```
