set -l tlroot /usr/local/texlive/2026basic
set -l tldist $tlroot/texmf-dist
set -l documents_dir (cd (dirname (status --current-filename))/..; and pwd)
set -l fonts_dir $documents_dir/fonts
set -l system_fonts /System/Library/Fonts /Library/Fonts $HOME/Library/Fonts
set -x TEXMFCNF $tlroot
set -x TEXINPUTS ".:$documents_dir:$tldist/tex//:"
set -x TEXFORMATS ".:$documents_dir/fmt:$tldist/web2c:"
set -x TFMFONTS ".:$fonts_dir:$tldist/fonts/tfm//:"
set -x OPENTYPEFONTS (string join : . $fonts_dir $tldist/fonts/opentype// $system_fonts)":"
set -x TRUETYPEFONTS (string join : . $fonts_dir $tldist/fonts/truetype// $system_fonts)":"
set -x T1FONTS ".:$tldist/fonts/type1//:"
set -x AFMFONTS ".:$tldist/fonts/afm//:"
set -x ENCFONTS ".:$tldist/fonts/enc//:"
set -x VFFONTS ".:$tldist/fonts/vf//:"
set -x TEXFONTMAPS ".:$fonts_dir:$tlroot/texmf-var/fonts/map//:$tldist/fonts/map//:"
