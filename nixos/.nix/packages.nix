{ pkgs, config, ... }:
let
  xone-ovr = config.boot.kernelPackages.callPackage ./xone.nix {};
  unstable = import <nixos-unstable> {};
  unstablePkgs = with unstable; [ neovim zellij ];
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz"))
  ];

  environment.systemPackages = with pkgs; [
    alacritty appimage-run chromium cmus cmusfm discord dunst emacs-unstable feh firefox-esr fd flameshot fzf gimp goverlay
    i3lock-color krita lxappearance mangohud mpv neofetch pamixer patchelf pavucontrol picom polybar qbittorrent ranger
    redshift ripgrep rofi syncthing unzip xclip xf86_input_wacom xss-lock zathura zoxide xorg.libXi
  ] ++ unstablePkgs;

  programs = {
    i3lock.package = pkgs.i3lock-color;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
  };

  boot = {
    extraModulePackages = [ xone-ovr ];
  };
}
