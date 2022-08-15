{ lib
, fetchFromGitHub
, buildDotnetPackage
, dotnetPackages
, pkg-config
}:
buildDotnetPackage rec {
  pname = "fvim";
  baseName = pname; # workaround for "called without baseName"
  version = "0.3.531+g119a455";
  src = fetchFromGitHub {
    owner = "yatli";
    repo = "fvim";
    rev = "v${version}";
    sha256 = "sha256-Gm6YhzodAE1dae5wZoKVRDE3cPnxj89o3LyAwNmMNKI=";
  };
  projectFile = ["Avalonia/fvim_avalonia.fsproj"];
  propagatedBuildInputs = [
  ];
  buildInputs = [
    # unit tests
    dotnetPackages.NUnit
    dotnetPackages.NUnitRunners
  ];
  nativeBuildInputs = [
    pkg-config
  ];
  meta = with lib; {
    description = "Cross platform Neovim front-end UI, built with F# + Avalonia";
    homepage = "https://github.com/yatli/fvim";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ luxus ];
    platforms = platforms.linux ++ platforms.darwin;
    mainProgram = "fvim";
  };
}
