{ config, lib, pkgs, ... }:
{
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

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
