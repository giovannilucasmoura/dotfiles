{ pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
  unstablePkgs = with unstable; [ neovim zellij ];
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball https://github.com/nix-community/emacs-overlay/archive/master.tar.gz))
  ];

  environment.systemPackages = with pkgs; [
    alacritty chromium cmus cmusfm dunst emacs-unstable feh firefox-esr fd flameshot fzf gimp i3lock-color isync krita
    lxappearance mpv mu neofetch pamixer pavucontrol picom polybar qbittorrent ranger redshift ripgrep rofi starship
    syncthing xclip xf86_input_wacom xss-lock zathura zoxide xorg.libXi
  ] ++ unstablePkgs;

  programs = {
    i3lock.package = pkgs.i3lock-color;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
