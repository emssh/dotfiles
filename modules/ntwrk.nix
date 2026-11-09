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
		allowedTCPPorts = [ 53317 22 ];
		allowedUDPPorts = [ 53317 22 ];
	};



	services.printing.enable = true;

	services.openssh = {
		enable = true;
		openFirewall = true;
		settings = {
			PasswordAuthentication = false;
			KbdInteractiveAuthentication = false;
			PermitRootLogin = "no";
			AllowUsers = [ "myUser" ];
			MaxAuthTries = 3;
			PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
		};
	};

}
