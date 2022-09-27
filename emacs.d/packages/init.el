(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/packages/evil-motion-trainer")
(load "evil-motion-trainer")
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))


;; enable lsp before everything else
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c s")
)

;;; Packages are listed alphabetically
;;; not by usage or priority
(use-package all-the-icons
  :if (display-graphic-p))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
)

(use-package counsel)

(use-package dap-mode
  :config
  (setq dap-python-debugger 'debugpy)
)

(require 'dap-python)

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t)    ; if nil, bold is universally disabled
  (setq     doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)
  (doom-themes-org-config) ; Corrects (and improves) org-mode's native fontification.
  )

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (evil-mode 1)
  :config
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
)

(use-package evil-collection
  :after (evil)
  :config
  (setq evil-collection-mode-list '(dired))
  (evil-collection-init)
)

(use-package evil-goggles
  :config
  (evil-goggles-mode)
)
;; evil-motion-trainer
(global-evil-motion-trainer-mode 1)
(setq evil-motion-trainer-threshold 4)

(use-package evil-quickscope
  :after evil
  :config
  (global-evil-quickscope-mode 1)
)

(use-package evil-nerd-commenter
  :bind ("s-/" . evilnc-comment-or-uncomment-lines))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))

(use-package general
  :init
  (general-evil-setup t)
  :config
  (general-override-mode)
)

(use-package ivy
  :init
  (ivy-mode 1)
)

(use-package ivy-rich
  :init
  (ivy-rich-mode 1)
)

(use-package magit
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package projectile
  :init
  (projectile-mode)
  :config
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path '(("~/code" . 3)))
  (setq projectile-switch-project-action 'projectile-dired)
)

(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
)

(use-package tree-sitter-langs)

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2)
  (require 'dap-node)
  (dap-node-setup) ;; Automatically install node debug adapter if needed
)

(use-package vterm)

(use-package vterm-toggle
  :after vterm)

(use-package which-key
  :init
  (setq which-key-idle-delay 0.3) ;; always set before mode activation
  (which-key-mode)
  :config
  (lsp-enable-which-key-integration t)
)


(use-package yaml-mode
  :mode "\\.ya?ml\\'")

(use-package yasnippet
  :init
  (yas-global-mode 1)
)
