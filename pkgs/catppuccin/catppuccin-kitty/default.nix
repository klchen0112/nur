{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-kitty";
  version = "unstable-2024-11-10";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "kitty";
    rev = "b14e8385c827f2d41660b71c7fec1e92bdcf2676";
    hash = "sha256-59ON7CzVgfZUo7F81qQZQ1r6kpcjR3OPvTl99gzDP8E=";
  };

  meta = {
    description = "Soothing pastel theme for Kitty";
    homepage = "https://github.com/catppuccin/kitty";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "catppuccin-kitty";
    platforms = lib.platforms.all;
  };
}
