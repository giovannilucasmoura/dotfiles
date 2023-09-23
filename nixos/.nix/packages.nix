{ pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
  unstablePkgs = with unstable; [ neovim zellij ];
in
{
  environment.systemPackages = with pkgs; [
    alacritty cmus cmusfm dunst feh firefox-esr flameshot fzf i3lock-color neofetch ntfs3g pamixer picom polybar
    ranger redshift ripgrep rofi starship syncthing chromium xclip xf86_input_wacom xss-lock zoxide
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
