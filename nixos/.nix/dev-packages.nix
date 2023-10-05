{ pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
in
{
  environment.systemPackages = [
    # C \ C++
    pkgs.gcc
    # C# / .NET
    pkgs.dotnet-sdk
    # Java
    pkgs.jdk
    # Javascript
    pkgs.nodejs_20
    # LaTeX
    pkgs.texlive.combined.scheme-full pkgs.pplatex
    # Nix
    unstable.nixd
    # OCaml
    pkgs.opam
    # Rust
    pkgs.rustup

    # Other packages
    pkgs.clang-tools pkgs.clang unstable.prettierd
  ];

  # Docker
  virtualisation.docker.enable = true;
  users.users.giovanni.extraGroups = [ "docker" ];

}
