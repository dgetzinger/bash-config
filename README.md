# Dave's `.bashrc` and Other `bash` Config Files

This repository contains current versions of my `.bashrc` and related `bash` configuration files.


## Install ##

To copy the configuration files to `$HOME`, simply execute `make` or `make install` from inside the repository's root directory.

To install the files to a root directory other than `$HOME`, set the command-line variable `BASHROOT` to the desired install directory, e.g.:

    make BASHROOT=/path/to/wherever

By default, `make` will save backup copies of any configuration files found in the destination directory that will be overwritten under the name `<filename>-00000000000000`, where `00000000000000` is an ISO-format timestamp in the format YYYYMMDDHHMMSS.

If backup files are not needed, skip the backup step by executing `make clobber`, `make nobackup` or `make skipbackup`, e.g.:

    make clobber

WARNING: skipping the backup will result in any existing files in the install directory being irrevocably *overwritten*.

Delete any unwanted backup files from the install directory by executing

    make clean


## Use ##

`make` copies three files to the destination directory: `.bash_profile`, `.bash_logout`, and `.bashrc`. Of these, `.bashrc` is the most important, containing colorized prompts and other customizations. `.bash_profile` exists only to source `.bashrc` for both interactive and noninteractive shells on Mac and Linux.

In addition to copying these three configuration files to the installation directory, `make` also creates a subdirectory named `.bash.d` under the install directory. On invocation, `.bashrc` searches `.bash.d` and executes any scripts ending in the filename extension `.sh`, making `.bash.d` a useful storage directory for start-up shell scripts such as function definitions.
