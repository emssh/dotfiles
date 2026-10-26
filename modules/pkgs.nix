{ config, lib, pkgs, inputs, ...}:

### === PACKAGES === ###

{

	xdg.mime.enable = true;
	xdg.menus.enable = true;

	programs.fish = {
		enable = true;
		shellInit = ''
			set -g fish_greeting ""
			'';
	};

	programs.starship = {
		enable = true;
		presets = ["nerd-font-symbols"];
	};

	programs.niri.enable = true;   

	programs.firefox.enable = true;
	
	programs.dms-shell = {
		enable = true;

		systemd = {
			enable = true;
			restartIfChanged = true;
			};
	};

	environment.systemPackages = with pkgs; [
# Terminal #
			kitty
			fastfetch
			vim

# Utils #
			fzf
			wl-clipboard
			brightnessctl
			wget
			xwayland-satellite
			speedtest-cli
			android-tools
			go-mtpfs
			xdg-user-dirs
			xdg-user-dirs-gtk

# Apps #
			nautilus
			nsxiv
			eog
			mpv
			zathura
			obsidian
			brave
			localsend
			zed-editor
			inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

# Communication #
			discord
			signal-desktop

			];


	nixpkgs.config.allowUnfree = true;

# = FONTS = #

	fonts.packages = with pkgs; [
		nerd-fonts.departure-mono
		nerd-fonts.fira-code
		wine64Packages.fonts
	];
}
