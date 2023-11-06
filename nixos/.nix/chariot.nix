{ pkgs, ... }:

{

  boot.loader.grub.extraEntries = ''
    menuentry "Windows" {
      insmod part_gpt
      insmod fat
      insmod search_fs_uuid
      insmod chain
      search --fs-uuid --set=root 5E35-733C
      chainloader /EFI/Microsoft/Boot/bootmgfw.efi
    }
  '';

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;

  environment.systemPackages = with pkgs; [
    brightnessctl cbatticon dbeaver eclipses.eclipse-jee networkmanagerapplet
  ];

  services.blueman.enable = true;
}
