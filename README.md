# Dave's `.bashrc` and Other `bash` Config Files

This repository contains current versions of my `.bashrc` and related `bash` configuration files.


## Install ##

To copy the configuration files to `$HOME`, simply execute `make` or `make install` from inside the repository's root directory.

To install the files to a root directory other than `$HOME`, set the command-line variable `INSTALL_DIR` to the desired install directory, e.g.:

    make INSTALL_DIR=/path/to/wherever

By default, `make` will save backup copies of any configuration files found in the destination directory that will be overwritten under the name `<filename>-00000000000000`, where `00000000000000` is a timestamp in the format YYYYMMDDHHMMSS (UTC time).

If backup files are not needed, skip the backup step by executing `make clobber`, `make nobackup` or `make skipbackup`, e.g.:

    make clobber

WARNING: skipping the backup will result in any existing files in the install directory being irrevocably *overwritten*.

Delete any unwanted backup files from the install directory by executing

    make clean


## Use ##

`make` copies three files to the install directory: `.bash_profile`, `.bash_logout`, and `.bashrc`.

Of these, `.bashrc` is the core file that contains most customizations.

In addition to copying these three configuration files to the installation directory, `make` also creates a subdirectory named `.bash.d` under the install directory, if `.bash.d` does not already exist. On invocation, `.bashrc` searches `.bash.d` and sources any scripts whose filenames end in `.sh`, excluding filenames prefixed by an underscore (`_`). This makes `.bash.d` a useful container for start-up shell scripts such as function definitions, while the underscore exclusion enables the user to disable particular scripts merely by prefixing an underscore to the script filename.
