{ pkgs, config, ... }:

let
  xone-ovr = config.boot.kernelPackages.callPackage ./xone.nix {};
in {
  environment.systemPackages = with pkgs; [
    alacritty appimage-run calibre chromium cmus discord dunst dwarf-fortress
    easyeffects evince feh firefox-esr fd flameshot fzf gimp goverlay htop
    i3lock-color jdk jdk21 jetbrains-toolbox libreoffice lxappearance mangohud
    mpv musescore neofetch neovim nil nodejs_20 pamixer pavucontrol picard picom
    playerctl polybar pinentry qbittorrent ranger reaper redshift ripgrep rofi
    syncthing unzip xclip xcolor xss-lock zathura zellij zip zoxide xorg.libXi
  ];

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
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-tty;
      };
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
