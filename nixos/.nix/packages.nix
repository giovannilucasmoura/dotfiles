{ pkgs, fonts, ... }:
let
  unstable = import <nixos-unstable> {};
  unstablePkgs = with unstable; [ neovim nixd zellij ];
in
{
  environment.systemPackages = with pkgs; [
    alacritty cmus cmusfm dunst feh firefox-esr flameshot gcc i3lock-color pamixer picom polybar
    redshift ripgrep rofi ungoogled-chromium xf86_input_wacom xss-lock zoxide
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
