;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; configuration for sh
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-sh-mode-hook ()
  (interactive)
  (setq sh-basic-offset 4
		sh-indentation 4
		sh-indent-for-then '+
		sh-indent-after-function '+
        indent-tabs-mode nil))

(add-hook 'sh-mode-hook 'my-sh-mode-hook)