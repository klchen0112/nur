# this code from https://github.com/ryan4yin/nur-packages
{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "catppuccin-alacritty";
  version = "343cf8d65459ac8f6449cc98dd3648bcbd7e3766";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "alacritty";
    rev = version;
    hash = "sha256-5MUWHXs8vfl2/u6YXB4krT5aLutVssPBr+DiuOdMAto=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r * $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Alacritty";
    homepage = "https://github.com/catppuccin/alacritty";
    license = licenses.mit;
    maintainers = with maintainers; [];
    mainProgram = "alacritty";
    platforms = platforms.all;
  };
}
