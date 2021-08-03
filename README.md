## Envscripts

This repo is a bit of a scratch folder but aims to contain all thats needed
to create a windows shell environment that is not too terrible to work with.

Just add the envscripts folder and the aliases folder to the PATH and you're good to go.
There is a copy of cmder under the folder `cmder_mini` in the repo, run/link "Cmder.exe" to use it.
Some of the custom scripts have auto-completion configured in `cmder_mini/vendor/clink-completions`.

It has lots of convenience scripts and aliases that will be useful to none but me.
There are a few paths you'll want to change for things to work properly (just search for brennan)

A couple that are worth using though (they all respond to -h):

- `alias` creates scripts in a manner similar to alias on linux. It cna also be used to list and view existing scripts.
- `go2` is like a command line favourites so you can label useful places or quickly jump to a folder if it exists in a few places.
- `getme` works like which/where commands except it numbers the options so you can simply rerun the command with the added number to continue
- `edit` allows you to quickly work on a repo by finding it under the pwd or the %SCRATCH% folder or cloning it into scratch if not found
