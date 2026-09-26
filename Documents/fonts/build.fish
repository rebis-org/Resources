set -l font_dir (cd (dirname (status --current-filename)); and pwd)
cd $font_dir

set -l kanji_faces docfs dockt docht docst docxbs
for face in $kanji_faces
  uppltotf shared.jpl "$face.tfm"
  or exit 1
end

set -l lm_otf /usr/local/texlive/2026basic/texmf-dist/fonts/opentype/public/lm
set -l latin_faces lmroman10-regular.otf:docwestr lmroman10-bold.otf:docwestb lmmono10-regular.otf:docmono
for face in $latin_faces
  set -l parts (string split : $face)
  ttf2tfm "$lm_otf/$parts[1]" -q -T 8r.enc "$parts[2].tfm"
  or exit 1
end

ls -l $kanji_faces".tfm" docwestr.tfm docwestb.tfm docmono.tfm
