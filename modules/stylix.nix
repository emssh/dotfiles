{ config, lib, pkgs, ... }:

{

	stylix = {
		enable = true;
		
		# Base16 Color Scheme #
		base16Scheme = "/home/emmad/dotfiles/modules/amoled-black.yaml";
		polarity = "dark";
		
		cursor = {
			package = pkgs.bibata-cursors;
			name = "Bibata-Modern-Classic";
			size = 12;
		};
		
		icons = {
			enable = true;
			package = pkgs.kora-icon-theme;
			dark = "kora";
			light = "kora-light";

		};
		
		# Font Style #
		fonts = {
			serif = config.stylix.fonts.monospace;

			sansSerif = config.stylix.fonts.monospace;

			monospace = {
				package = pkgs.nerd-fonts.departure-mono;
				name = "DepartureMono Nerd Font";
			};

			emoji = {
				package = pkgs.noto-fonts-color-emoji;
				name = "Noto Color Emoji";
			};
		};
	};


}
