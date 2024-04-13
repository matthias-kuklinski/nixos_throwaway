{
  description = "nixos-config";
     
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, disko, home-manager, ...}@inputs:
  {
    nixosConfigurations = {
      thor = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          # filesystem
          disko.nixosModules.disko
          # (import ./hosts/thor/disko.nix { device = "/dev/nvme0n1"; })
          ./hosts/thor/disko.nix { 
            _module.args.device = "/dev/nvme0n1"; 
          }

          # operating system
          ./hosts/thor
          
          # user space
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.matthias = import ./home-manager/matthias.nix;
          }
        ];
      };
      apollo = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          # filesystem
          disko.nixosModules.disko
          # (import ./hosts/apollo/disko.nix { device = "/dev/nvme0n1"; })
          ./hosts/apollo/disko.nix { 
            _module.args.device = "/dev/nvme0n1"; 
          }

          # operating system
          ./hosts/apollo
          
          # user space
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.matthias = import ./home-manager/matthias.nix;
          }
        ];
      };
    };
  };
}
