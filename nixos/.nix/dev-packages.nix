{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # C \ C++
    gcc
    # C# / .NET
    dotnet-sdk
    # Java
    jdk
    # Javascript
    nodejs_20
    # LaTeX
    texlive.combined.scheme-full pplatex
    # Nix
    nixd
    # OCaml
    opam
    # Rust
    rustup

    # Other packages
    clang-tools prettierd
  ];

  # Docker
  virtualisation.docker.enable = true;
  users.users.giovanni.extraGroups = [ "docker" ];

}
