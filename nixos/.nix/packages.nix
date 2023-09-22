{ pkgs, fonts, ... }:
let
  unstable = import <nixos-unstable> {};
in
{
    environment.systemPackages = [
      unstable.neovim
      unstable.zellij

      pkgs.cmus
      pkgs.cmusfm
      pkgs.dunst
      pkgs.feh
      pkgs.flameshot
      pkgs.gcc
      pkgs.pamixer
      pkgs.firefox-esr
      pkgs.i3lock-color
      pkgs.picom
      pkgs.redshift
      pkgs.ripgrep
      pkgs.rofi
      pkgs.ungoogled-chromium
      pkgs.alacritty
      pkgs.polybar
      pkgs.xf86_input_wacom
      pkgs.xss-lock
      pkgs.zoxide
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
