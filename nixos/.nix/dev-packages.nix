{ pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
in
{
  environment.systemPackages = [
    # C \ C++
    pkgs.gcc
    # C#
    pkgs.dotnet-sdk pkgs.dotnet-sdk_7 pkgs.omnisharp-roslyn
    # Java
    pkgs.jdk
    # Javascript
    pkgs.nodejs_20
    # LaTeX
    pkgs.texlive.combined.scheme-medium pkgs.pplatex
    # Nix
    unstable.nixd
    # OCaml
    pkgs.opam
    # Rust
    pkgs.rustup

    # Other
    pkgs.clang-tools unstable.prettierd
  ];
}
