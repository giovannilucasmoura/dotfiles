{ pkgs, config, ... }:
let
  xone-ovr = config.boot.kernelPackages.callPackage ./xone.nix {};
  unstable = import <nixos-unstable> {};
  unstablePkgs = with unstable; [ neovim zellij ];
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball
      "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz"))
  ];

  environment.systemPackages = with pkgs; [
    alacritty appimage-run chromium cmus discord dunst emacs-unstable feh
    firefox-esr fd flameshot fzf gnupg gimp goverlay i3lock-color libreoffice
    lxappearance mangohud mpv neofetch pamixer patchelf pavucontrol picard picom
    polybar pinentry qbittorrent ranger redshift ripgrep rofi syncthing unzip
    xclip xss-lock zathura zoxide xorg.libXi
  ] ++ unstablePkgs;

  programs = {
    i3lock.package = pkgs.i3lock-color;
    kdeconnect.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "tty";
    };
  };

  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs-unstable;
    };
    pcscd.enable = true;
  };

  # Syncthing ports
  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  boot = {
    extraModulePackages = [ xone-ovr ];
  };
}
