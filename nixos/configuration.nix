{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix /home/giovanni/.nix/default.nix
    ];

  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
    };
  };

  networking.hostName = "blackbox";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Fortaleza";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services = {
    xserver = {
      enable = true;

      windowManager.i3.enable = true;

      layout = "br";
      xkbVariant = "";
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
  	support32Bit = true;
      };
      pulse.enable = true;
    };
  };

  security.rtkit.enable = true;

  console.keyMap = "br-abnt2";

  users.users.giovanni = {
    isNormalUser = true;
    description = "giovanni";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [ wget vim git ntfs3g xdg-user-dirs ];
    etc = {
      "xdg/user-dirs.defaults".text = ''
        DOWNLOAD=Downloads/
        PUBLICSHARE=Public/
        DOCUMENTS=Documents/
        MUSIC=Music/
        PICTURES=Pictures/
        VIDEOS=Videos/
      '';
    };
  };

  system.stateVersion = "23.05";
}
