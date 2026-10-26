{ config, pkgs, inputs, ... }:


let
radius = "4px";
in
{
	home.username = "emmad";
	home.homeDirectory = "/home/emmad";
	programs.ssh = {
		enableDefaultConfig = false;
		enable = true;
		settings."*" = {
			AddKeysToAgent = "yes";
		};

	};
	services.ssh-agent.enable = true;
	programs.git = {
		enable = true;
		settings.user = {
			name = "Emmad Gilani";
			email = "emmadgilani11@gmail.com"; 
		};
	};
	home.stateVersion = "26.05";


	programs.neovim.enable = true;

	stylix = {
		targets = {
			gtk = {
				extraCss = ''
					/* Window frame */
					window.csd,
				window.csd decoration {
					border-radius: ${radius};
				}

				/* Controls and containers */
				button,
					entry,
					spinbutton,
					dropdown,
					searchbar,
					button,
					box,
					tooltip,
					popover > contents,
					modelbutton,
					.card,
					.boxed-list,
					.navigation-sidebar > row,
					gridview > child,
					listview > row {
						border-radius: ${radius};
					}
				'';
			};
		};
	};
}
