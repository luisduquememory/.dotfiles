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
  "w" 'which-key-show-top-level
)
