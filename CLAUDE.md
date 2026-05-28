# md2pdf — notes for future agents

A bash wrapper around `pandoc --pdf-engine=xelatex` that compiles Markdown to
a Libertinus-typeset PDF. The whole tool is one script (`md2pdf`) plus a
4-line `pandoc-header.tex`. `install.sh` copies them to `~/.local/bin/` and
`~/.local/share/md2pdf/`.

## Don't undo these decisions

**Font size uses `fontsize.sty`, not pandoc's `-V fontsize=`.** Pandoc's
default `article` class only recognises `10pt`, `11pt`, `12pt`; anything else
is silently dropped and the document falls back to 10pt. The `fontsize` LaTeX
package accepts any positive value (including non-integers) and rescales line
spacing to match. `--font-size N` injects
`\usepackage[fontsize=Npt]{fontsize}` into the header.

**The extra header for `--font-size` is written to a tempfile, not passed via
`<(...)` process substitution.** Pandoc opens header files in a way that
breaks on `/dev/fd/N` (`withBinaryFile: does not exist`). The script
`mktemp`s a `.tex` file and cleans it up via `trap ... EXIT`.

## Things to know

- `--open` is WSL-only. It calls SumatraPDF on Windows via the `MD2PDF_SUMATRA`
  path (default points at the current user's `AppData\Local\SumatraPDF`).
  `-reuse-instance` so re-running refreshes the existing window instead of
  stacking.
- Everything after the input/output filenames is forwarded verbatim to
  `pandoc`, so the script doesn't need to grow flags for things pandoc
  already supports (`-V geometry:margin=...`, `--toc`, etc.).

## Editing workflow

The canonical source is this repo. The installed copy at `~/.local/bin/md2pdf`
is a build artefact. Edit here, then `./install.sh` to refresh the installed
copy.
