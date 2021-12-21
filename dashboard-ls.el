;;; dashboard-ls.el --- Display files/directories in current directory on Dashboard  -*- lexical-binding: t; -*-

;; Copyright (C) 2020-2021  Shen, Jen-Chieh
;; Created date 2020-03-24 17:49:59

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Display files/directories in current directory on Dashboard.
;; Keyword: directory file show dashboard
;; Version: 0.2.2
;; Package-Requires: ((emacs "24.3") (dashboard "1.2.5"))
;; URL: https://github.com/emacs-dashboard/dashboard-ls

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Display files/directories in current directory on Dashboard.
;;

;;; Code:

(require 'dashboard)

(push '(ls-directories . dashboard-ls--insert-dir) dashboard-item-generators)
(push '(ls-files       . dashboard-ls--insert-file) dashboard-item-generators)

(defvar dashboard-ls-path nil
  "Update to date current path.
Use this variable when you don't have the `default-directory' up to date.")

(defvar dashboard-ls--record-path nil
  "Record of the current working directory.")

(defun dashboard-ls--current-path ()
  "Return the current path the user is on."
  (setq dashboard-ls--record-path (or dashboard-ls-path default-directory))
  dashboard-ls--record-path)

(defun dashboard-ls--insert-dir (list-size)
  "Add the list of LIST-SIZE items from current directory."
  (dashboard-insert-section
   "Current Directories:"
   (let* ((current-dir (dashboard-ls--current-path))
          (dir-lst (when (file-directory-p current-dir) (directory-files current-dir nil "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)")))
          result)
     (dolist (dir dir-lst)
       (when (file-directory-p (expand-file-name dir current-dir))
         (setq dir (concat "./" dir))
         (push (concat dir "/") result)))
     (reverse result))
   list-size
   (dashboard-get-shortcut 'ls-directories)
   `(lambda (&rest ignore)
      (find-file-existing (concat dashboard-ls--record-path ,el)))
   (abbreviate-file-name el)))

(defun dashboard-ls--insert-file (list-size)
  "Add the list of LIST-SIZE items from current files."
  (dashboard-insert-section
   "Current Files:"
   (let* ((current-dir (dashboard-ls--current-path))
          (file-lst (when (file-directory-p current-dir) (directory-files current-dir nil "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)")))
          result)
     (dolist (file file-lst)
       (unless (file-directory-p (expand-file-name file current-dir))
         (setq file (concat "./" file))
         (push file result)))
     (reverse result))
   list-size
   (dashboard-get-shortcut 'ls-files)
   `(lambda (&rest ignore)
      (find-file-existing (concat dashboard-ls--record-path ,el)))
   (abbreviate-file-name el)))

(provide 'dashboard-ls)
;;; dashboard-ls.el ends here
