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
  "bd" 'kill-buffer-and-window
  "d" 'dap-hydra
  "p" 'projectile-command-map
  "SPC" 'projectile-find-file
  "t" 'vterm-toggle
  "ww" 'evil-window-prev
  "wl" 'evil-window-right
  "wh" 'evil-window-left
)

(general-define-key
  :states '(normal)
  ;; use this for a better dvorak experience
  "t" 'evil-quickscope-find-char
  "T" 'evil-quickscope-find-char-backward
  "f" 'evil-quickscope-find-char-to
  "F" 'evil-quickscope-find-char-to-backward
  ;; general has a swap key option
  ;; but this doesn't work for me, not sure why
  ;; see here -> https://github.com/noctuid/general.el#key-translation
)
