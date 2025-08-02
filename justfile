dev:
  watchexec -c -e typ,bib just test

# link to local package
link:
  utpm ws l -f

[working-directory: "test"]
test:
  typst compile --root=.. main.typ
