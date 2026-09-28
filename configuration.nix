{ config, lib, pkgs, ... }:

{
	imports =
		[
		./hardware-configuration.nix
		./modules/ntwrk.nix
		./modules/pkgs.nix
		./modules/stylix.nix
		./modules/vidaud.nix
		./modules/bat.nix
		];

# systemd-boot EFI boot 
	boot = {
	kernelParams = [ "quiet" ];
	loader.systemd-boot.enable = true;
	loader.efi.canTouchEfiVariables = true;
	loader.timeout = 0;
	};
# Set your time zone.
	time.timeZone = "America/Toronto";

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	services.displayManager = {
		ly.enable = true;
	};


	services.libinput.enable = true;

	users.users.emmad = {
		isNormalUser = true;
		extraGroups = [ "wheel" ]; 
			packages = with pkgs; [
			tree
			];
		shell = pkgs.fish;
	};
		
	
	programs.fish = {
		enable = true;
		shellInit = ''
			set -g fish_greeting ""
			'';
	};

	
	programs.niri.enable = true;   
	

	programs.firefox.enable = true;

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;


	nix.settings.experimental-features = ["nix-command" "flakes" ];

	system.stateVersion = "26.05";

}

