(add-to-list 'load-path "~/.emacs.d/elisp/multiple-cursors/")
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x SPC") 'set-rectangular-region-anchor)

(setq mc/cmds-to-run-for-all
      '(
		c-electric-delete-forward
		ibus-handle-event
		kill-region
		))

(setq mc/cmds-to-run-once
      '(
		))
