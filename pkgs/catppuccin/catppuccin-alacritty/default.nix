{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "catppuccin-alacritty";
  version = "6c66bd9";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "alacritty";
    rev = version;
    hash = "sha256-jgGjdgVHrG4/uQU6GjDvd+ogM8NonoUjwpzYnEQuenc=";
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
