(add-to-list 'load-path "~/.emacs.d/elisp/egg/")

(require 'egg)

; no change
(setq egg-switch-to-buffer t)

;; git gutter
(require 'git-gutter-fringe)
(global-git-gutter-mode)
