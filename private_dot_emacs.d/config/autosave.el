;;; autosave.el --- Configure auto saves in a separate directory -*- lexical-binding: t; -*-

;;; Commentary:
;;  Sets up autosaves so they don't show up in my project directories.

;;; Code:

;; Create the directory if it doesn't exist
(make-directory (expand-file-name "~/.emacs.d/temp/auto-saves/") t)
(make-directory (expand-file-name "~/.emacs.d/temp/backups/") t)

;; Relocate auto-save files
(setq auto-save-list-file-prefix (expand-file-name "~/.emacs.d/temp/sessions/" user-emacs-directory))
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.emacs.d/temp/auto-saves/") t)))

;; Relocate backup files (the ones ending in ~)
(setq backup-directory-alist `((".*" . "~/.emacs.d/temp/backups/")))

;; Keep auto-save files from being deleted on normal exit (optional, but safer)
(setq delete-auto-save-files nil)

(provide 'autosave)

;;; autosave.el ends here
