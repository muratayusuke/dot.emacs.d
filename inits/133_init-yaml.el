(add-to-list 'load-path "~/.emacs.d/elisp/yaml-mode/")
(autoload 'yaml-mode "yaml-mode" "Major mode for editing yaml-mode." t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
