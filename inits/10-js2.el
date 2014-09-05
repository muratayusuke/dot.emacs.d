(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(defun my-js2-mode-hook ()
  (setq indent-tabs-mode nil
		js2-basic-offset 2))

  (add-hook 'js2-mode-hook 'my-js2-mode-hook)
