(load "~/.emacs.d/packages/init")
(load "~/.emacs.d/lsp")
(load "~/.emacs.d/dap")
(load "~/.emacs.d/keybindings")
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

;; this section makes dired kill extra buffers when
;; when find a file or go up a directory
(eval-after-load "dired"
;; don't remove `other-window', the caller expects it to be there
'(defun dired-up-directory (&optional other-window)
"Run Dired on parent directory of current directory."
(interactive "P")
(let* ((dir (dired-current-directory))
(orig (current-buffer))
(up (file-name-directory (directory-file-name dir))))
(or (dired-goto-file (directory-file-name dir))
;; Only try dired-goto-subdir if buffer has more than one dir.
(and (cdr dired-subdir-alist)
(dired-goto-subdir up))
(progn
(kill-buffer orig)
(dired up)
(dired-goto-file dir))))))

;; keep buffers updates
(global-auto-revert-mode t)

 ;; Disable line numbers for some modes
 ;; line numbers in fish produces odd behaviours
  (dolist (mode '(org-mode-hook vterm-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))
