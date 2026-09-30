{ config, pkgs, inputs, ... }:

let
dot = "/home/emmad/dotfiles/config";
link = path: config.lib.file.mkOutOfStoreSymlink "${dot}/${path}";
in

{
	xdg.configFile = {
	"waybar/config".source = link "waybar/config";
	"waybar/style.css".source = link "waybar/style.css";
	"niri/config.kdl".source = link "niri/config.kdl";
	"kitty/kitty.conf".source = link "kitty/kitty.conf";
	};


	home.username = "emmad";
	home.homeDirectory = "/home/emmad";
	programs.ssh = {
		enable = true;
		addKeysToAgent = "yes";
	};
	programs.git = {
		enable = true;
		settings.user = {
			name = "Emmad Gilani";
			email = "emmadgilani11@gmail.com"; 
		};
	};
	home.stateVersion = "26.05";

	home.packages = [ pkgs.waybar ];


	programs.neovim.enable = true;

	programs.rofi = {
		enable = true;
		settings = {
			show-icons = true;
		};
		plugins = [ pkgs.rofi-power-menu ];
	};

	stylix.targets.waybar.enable = false;
	programs.btop.enable = true;

	programs.wlogout = {
		enable = true;

	};
}
