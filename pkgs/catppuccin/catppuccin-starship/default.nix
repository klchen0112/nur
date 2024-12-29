# this code from https://github.com/ryan4yin/nur-packages
{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "catppuccin-starship";
  version = "3c4749512e7d552adf48e75e5182a271392ab176";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "starship";
    rev = "5629d23";
    hash = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r * $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Starship";
    homepage = "https://github.com/catppuccin/starship";
    license = licenses.mit;
    maintainers = with maintainers; [];
    mainProgram = "starship";
    platforms = platforms.all;
  };
}
