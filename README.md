# resume

The LaTeX source of record. `main.tex` is edited here and nowhere else.

The page people read is on the blog: **<https://morphykuffour.github.io/resume>**.
That page does not keep its own copy of the resume — it embeds `resume.pdf` from
this repository's Pages site, so whatever this repository last built is what it
shows. Push here and the blog follows; there is nothing to rebuild over there.

## How a change gets published

1. Edit `main.tex` on `main` and push.
2. `.github/workflows/compile-resume.yml` compiles it, renames the output to
   `resume.pdf`, and commits that back to `main`.
3. GitHub Pages serves the new `resume.pdf`, and the blog picks it up on the
   next load. Pages caches the file for ten minutes, which is the only lag.

To iterate before pushing, `./watch.sh` runs latexmk in continuous mode with
Zathura auto-reloading. `flake.nix` carries the toolchain: `nix develop` puts
TeX Live (`scheme-full`) on PATH, and `nix build` compiles the document
straight to `result/main.pdf`.

## The URLs

- `morph-k.github.io/resume/resume.pdf` — the built PDF. The blog embeds this
  and links it as the download, so treat it as a published URL, not an
  implementation detail.
- `morph-k.github.io/resume` — `index.html`, which redirects to the blog page.
  It exists so links that predate the move keep landing somewhere useful.
