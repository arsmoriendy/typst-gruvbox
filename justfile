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
