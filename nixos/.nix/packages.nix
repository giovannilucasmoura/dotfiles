{ pkgs, config, ... }:

let
  xone-ovr = config.boot.kernelPackages.callPackage ./xone.nix {};
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  unstablePkgs = with unstable; [ dwarf-fortress gnupg ];
in {
  environment.systemPackages = with pkgs; [
    alacritty appimage-run calibre chromium clang-tools cmus discord dunst
    easyeffects evince feh firefox-esr fd flameshot fzf gcc gdb gnumake gimp
    goverlay htop i3lock-color jdk jdk21 jetbrains.idea-community libreoffice
    lxappearance mangohud mpv neofetch neovim nil nodejs_20 pamixer patchelf
    pavucontrol picard picom playerctl polybar pinentry qbittorrent ranger reaper
    redshift ripgrep rofi syncthing unzip valgrind xclip xcolor xss-lock
    yacreader zathura zellij zip zoxide xorg.libXi
  ] ++ unstablePkgs;

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
      package = unstable.gnupg;
      agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryFlavor = "tty";
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
