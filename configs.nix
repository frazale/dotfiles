{ config, pkgs, ...}:
{
  home.stateVersion = "24.11";
  home.username = "src";
  home.homeDirectory = "/home/src";
  home.packages = with pkgs; [
    helix
  ];
  
  home.file = {
    ".config/helix".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/helix";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/hypr";
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/kitty";
  };
}
