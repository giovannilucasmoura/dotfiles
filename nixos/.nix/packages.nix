{ pkgs, config, ... }:

let
  xone-ovr = config.boot.kernelPackages.callPackage ./xone.nix {};
  nurPkgs = with pkgs.nur.repos.nltch; [ spotify-adblock ciscoPacketTracer8 ];
in {
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball
      "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
  };

  environment.systemPackages = with pkgs; [
    alacritty appimage-run chromium clang-tools cmus discord dunst easyeffects
    feh firefox-esr fd flameshot fzf gcc gdb gnumake gnupg gimp goverlay htop
    i3lock-color jdk libreoffice lxappearance mangohud mpv neofetch neovim
    nix-index nodejs_20 pamixer patchelf pavucontrol picard picom playerctl
    polybar pinentry qbittorrent ranger redshift ripgrep rofi syncthing unzip
    valgrind xclip xss-lock zathura zellij zip zoxide xorg.libXi
  ] ++ nurPkgs;

  programs = {
    i3lock.package = pkgs.i3lock-color;
    kdeconnect.enable = true;
    dconf.enable = true;
    direnv.enable = true;
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
      package = pkgs.emacs29;
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
