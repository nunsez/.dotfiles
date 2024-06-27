{
  description = "Dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?rev=c1a16412b44d133c7f6a37ad993bfd7323bd9180";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager?rev=6d3b6dc9222c12b951169becdf4b0592ee9576ef";
    };
  };

  outputs = { self, nixpkgs, home-manager }: {
    packages.x86_64-linux =
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      repo = builtins.getEnv "REPO";
    in
    {
      default = pkgs.home-manager;

      homeConfigurations.alex = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit repo;
        };
      };
    };
  };
}
