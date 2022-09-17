(load "~/.emacs.d/packages/init")
(load "~/.emacs.d/lsp")
(load "~/.emacs.d/dap")
(load "~/.emacs.d/keybindings")
(load "~/.emacs.d/dired")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(put 'dired-find-alternate-file 'disabled nil)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 150)

;; enable line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; send all backup files to the temp dir
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; keep buffers updates
(global-auto-revert-mode t)

 ;; Disable line numbers for some modes
 ;; line numbers in fish produces odd behaviours
  (dolist (mode '(org-mode-hook vterm-mode-hook dired-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))
