# Dave's `.bashrc` and Other `bash` Config Files

This repository contains current versions of my `.bashrc` and related `bash` configuration files.


## Install ##

To copy the configuration files to `$HOME`, simply execute `make` or `make install` from inside the repository's root directory. To copy the files to a root directory other than `$HOME`, set the command-line variable `BASHROOT` to the desired install directory, e.g.:

    make BASHROOT=/path/to/wherever

By default, if any configuration files are found in the destination directory that will be overwritten by `make`, backup copies of the existing files will be saved in the same directory under the name `<filename>.orig`. To save these backup files from being overwritten by subsequent calls to `make`, move or rename them *before executing `make` again*.

If backup files are not needed, skip the backup step either by setting the command-line variable `SKIPBACKUP` to any non-empty value, e.g.:

    make SKIPBACKUP=yup

or by executing `make` with the sole target `clobber` or `nobackup`, e.g.:

    make clobber

WARNING: skipping the backup using either of the immediately preceeding two methods will result in any existing files in the install directory being irrevocably *overwritten*.


## Restore ##

If the backup step is not skipped, restore backup files to their original location, overwriting any files installed by `make`, by executing

    make restore

