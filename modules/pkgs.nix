{ config, lib, pkgs, inputs, ...}:

### === PACKAGES === ###

{

	xdg.mime.enable = true;
	xdg.menus.enable = true;
	
	environment.etc."/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

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
			android-tools
			go-mtpfs

# Apps #
			yazi
			zathura
			obsidian
			brave
			localsend
			zed-editor
			inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
			discord
			signal-desktop

# Dolphin File Manager & Dependinces #
			kdePackages.dolphin
			kdePackages.kio
			kdePackages.kdf
			kdePackages.kio-fuse
			kdePackages.kio-extras
			kdePackages.kio-admin
			kdePackages.qtwayland
			kdePackages.plasma-integration
			kdePackages.kdegraphics-thumbnailers
			kdePackages.breeze-icons
			kdePackages.qtsvg
			kdePackages.kservice
			shared-mime-info

			];


	nixpkgs.config.allowUnfree = true;

# = FONTS = #

	fonts.packages = with pkgs; [
		nerd-fonts.departure-mono
			nerd-fonts.fira-code
			wine64Packages.fonts
	];

}
