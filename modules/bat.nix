{ config, lib, pkgs, ... }:

{

	powerManagement.enable = true;
	
	services.upower.enable = true;

	services.thermald.enable = true;

}
