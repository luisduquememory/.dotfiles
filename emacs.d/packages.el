(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

; list the packages you want
(setq package-list'(
  all-the-icons
  doom-modeline doom-themes
  evil evil-collection
  general
  ivy ivy-rich counsel
  magit
  projectile
  ripgrep
  which-key
  )
)

; activate all the packages
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
