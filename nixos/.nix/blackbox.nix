{ config, pkgs, ... }:
{
  boot.loader.grub = {
    extraEntries = ''
      menuentry "Windows" {
        insmod part_gpt
        insmod fat
        insmod search_fs_uuid
        insmod chain
        search --fs-uuid --set=root B6E5-597B
        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      }
    '';
    extraEntriesBeforeNixOS = true;
  };

  environment.systemPackages = with pkgs; [
    autorandr
  ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver = {
    displayManager.sessionCommands = ''
      ${pkgs.autorandr}/bin/autorandr --load blackbox
    '';

    videoDrivers = ["nvidia"];
  };
  
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    nvidiaSettings = true;

    forceFullCompositionPipeline = true;

      package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  fileSystems."/home/giovanni/Data" = {
    device = "/dev/disk/by-uuid/e0b5d29f-80ea-4f6d-8503-9cce80be5115";
    fsType = "ext4";
  };

  services.pipewire = {
    jack.enable = true;
  };

  # Docker
  virtualisation.docker.enable = true;

  users.users.giovanni.extraGroups = [ "docker" "jackaudio" ];
}
