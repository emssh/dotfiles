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
};

	outputs = { nixpkgs, home-manager, stylix, ... }@inputs: let
		inherit (nixpkgs) lib; 
	
	in {
		nixosConfigurations.quicksilver = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
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
