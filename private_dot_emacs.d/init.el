;;; init.el --- User configuration entry point -*- lexical-binding: t; -*-

;;; Commentary:
;; Main initialization file that loads modular configuration files
;; from the ~/.emacs.d/config directory.

;;; Code:

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

(require 'package-management)
(require 'theme)
(require 'buffer-config)
(require 'lsp)
(require 'vterm-config)
(require 'magit-config)
(require 'functions)
(require 'autosave)
(require 'keybinds)

(provide 'init)

;;; init.el ends here
