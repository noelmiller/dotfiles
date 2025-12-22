;;; theme.el --- Visual appearance and UI settings -*- lexical-binding: t; -*-

;;; Commentary:
;; Configures the Catppuccin theme, Dashboard, Beacon,
;; and general UI elements like fonts and disabled bars.

;;; Code:

(use-package catppuccin-theme
  :straight t)

(use-package auto-dark
  :straight t
  :config
  (ignore-errors
    (setq auto-dark-themes '((catppuccin) (catppuccin)))

    (add-hook 'auto-dark-dark-mode-hook
              (lambda ()
                (setq catppuccin-flavor 'mocha)
                (catppuccin-reload)))

    (add-hook 'auto-dark-light-mode-hook
              (lambda ()
                (setq catppuccin-flavor 'latte)
                (catppuccin-reload)))

    (auto-dark-mode 1)))

(use-package beacon
  :straight t
  :config
  (beacon-mode 1))

(use-package dashboard
  :straight t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)))
  (setq dashboard-banner-logo-title "Welcome to Emacs")
  (setq dashboard-startup-banner 'logo))

(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 140)

(provide 'theme)

;;; theme.el ends here
