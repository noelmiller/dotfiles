;;; package-management.el --- Setup package management and MELPA -*- lexical-binding: t; -*-

;;; Commentary:
;; This file bootstraps the straight.el package manager and configures
;; the built-in package.el to include the MELPA repository.

;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(require 'package)
;; Add the MELPA archive to the list of package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(provide 'package-management)

;;; package-management.el ends here
