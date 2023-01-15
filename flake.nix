{
  description = "Sardine: Python's missing algorave module";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [];
      systems = ["x86_64-linux" "aarch64-darwin"];
      perSystem = {
        config,
        pkgs,
        system,
        ...
      }: let
        shell-dev = pkgs.mkShell {
          buildInputs = with pkgs; [poetry];
          shellHook = ''
            echo "Welcome to Sardine developer mode"
          '';
        };
      in {
        devShells.default = shell-dev;
        devShells.dev = shell-dev;
      };
      flake = {};
    };
}
