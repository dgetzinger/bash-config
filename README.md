# Dave's `.bashrc` and Other `bash` Config Files

This repository contains current versions of my `.bashrc` and related `bash` configuration files.


## Install

To copy the configuration files to `$HOME`, simply execute `make` from inside the repository's root directory. To copy the files to a root directory other than `$HOME`, define `BASHROOT` at the command line, e.g.:

    make BASHROOT=/path/to/wherever

By default, the Makefile saves backup copies of any configuration files found in the `bash` root directory so they are not overwritten. Backups are saved in their original directories under the name `<filename>.orig` and can be restored by executing

    make restore

Skip this step by setting the command-line variable `SKIPBACKUP` to any non-empty value, in which case no backups will be made and any original configuration files will be unrestorably *overwritten*.