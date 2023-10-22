{ pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
in
{
  environment.systemPackages = [
    # Bash
    pkgs.shellcheck pkgs.shfmt
    # C \ C++
    pkgs.gcc pkgs.clang-tools pkgs.clang pkgs.libedit
    # HTML / CSS
    pkgs.html-tidy pkgs.nodePackages_latest.stylelint
    pkgs.nodePackages_latest.js-beautify
    # Java
    pkgs.jdk
    # Javascript
    pkgs.nodejs_20
    # LaTeX
    pkgs.texlive.combined.scheme-full pkgs.pplatex
    # Lisp
    pkgs.sbcl
    # Nix
    unstable.nil pkgs.nixfmt
    # OCaml
    pkgs.opam
    # Rust
    pkgs.rustup

    # Other packages
    pkgs.gnumake pkgs.pandoc unstable.prettierd pkgs.libxml2 pkgs.glslang
    pkgs.gdb pkgs.valgrind
  ];

  # Docker
  virtualisation.docker.enable = true;
  users.users.giovanni.extraGroups = [ "docker" ];
  programs.direnv.enable = true;

}
