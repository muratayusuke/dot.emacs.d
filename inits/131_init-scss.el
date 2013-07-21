(add-to-list 'load-path "~/.emacs.d/elisp/scss-mode/")
(autoload 'scss-mode "scss-mode")
(setq scss-compile-at-save nil)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
