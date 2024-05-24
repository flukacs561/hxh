{
  description = "LiTS is a library tagging CLI tool";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... }:
  let system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.haskellPackages.mkDerivation {
      pname = "hxh";
      version = "0.1.0.0";
      src = ./.;
      isLibrary = false;
      isExecutable = true;
      buildDepends = with pkgs.haskellPackages; [
        base
        time
        text
      ];
      executableHaskellDepends = with pkgs.haskellPackages; [ base ];
      description = "Library Tagging System";
      license = pkgs.lib.licenses.mit;
      mainProgram = "lits";
    };
  };
}
