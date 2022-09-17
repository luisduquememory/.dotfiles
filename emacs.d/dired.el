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

;; move files to trash on dired
(setq delete-by-moving-to-trash t)
; this is the default location on mac,
; in linux remember to syslink your trash to
; this location
(setq trash-directory "~/.Trash")

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(setq insert-directory-program "/usr/local/bin/gls")
(setq dired-listing-switches "-lAh --group-directories-first")
