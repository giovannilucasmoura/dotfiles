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

  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;

  environment.systemPackages = with pkgs; [
    brightnessctl cbatticon dbeaver-bin eclipses.eclipse-jee networkmanagerapplet
    subversion
  ];

  services.blueman.enable = true;

  networking.firewall.allowedTCPPortRanges = [ { from = 8080; to = 9000; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 8080; to = 9000; } ];
}
