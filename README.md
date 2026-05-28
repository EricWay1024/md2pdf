# md2pdf

A tiny wrapper around `pandoc + xelatex` for turning a Markdown file into a
nicely-typeset PDF, using **Libertinus Serif** for body text and **Libertinus
Math** for mathematics.

Intended for short, math-heavy artefacts (homework sheets, problem sets,
summary handouts) where you want LaTeX-quality typography without writing
`\documentclass{article}` by hand.

## Requirements

- `pandoc`
- `xelatex` (TeX Live or MiKTeX)
- LaTeX packages: `unicode-math`, `fontsize`, `geometry`
- Fonts: Libertinus Serif, Libertinus Sans, Libertinus Math (installed
  system-wide; on Debian/Ubuntu: `sudo apt install fonts-libertinus`)

## Install

```bash
git clone https://github.com/EricWay1024/md2pdf.git
cd md2pdf
./install.sh
```

This copies `md2pdf` into `~/.local/bin/` and the header into
`~/.local/share/md2pdf/`. Make sure `~/.local/bin` is on your `PATH`.

## Usage

```bash
md2pdf input.md                              # → input.pdf
md2pdf input.md output.pdf                   # explicit output name
md2pdf --open input.md                       # compile, then open in SumatraPDF (WSL)
md2pdf --font-size 14 input.md               # body at 14pt (default 12pt)
md2pdf --font-size=11.5 input.md             # non-integer sizes OK
md2pdf input.md -V geometry:margin=2cm       # any extra args pass through to pandoc
```

## Flags

| Flag              | Description                                              |
|-------------------|----------------------------------------------------------|
| `--open`          | Open the PDF in SumatraPDF (WSL-only, reuses the window) |
| `--font-size N`   | Body font size in pt (any positive number). Default 12.  |

Anything after the input/output filenames is forwarded to `pandoc`.

## Environment variables

| Variable          | Default                                                          |
|-------------------|------------------------------------------------------------------|
| `MD2PDF_HEADER`   | `~/.local/share/md2pdf/pandoc-header.tex`                        |
| `MD2PDF_MARGIN`   | `2.5cm`                                                          |
| `MD2PDF_SUMATRA`  | `/mnt/c/Users/yuhan/AppData/Local/SumatraPDF/SumatraPDF.exe`     |

Override `MD2PDF_SUMATRA` if your SumatraPDF lives elsewhere.

## License

MIT.
