(add-to-list 'load-path "~/.emacs.d/elisp/coffee-mode/")
(autoload 'coffee-mode "coffee-mode" "Major mode for editing CoffeeScript." t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(custom-set-variables '(coffee-tab-width 2))
