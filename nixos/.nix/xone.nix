 { stdenv, fetchFromGitHub, kernel }:

stdenv.mkDerivation rec {
  pname = "xone";
  version = "0.3";

  src = fetchFromGitHub {
    owner = "medusalix";
    repo = pname;
    rev = "bbf0dcc484c3f5611f4e375da43e0e0ef08f3d18";
    sha256 = "sha256-w2xVNMvm5WZKHxdCOziQ6I/HI23USCr6oN8bo3XE7UI=";
  };

  setSourceRoot = ''
    export sourceRoot=$(pwd)/${src.name}
  '';

  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "-C"
    "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "M=$(sourceRoot)"
    "VERSION=${version}"
  ];

  buildFlags = [ "modules" ];
  installFlags = [ "INSTALL_MOD_PATH=${placeholder "out"}" ];
  installTargets = [ "modules_install" ];
}
