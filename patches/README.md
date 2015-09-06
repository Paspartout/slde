# Patches applied

This folder contains patches I applied to my branches of dwm, st, dmenu and dzen.

## st

- st-no-bold-colors.diff: Taken from [suckless.org](http://st.suckless.org/patches/solarized_color_scheme)
  this patch disables st behaviour to alter the color of bold text.
- st-base16-tpl.diff: This patch replaces each color in st's config.h.def with 
  base16 color placeholders that can later easily replaced using sed.
