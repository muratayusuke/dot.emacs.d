(autoload 'scss-mode "scss-mode")
(setq scss-compile-at-save nil)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(defun configure-auto-complete-for-scss ()
  (add-to-list 'ac-sources 'ac-source-css-property))
(add-hook 'scss-mode-hook
		  #'(lambda ()
			  (setq indent-tabs-mode nil)
			  (set (make-local-variable 'css-indent-offset) 2)
              (configure-auto-complete-for-scss)
			  ))
(add-to-list 'ac-modes 'scss-mode)
