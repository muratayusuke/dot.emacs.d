;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; configuration for sh
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq auto-mode-alist
      (append '(
                ("\\.zsh$" . sh-mode)
                ) auto-mode-alist))

(defun my-sh-mode-hook ()
  (interactive)
  (setq sh-basic-offset 0
		sh-indentation 2
		sh-indent-for-then '+
		sh-indent-after-function '+
        indent-tabs-mode nil))

(add-hook 'sh-mode-hook 'my-sh-mode-hook)
