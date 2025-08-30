{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "bricolage-grotesque";
  version = "unstable-2023-07-19";

  src = fetchFromGitHub {
    owner = "ateliertriay";
    repo = "bricolage";
    rev = "84745e5b96261ae5f8c6c856e262fe78d1d6efdd";
    hash = "sha256-K79ojosZqVg3S9cfBzI3d7ny+90cLCJq7W4XNotsP14=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm644 -t $out/share/fonts/truetype fonts/variable/*.ttf
    runHook postInstall
  '';

  meta = {
    description = "Bricolage Grotesque is an expressive variable font with weight, width and optical size axis.";
    homepage = "https://github.com/ateliertriay/bricolage";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
}
