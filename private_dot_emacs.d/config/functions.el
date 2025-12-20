;;; functions.el --- Utility functions and helper packages -*- lexical-binding: t; -*-

;;; Commentary:
;; Miscellaneous helper functions and package setup for features like
;; multiple-cursors.

;;; Code:

(defun my/straight-update-and-freeze ()
  "Update packages and update the lockfile."
  (interactive)
  (straight-pull-all)
  (straight-freeze-versions) ; This saves the new versions to your lockfile
  (message "Straight: Packages updated and lockfile frozen."))

(use-package multiple-cursors
  :straight t)

(provide 'functions)

;;; functions.el ends here
