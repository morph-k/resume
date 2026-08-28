# Typst fork

`resume.typ` is a port of the repository's `main.tex` into
[Typst](https://typst.app/). Same content, same two-page layout — a parallel
implementation, not a replacement.

`main.tex` is still the source of record: the GitHub Actions workflow compiles
it and the blog embeds the `resume.pdf` it produces. Nothing here is published.
An edit to the resume has to be made in both files, or one of them goes stale.

## Building

```sh
nix build .#typst          # -> result/resume.pdf
nix develop .#typst        # shell with typst on PATH
typst compile typst/resume.typ typst/resume.pdf
typst watch typst/resume.typ typst/resume.pdf   # live rebuild
```

Built against Typst 0.15. The output PDF is gitignored.

## How the LaTeX maps over

| `main.tex` | `resume.typ` |
| --- | --- |
| `\titleformat{\section}` + `\titlerule` | `#section(title: ...)`, `#section()` for the untitled summary band |
| `\resumeSubheading` | `#subheading(title, location, role, dates)` |
| footnote-size course/club lines | `#detail[...]` |
| `\resumeItemListStart` / `\resumeItemCustom` | `#bullets(...)` |
| nested `label=$\circ$` itemize | `#subbullets(...)` |
| `tabularx` skills block | a two-column `grid` |
| `\href{url}{text}` | `#link("url")[text]` |

One Typst gotcha the port runs into: a `+` at the start of a source line is
enum syntax, so the literal ones in the electives and Python tooling lists are
escaped as `\+`.
