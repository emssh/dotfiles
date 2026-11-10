{ config, lib, pkgs, inputs, ...}:

### === PACKAGES === ###

{

	xdg.mime.enable = true;
	xdg.menus.enable = true;

	services.displayManager.noctalia-greeter = {
		enable = true;
		package = pkgs.noctalia-greeter;
		cursorTheme = {
			name = "Bibata-Modern-Classic";
			package = pkgs.bibata-cursors;
		};
		settings = {
			appearance.hide_logo = true;
		};
	};

	programs.fish = {
		enable = true;
		shellInit = ''
			set -g fish_greeting ""
			'';
		shellAliases = {
			nixsw = "sudo nixos-rebuild switch --impure --flake ~/dotfiles#quicksilver";
			nixup = "nix flake update";
		};

	};

	programs.starship = {
		enable = true;
		presets = ["nerd-font-symbols"];
	};

	programs.niri.enable = true;   

	programs.firefox.enable = true;

	programs.noctalia = {
		enable = true;
		package = pkgs.noctalia;
		recommendedServices.enable = true;
		systemd = {
			enable = true;
			target = "graphical-session.target";
		};
	};

	environment.systemPackages = with pkgs; [
# Terminal #
			kitty
			quickshell
			fastfetch
			vim
			lmstudio-bionic

# Utils #
			fzf
			cargo
			wl-clipboard
			brightnessctl
			wget
			xwayland-satellite
			speedtest-cli
			android-tools
			go-mtpfs
			xdg-user-dirs
			xdg-user-dirs-gtk
			bitwarden-cli
# Apps #
			nautilus
			eog
			mpv
			zathura
			bitwarden-desktop
			obsidian
			brave
			localsend
			zed-editor
			parsec-bin
			inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
			inputs.hermes-agent.packages.${pkgs.stdenv.hostPlatform.system}.desktop
			jabref
# Communication #
			discord
			signal-desktop

			];

	programs.nix-ld.enable = true;

	nixpkgs.config.allowUnfree = true;

# = FONTS = #

	fonts.packages = with pkgs; [
		nerd-fonts.departure-mono
			nerd-fonts.fira-code
			wine64Packages.fonts
	];
}
