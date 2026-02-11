;;; lsp.el --- Language Server Protocol configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Configures lsp-mode for various languages including Rust, Python,
;; Ansible, and Web development, integrated with Flycheck and Yasnippet.

;;; Code:

(use-package yasnippet
  :straight t
  :config
  (yas-global-mode 1))

(use-package yasnippet-capf
  :straight t
  :after yasnippet)

(use-package flycheck
  :straight t
  :init (global-flycheck-mode))

(use-package dockerfile-mode
  :straight t
  :mode ("Dockerfile\\'" "Containerfile\\'")
  :init (setq dockerfile-mode-command "podman"))

(use-package yaml-mode
  :straight t
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(use-package lua-mode
  :straight t
  :interpreter "lua")

(use-package markdown-mode
  :straight t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :config (add-hook 'markdown-mode-hook 'flyspell-mode))

(use-package json-mode
  :straight t)

(use-package ansible
  :straight t)

(use-package rust-mode
  :straight t)

(use-package web-mode
  :straight t
  :mode ("\\.html?\\'"))

(use-package just-mode
  :straight t
  :mode ("\\justfile\\'" . just-mode))

(use-package cape
  :straight t)

(use-package nix-mode
  :straight t
  :mode ("\\.nix\\'"))

(use-package lsp-mode
  :straight t
  :custom
  (lsp-completion-provider :none)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (defun my/lsp-mode-setup-completion ()
    "Properly merge LSP, snippets, and files for Corfu."
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       (cape-capf-buster #'lsp-completion-at-point) ; Refresh LSP cache
                       #'yasnippet-capf                             ; Add snippets to list
                       #'cape-file))))                              ; Add file path support
  :hook ((ansible-mode . lsp)
         (c-mode . lsp)
         (dockerfile-mode . lsp)
         (go-mode . lsp)
         (json-mode . lsp)
         (lua-mode . lsp)
         (markdown-mode . lsp)
         (python-mode . lsp)
         (rust-mode . lsp)
         (sh-mode . lsp)
         (typescript-mode . lsp)
         (yaml-mode . lsp)
         (web-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration)
         (lsp-mode . my/lsp-mode-setup-completion))
  :commands lsp
  :config
  (setq lsp-auto-install-server t)
  (setq lsp-helm-ls-executable "helm_ls")
  (setq lsp-diagnostics-provider :flycheck))

(use-package consult-lsp
  :straight t
  :after lsp-mode)

(provide 'lsp)

;;; lsp.el ends here
