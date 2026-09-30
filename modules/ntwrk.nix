{ config, lib, pkgs, ... }:

{


	networking.hostName = "quicksilver";

	networking.networkmanager.enable = true;

	systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [];
	
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = false;
	};

	networking.firewall = {
		enable = true;
		allowedTCPPorts = [ 53317 ];
		allowedUDPPorts = [ 53317 ];
	};

	services.printing.enable = true;

}
