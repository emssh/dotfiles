{ config, lib, pkgs, ... }:

{

	stylix = {
		enable = true;
		
		# Base16 Color Scheme #
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-pale.yaml";
		polarity = "dark";
		
		targets.chromium.enable = true;
		
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
