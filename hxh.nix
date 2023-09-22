{ lib, fetchFromGitHub, haskellPackages }:
haskellPackages.mkDerivation {
  pname = "hxh";
  version = "0.1.0.0";
  src = ./.;
  # src = fetchFromGitHub {
  #   owner = "flukacs561";
  #   repo = "mdtf";
  #   rev = "fddde1bba94c07ae04aad9350480a47fd389dce2";
  #   sha256 = "1jy8iiicnfw0wz2gmxpml4bg9sx1w5xb6v5cq2xk476s7vr5y0pb";
  # };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ haskellPackages.base ];
  description = "Helix Haskell extensions";
  license = lib.licenses.gpl3Plus;
  mainProgram = "hxh";
}
