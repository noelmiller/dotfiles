;;; magit-config.el --- Git integration via Magit -*- lexical-binding: t; -*-

;;; Commentary:
;; Configuration for Magit and the Transient library.

;;; Code:

(use-package transient
  :straight t)

(use-package magit
  :straight t
  :custom
  ;; 1. Open the status buffer in a way that doesn't take over the frame
  (magit-display-buffer-function #'magit-display-buffer-traditional)
  
  ;; 2. Ensure quitting deletes the window rather than "restoring" to dashboard
  (magit-bury-buffer-function #'quit-window)
  
  :config
  (setq magit-display-buffer-alist
        '(("(buffer-name . \"\\*magit: .*\")"
           (display-buffer-reuse-window display-buffer-at-bottom)
           (window-height . 0.4)
           (inhibit-same-window . t))))
  (setq magit-status-sections-hook
        '(magit-insert-status-headers
          magit-insert-merge-log
          magit-insert-rebase-sequence
          magit-insert-am-sequence
          magit-insert-sequencer-sequence
          magit-insert-staged-changes
          magit-insert-unstaged-changes
          magit-insert-untracked-files
          magit-insert-unpushed-to-pushremote
          magit-insert-unpushed-to-upstream-or-recent
          magit-insert-unpulled-from-pushremote
          magit-insert-unpulled-from-upstream)))

(provide 'magit-config)

;;; magit-config.el ends here
