;; This is only the file a use for related configurations
;; the initial use-package config is in package.el

(require 'lsp-mode)

;; python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
