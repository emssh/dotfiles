{
	description = "NixOS T480";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
      			url = "github:youwen5/zen-browser-flake";
      			inputs.nixpkgs.follows = "nixpkgs";
   		};
	};

	outputs = { nixpkgs, home-manager, stylix, zen-browser, ... }@inputs: let
		inherit (nixpkgs) lib; 

	in {
		nixosConfigurations.quicksilver = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				stylix.nixosModules.stylix
					./configuration.nix
					home-manager.nixosModules.home-manager
					{
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							extraSpecialArgs = { inherit inputs; };
							users.emmad = import ./home.nix;
							backupFileExtension = "backup";
						};
					}
			];
		};
	};
}
