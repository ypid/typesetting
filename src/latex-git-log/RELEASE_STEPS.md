<!--
SPDX-FileCopyrightText: 2024 Robin Schneider <ypid@riseup.net>

SPDX-License-Identifier: GPL-3.0-or-later
-->

# Release steps

* `datalad run --message "chore(latex-git-log): regenerate example.tex" "bazel run write_example_output_tex --config=release"`
* `bazel build example_pdf --config=release` as simple test if it compiles and looks good
* If you are on a feature or release branch, merge it to the default branch.
* `cz bump`
* `bazel build pkg_zip --config=release`
* https://ctan.org/pkg/latex-git-log -> Upload
