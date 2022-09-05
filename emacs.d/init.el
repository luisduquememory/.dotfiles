(load "~/.emacs.d/packages")
(load "~/.emacs.d/keybindings")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-theme 'doom-one t)
(setq inhibit-startup-message t)
;; (setq evil-want-keybinding nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-face-attribute 'default nil :font "Fira Code Retina" :height 150)


;; Enable Evil
(require 'evil)
(evil-mode 1)
(evil-collection-init)
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;; fuzzy find commands and others useful stuff inside emacs
(ivy-mode 1)
(ivy-rich-mode 1)

;; simpler status bar
(doom-modeline-mode 1)

;; enable line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; enable which-key
(which-key-mode)
(setq which-key-idle-delay 0.3)

;; projectile
(projectile-mode)
(setq projectile-completion-system 'ivy)
(setq projectile-project-search-path '(("~/code" . 3)))

;; send all backup files to the temp dir
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
