<!--
SPDX-FileCopyrightText: 2013,2020,2024 Robin Schneider <ypid@riseup.net>

SPDX-License-Identifier: GPL-3.0-or-later
-->

# latex-git-log

This program will output the entire version history as table written in LaTeX
if it is executed within a git repository.
When file argument(s) are given, only the history that changed these file(s)
will be output.

It is intended that you redirect the standard output of this script to a file which can then be included from your main LaTeX document.

Because the table can be very large you might want to put the thing on a
landscape page.

## Dependencies

### Of this script

This script requires the following Perl modules:

    IPC::System::Simple
    Locale::Maketext::Simple

Everything else should already be installed.

### To compile the output

The table is using the *longtable* package and the links to a web resource for
each commit use the `\href` macro from *hyperref*. So these two packages have
to be loaded.

Furthermore you need to define the macro `\longtableendfoot` which will be
expanded on the bottom of every page if the table will be continued on the next
page. You can defined it to a localized message to inform the reader that this
table is not complete and will be continued.

## License and development

License: GPL-3.0-or-later <br/>
CTAN: https://ctan.org/pkg/latex-git-log <br/>
Source code repository: https://github.com/ypid/typesetting/tree/master/scripts/latex-git-log <br/>
Please report bugs and feature requests at https://github.com/ypid/typesetting/issues

## Usage

    latex-git-log [options] [file] ...

    Options:

      --author          set this if you want the author included
      --width           set the width in cm of the commit message field in the LaTeX table
      --git-c-add       set an base URL to link to a commit
      --user            set a github user to derive the base URL
      --repo            set a github repository to derive the base URL
      --lang            language of the legend and all strings in the output
      --version, -v     print version of this script
      --help            brief help message
      --man             full documentation
      --range           specify a git revision range

### Description of some options

    --width Set the width in cm of the commit message field in the LaTeX
            table. If this parameter is not set then the table is not
            vertically limited. That means that if you have a very long
            commit message then the table will probably not fit on the page
            and you will get a "Overfull" error message from TeX.

            In this case you should specify the width of the column
            containing the commit messages. I normally use something like
            --width=14 for DIN A4 in landscape.

    --git-c-add
            Set an base URL to link to a commit. This script will
            automatically try to use the base URL for github.

    --lang  Set the language of the legend and all strings in the output. By
            default the language of your system is used but you can
            overwrite this with this parameter.

            Currently this script only supports English and German. If you
            need a translation to another language then you can either
            create a .po file or I can register this project on one of those
            websites for online translation.

## Bugs and limitations

* The translation features does not seem to work. So this script is unable to output German. English works.
