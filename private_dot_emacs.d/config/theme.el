;;; theme.el --- Visual appearance and UI settings -*- lexical-binding: t; -*-

;;; Commentary:
;; Configures the Catppuccin theme, Dashboard, Beacon,
;; and general UI elements like fonts and disabled bars.

;;; Code:

(load-theme 'modus-vivendi-tinted t)

(use-package beacon
  :straight t
  :config
  (beacon-mode 1))

(use-package dashboard
  :straight t
  :init
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  (dashboard-setup-startup-hook)
  :config
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)))
  (setq dashboard-banner-logo-title "Welcome to Emacs")
  (setq dashboard-startup-banner 'logo)
  (add-hook 'server-after-make-frame-hook #'dashboard-refresh-buffer))

(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 140)

(provide 'theme)

;;; theme.el ends here
