;; ESC cancels all - For example when finding a file
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)

;; General is a package, not a section
(general-create-definer leader-definition
  ;; :prefix my-leader
  :prefix "SPC")

(leader-definition
  :keymaps 'normal
  "." 'find-file
  "d" 'dap-hydra
  "p" 'projectile-command-map
  "SPC" 'projectile-find-file
)

;; dired
(general-override-mode)
(general-define-key
:states '(normal)
:keymaps 'dired-mode-map
  "+" 'dired-create-directory
  "d" 'dired-flag-file-deletion
  "j" 'dired-next-line
  "k" 'dired-previous-line
  "m" 'dired-mark
  "q" 'quit-window
  "R" 'dired-do-rename
  "r" 'revert-buffer
  "t" 'dired-toggle-marks
  "u" 'dired-unmark
  "x" 'dired-do-flagged-delete
  ;; open
  (kbd "RET") 'dired-find-file
)
