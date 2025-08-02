# link to local package on file change
link:
  watchexec utpm ws l -f

[working-directory: "test"]
test:
  typst compile --root=.. main.typ
