;; ESC cancels all - For example when finding a file
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)

;; Evil
(setq evil-want-keybinding nil)
(general-evil-setup t)
(general-create-definer leader-definition
  ;; :prefix my-leader
  :prefix "SPC")

(leader-definition
  :keymaps 'normal
  "." 'find-file
  "p" 'projectile-command-map
)
