{ pkgs, config, ... }:
let
  xone-ovr = config.boot.kernelPackages.callPackage ./xone.nix {};
  unstable = import <nixos-unstable> {};
  unstablePkgs = with unstable; [ neovim zellij ];
  nurPkgs = with pkgs.nur.repos.nltch; [ spotify-adblock ciscoPacketTracer8 ];
in
{
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball
      "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball
      "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz"))
  ];

  environment.systemPackages = with pkgs; [
    alacritty appimage-run chromium cmus discord dunst easyeffects emacs-unstable
    feh firefox-esr fd flameshot fzf gnupg gimp goverlay i3lock-color libreoffice
    lxappearance mangohud mpv neofetch pamixer patchelf pavucontrol picard picom
    playerctl polybar pinentry qbittorrent ranger redshift ripgrep rofi syncthing
    unzip xclip xss-lock zathura zip zoxide xorg.libXi
  ] ++ unstablePkgs ++ nurPkgs;

  programs = {
    i3lock.package = pkgs.i3lock-color;
    kdeconnect.enable = true;
    dconf.enable = true;
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
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
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
  networking.firewall.allowedTCPPorts = [ 8384 22000 57621 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 5353 ];

  boot = {
    extraModulePackages = [ xone-ovr ];
  };
}
