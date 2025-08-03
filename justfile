set shell := ["sh", "-c"]
set dotenv-load := true

dev:
  watchexec -c=clear just test compile-examples link link-preview

[working-directory: "test"]
test:
  typst compile --root=.. main.typ

[working-directory: "test"]
compile-examples:
  typst compile --root=.. --pages=1-6 --format=png main.typ ../assets/example-{p}.png

# link to local package
link:
  utpm ws l -f

link-preview:
  #!/usr/bin/env nu
  let pkg = cat typst.toml | from toml | $in.package
  let dir = [$env.TYPST_PREVIEW_DIR $pkg.name $pkg.version] | path join | path expand
  rm -rf $dir
  mkdir $dir
  cp -r * $dir
  for entry in [
    ./.git
    ./.gitignore
    ./test/
    ./justfile
    ./.env
  ] { [$dir $entry] | path join | path expand |  rm -rf $in }
