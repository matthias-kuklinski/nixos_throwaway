{
  description = "Nixos config flake";
     
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
     url = "github:nix-community/disko";
     inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, disko, home-manager, ... }:
  {
    nixosConfigurations = {
      thor = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          { disko.devices.disk.main.device = "/dev/nvme0n1"; }
          ./hosts/thor

         home-manager.nixosModules.home-manager {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           home-manager.users.matthias = import ./home-manager/thor.nix;
         }
        ];
      };
    };
    # homeConfigurations = {
    #   "matthias@thor" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #     modules = [ ./home/thor.nix ];
    #   };
    # };
  };
}
