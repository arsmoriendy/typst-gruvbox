dev:
  watchexec -c -e typ,bib just test

# link to local package
link:
  utpm ws l -f

[working-directory: "test"]
test:
  typst compile --root=.. main.typ

[working-directory: "test"]
compile-examples:
  typst compile --root=.. --pages=1-6 --format=png main.typ ../assets/example-{p}.png

[working-directory: "assets"]
build-assets: compile-examples
  ffmpeg -i example-1.png -i example-2.png -i example-3.png -i example-4.png -i example-5.png -i example-6.png -filter_complex hstack=inputs=6 -y -v 16 example.webp
  rm example-*.png
