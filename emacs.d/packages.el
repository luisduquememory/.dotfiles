(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))


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
  :init
  (evil-collection-init)
)

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package general
  :init
  (general-evil-setup t)
)

(use-package ivy
  :init
  (ivy-mode 1)
)

(use-package ivy-rich
  :init
  (ivy-rich-mode 1)
)

(use-package magit)

(use-package projectile
  :init
  (projectile-mode)
  :config
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path '(("~/code" . 3)))
)

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2)
)

(use-package which-key
  :init
  (setq which-key-idle-delay 0) ;; always set before mode activation
  (which-key-mode)
)
