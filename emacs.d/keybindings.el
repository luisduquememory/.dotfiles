;; ESC cancels all - For example when finding a file
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)

;; General is a package, not a section


;; available everywhere
(general-define-key
  :states '(normal)
  :keymaps 'override ;; see https://github.com/noctuid/general.el/issues/99#issuecomment-360914335
  :prefix "SPC"
  "." 'find-file
  "d" 'dap-hydra
  "p" 'projectile-command-map
  "SPC" 'projectile-find-file
  "t" 'vterm-toggle
)
