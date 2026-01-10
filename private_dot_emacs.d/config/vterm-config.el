;;; vterm-config.el --- Terminal configuration using vterm -*- lexical-binding: t; -*-

;;; Commentary:
;; This file contains installation for vterm

;;; Code:
(use-package vterm
  :straight t
  :config
  (add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1))))

(provide 'vterm-config)

;;; vterm-config.el ends here
