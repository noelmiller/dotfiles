;;; buffer-config.el --- Completion and Minibuffer UI -*- lexical-binding: t; -*-

;;; Commentary:
;;  Sets up the completion stack. Keybinds moved to keybinds.el

;;; Code:

(use-package corfu
  :straight t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match t)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
  (with-eval-after-load 'multiple-cursors
    (add-hook 'multiple-cursors-mode-enabled-hook #'corfu-quit)
    (add-hook 'multiple-cursors-mode-disabled-hook #'corfu-mode)))

(use-package kind-icon
  :straight t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; blend with corfu background
  :config
  (setq kind-icon-use-cache t)) ; cache icons for better performance

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
  :straight t
  :init
  (vertico-mode 1)
  :custom
  (vertico-cycle t))

(use-package savehist
  :init
  (savehist-mode 1))

(use-package marginalia
  :straight t
  :init
  (marginalia-mode 1))

(use-package which-key
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 0.5))

(use-package consult
  :straight t)

(provide 'buffer-config)

;;; buffer-config.el ends here
