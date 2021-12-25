[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![MELPA](https://melpa.org/packages/dashboard-ls-badge.svg)](https://melpa.org/#/dashboard-ls)
[![MELPA Stable](https://stable.melpa.org/packages/dashboard-ls-badge.svg)](https://stable.melpa.org/#/dashboard-ls)

# dashboard-ls
> Display files/directories in current directory on Dashboard.

[![CI](https://github.com/emacs-dashboard/dashboard-ls/actions/workflows/test.yml/badge.svg)](https://github.com/emacs-dashboard/dashboard-ls/actions/workflows/test.yml)

## Usage

```el
(require 'dashboard-ls)
(setq dashboard-items '((ls-directories . 5)
                        (ls-files . 5)))
```

## Contribute

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Elisp styleguide](https://img.shields.io/badge/elisp-style%20guide-purple)](https://github.com/bbatsov/emacs-lisp-style-guide)

If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!
