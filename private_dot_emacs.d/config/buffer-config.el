;;; buffer-config.el --- Completion and Minibuffer UI -*- lexical-binding: t; -*-

;;; Commentary:
;;  Sets up the completion stack.  Keybinds moved to keybinds.el

;;; Code:

;; enable line numbers
(global-display-line-numbers-mode t)

(use-package dimmer
  :straight t
  :init
  (dimmer-mode 1)
  :custom
  (dimmer-fraction 0.4)  ;; Adjust how dark the inactive windows get (0.0 to 1.0)
  :config
  ;; Ensure dimmer doesn't interfere with your completion popups or which-key
  (add-to-list 'dimmer-exclusion-regexp-list "^\\*corfu\\*")
  (add-to-list 'dimmer-exclusion-regexp-list "^\\*which-key\\*")
  (add-to-list 'dimmer-exclusion-regexp-list "^\\*Messages\\*"))

(use-package avy
  :straight t
  :custom
  (avy-timeout-seconds 0.3)   ;; Speed up the delay for multi-char jumps
  (avy-style 'at-full)        ;; Place labels directly on the target
  (avy-all-windows t)         ;; Jump across all visible splits/windows
  (avy-background t))         ;; Dim the background to highlight labels

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
  :straight t
  :config
  (setq consult-preview-key 'any))

(use-package nerd-icons
  :straight t)

(use-package dirvish
  :straight t
  :init
  (dirvish-override-dired-mode) ; Replace Dired with Dirvish globally
  :custom
  ;; Optional: Define quick access points (Home, Downloads, etc.)
  (dirvish-quick-access-entries
   '(("h" "~/"                                           "Home")
     ("d" "~/Downloads/"                                 "Downloads")
     ("e" "~/.local/share/chezmoi/private_dot_emacs.d/"  "Emacs")
     ("r" "~/repos/"                                     "Repos")
     ("t" "~/.local/share/Trash/files/"                  "Trash")))
  :config
  (add-hook 'dirvish-preview-setup-hook
            (lambda ()
              (display-line-numbers-mode -1))))

(provide 'buffer-config)

;;; buffer-config.el ends here
