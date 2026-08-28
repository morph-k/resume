{
  description = "LaTeX resume build environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        tex = pkgs.texlive.combined.scheme-full;
      in
      {
        # `nix build` -> compiles main.tex into result/main.pdf
        packages.default = pkgs.stdenvNoCC.mkDerivation {
          pname = "resume";
          version = "1.0";
          src = ./.;
          nativeBuildInputs = [ tex ];
          buildPhase = ''
            latexmk -pdf -interaction=nonstopmode main.tex
          '';
          installPhase = ''
            mkdir -p $out
            cp main.pdf $out/
          '';
        };

        # `nix build .#typst` -> compiles typst/resume.typ into result/resume.pdf
        packages.typst = pkgs.stdenvNoCC.mkDerivation {
          pname = "resume-typst";
          version = "1.0";
          src = ./.;
          nativeBuildInputs = [ pkgs.typst ];
          buildPhase = ''
            typst compile typst/resume.typ resume.pdf
          '';
          installPhase = ''
            mkdir -p $out
            cp resume.pdf $out/
          '';
        };

        # `nix develop` -> shell with the LaTeX toolchain on PATH
        devShells.default = pkgs.mkShell {
          packages = [ tex ];
        };

        # `nix develop .#typst` -> shell with the Typst toolchain on PATH
        devShells.typst = pkgs.mkShell {
          packages = [ pkgs.typst ];
        };
      });
}
