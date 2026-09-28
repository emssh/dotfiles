{ config, lib, pkgs, ...}:

### === PACKAGES === ###

{

	environment.systemPackages = with pkgs; [
		# Terminal #
		kitty
		fastfetch
		vim
		
		# Utils #
		fzf
		wl-clipboard
		wget
		brightnessctl
		wlsunset
		swaylock
		mako
		swaybg
		xwayland-satellite
		speedtest-cli
		
		# Apps #
		yazi
		obsidian
		brave
		localsend
		zed-editor
	];
	
	nixpkgs.config.allowUnfree = true;

	# = FONTS = #
	
	fonts.packages = with pkgs; [
		nerd-fonts.departure-mono
		nerd-fonts.fira-code
		wine64Packages.fonts
	];

}
