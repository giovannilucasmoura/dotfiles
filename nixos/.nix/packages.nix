{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alacritty chromium cmus cmusfm discord dunst feh firefox-esr flameshot fzf gimp i3lock-color krita lxappearance
    neofetch neovim pamixer pavucontrol picom polybar qbittorrent ranger redshift ripgrep rofi starship syncthing
    xclip xf86_input_wacom xss-lock zathura zellij zoxide
  ];

  programs = {
    i3lock.package = pkgs.i3lock-color;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
