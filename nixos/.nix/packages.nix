{ pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
  unstablePkgs = with unstable; [ neovim zellij ];
in
{
  environment.systemPackages = with pkgs; [
    alacritty chromium cmus cmusfm dunst feh firefox-esr flameshot fzf gimp i3lock-color krita lxappearance neofetch
    pamixer pavucontrol picom polybar qbittorrent ranger redshift ripgrep rofi starship syncthing xclip xf86_input_wacom
    xss-lock zathura zoxide
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
