;;; magit-config.el --- Git integration via Magit -*- lexical-binding: t; -*-

;;; Commentary:
;; Configuration for Magit and the Transient library.

;;; Code:

(use-package transient
  :straight t)

(use-package magit
  :straight t
  :config
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-topleft-v1
        magit-bury-buffer-function #'quit-window))

(provide 'magit-config)

;;; magit-config.el ends here
