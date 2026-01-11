;;; keybinds.el --- Global keyboard shortcuts -*- lexical-binding: t; -*-

;;; Commentary:
;; Consolidated keybindings for all packages including Magit, vterm,
;; Corfu, and Multiple Cursors.

;;; Code:

;; --- Navigation: Avy ---
;; Character Jumps
(global-set-key (kbd "C-:")   'avy-goto-char)       ; Jump by 1 character
(global-set-key (kbd "C-'")   'avy-goto-char-2)     ; Jump by 2 characters

;; Word & Line Jumps
(global-set-key (kbd "M-g w") 'avy-goto-word-1)     ; Jump to word by first letter
(global-set-key (kbd "M-g g") 'avy-goto-line)       ; Jump to any visible line
(global-set-key (kbd "M-g e") 'avy-goto-word-0)     ; Jump to any word (no char needed)

;; The "Search & Jump" (Jump to Symbol)
(global-set-key (kbd "M-s")   'avy-goto-char-timer) ; Type any string to jump to it

;; --- General & Ibuffer ---
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key [remap switch-to-buffer] 'consult-buffer)

;; --- File Management: Dirvish ---

(with-eval-after-load 'dirvish
  (define-key dirvish-mode-map (kbd "?")   'dirvish-dispatch)
  (define-key dirvish-mode-map (kbd "a")   'dirvish-setup-menu)
  (define-key dirvish-mode-map (kbd "f")   'dirvish-file-info-menu)
  (define-key dirvish-mode-map (kbd "o")   'dirvish-quick-access)
  (define-key dirvish-mode-map (kbd "s")   'dirvish-quicksort)
  (define-key dirvish-mode-map (kbd "r")   'dirvish-history-jump)
  (define-key dirvish-mode-map (kbd "l")   'dirvish-ls-switches-menu)
  (define-key dirvish-mode-map (kbd "TAB") 'dirvish-subtree-toggle)
  (define-key dirvish-mode-map (kbd "M-f") 'dirvish-history-last-node)
  (define-key dirvish-mode-map (kbd ";")   'dired-up-directory))

;; --- Magit (from magit-config.el) ---
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'magit-status)

;; --- Terminal: vterm (from vterm-config.el) ---
(global-set-key (kbd "C-c t") 'multi-vterm)

;; --- Completion: Corfu (from buffer-config.el) ---
;; Note: These are applied to the corfu-map specifically
(with-eval-after-load 'corfu
  (define-key corfu-map (kbd "TAB") #'corfu-next)
  (define-key corfu-map (kbd "<tab>") #'corfu-next)
  (define-key corfu-map (kbd "S-TAB") #'corfu-previous)
  (define-key corfu-map (kbd "<backtab>") #'corfu-previous))

;; --- Navigation: Consult (from buffer-config.el) ---
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "M-y") 'consult-yank-pop)

;; --- Multiple Cursors (from keybinds.el) ---
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-S-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-S-c C-S-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'keybinds)

;;; keybinds.el ends here
