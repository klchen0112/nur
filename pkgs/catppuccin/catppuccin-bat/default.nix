# this code from https://github.com/ryan4yin/nur-packages
{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "catppuccin-btop";
  version = "21b8d5956a8b07fa52519e3267fb3a2d2e693d17";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "btop";
    rev = version;
    hash = "sha256-J3UezOQMDdxpflGax0rGBF/XMiKqdqZXuX4KMVGTxFk=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r * $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for btop";
    homepage = "https://github.com/catppuccin/btop";
    license = licenses.mit;
    maintainers = with maintainers; [];
    mainProgram = "btop";
    platforms = platforms.all;
  };
}
