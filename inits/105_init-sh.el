;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; configuration for sh
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-sh-mode-hook ()
  (interactive)
  (setq sh-basic-offset 2
        sh-indentation 2
        indent-tabs-mode nil))

(add-hook 'sh-mode-hook 'my-sh-mode-hook)