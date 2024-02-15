{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  android-nixpkgs = callPackage (import (builtins.fetchGit {
    url = "https://github.com/tadfisher/android-nixpkgs.git";
  })) { channel = "stable"; };
  android-sdk = android-nixpkgs.sdk (sdkPkgs: with sdkPkgs; [
    cmdline-tools-latest
    build-tools-33-0-2
    platform-tools
    platforms-android-33
  ]);
in mkShell {
  buildInputs = [ android-sdk gradle_7 ];

  shellHook = ''
    alias cordova='/home/giovanni/Edu3/Workspace/edu3-mobile-html5/node_modules/cordova/bin/cordova'
  '';

  GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${android-sdk}/share/android-sdk/build-tools/33.0.2/aapt2";
}
