# link to local package on file change
dev:
  watchexec -e typ,bib just test

link:
  watchexec utpm ws l -f

[working-directory: "test"]
test:
  typst compile --root=.. main.typ
