{ pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
in
{
    environment.systemPackages = [
      unstable.neovim
      unstable.zellij

      pkgs.cmus
      pkgs.cmusfm
      pkgs.pamixer
      pkgs.pavucontrol
      pkgs.firefox-esr
      pkgs.rofi
      pkgs.alacritty
      pkgs.polybar
  ];
}
