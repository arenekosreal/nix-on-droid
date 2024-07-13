{ config, lib, pkgs, ... }:

{
  # Packages
  environment.packages = import ./nix-on-droid/packages.nix pkgs;
  
  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  time.timeZone = "Asia/Shanghai";

  # Set shell 
  user.shell = if builtins.elem pkgs.fish config.environment.packages 
               then "${pkgs.fish}/bin/fish" 
               else "${pkgs.bashInteractive}/bin/bash"; 
  # Font
  terminal.font = "${pkgs.nerdfonts}/share/fonts/opentype/NerdFonts/DroidSansMNerdFont-Regular.otf";
  
  # Home manager
  home-manager = {
    backupFileExtension = "home-manager.bak";
    useGlobalPkgs = true;
    config = ./nix-on-droid/home-manager.nix;
  };
}
