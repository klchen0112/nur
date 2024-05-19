# this code from https://github.com/ryan4yin/nur-packages
{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "catppuccin-bat";
  version = "d714cc1d358ea51bfc02550dabab693f70cccea0";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
    hash = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r * $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Bat";
    homepage = "https://github.com/catppuccin/bat";
    license = licenses.mit;
    maintainers = with maintainers; [];
    mainProgram = "bat";
    platforms = platforms.all;
  };
}
