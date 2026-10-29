{ pkgs ? import <nixpkgs> {} }:
#{% comment %} # { pkgs ? import (fetchTarball  "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11") {} }: {% endcomment %}
let
  message = "Lets Start Development";
in 
pkgs.mkShellNoCC {
  buildInputs = with pkgs; [ nodejs ];

  packages = with pkgs; [
    nodejs
    browser-sync 
    nodemon
    vscodium 
    firefox-devedition 
    nodejs 
    vim 
    curl     
  ];

  shellHook = ''
    cowsay ${message}
    npm run dev & echo "y" | codium . & firefox localhost:3000 & npm run dev & firefox 127.0.0.1:5501
    '';
}
