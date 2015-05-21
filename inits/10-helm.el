(require 'helm-config)
(helm-mode t)

(require 'helm-git-files)

(require 'helm-descbinds)
(helm-descbinds-mode)
(setq helm-buffer-max-length 50)

(defun my-helm ()
  "`helm' for opening files all resource."
  (interactive)
  (helm-other-buffer `(helm-source-buffers-list
                       helm-git-files:modified-source
                       helm-git-files:untracked-source
                       helm-git-files:all-source
                       helm-source-recentf
                       helm-c-source-files-in-current-dir
					   helm-source-locate
                       ,@(helm-git-files:submodule-sources
                          '(modified untracked all))
                       helm-source-bookmarks)
                     "*my helm*"))

(global-set-key "\M-x" 'helm-M-x)
(global-set-key "\C-xb" 'my-helm)
(global-set-key "\M-y" 'helm-show-kill-ring)
(global-set-key "\M-/" 'helm-ag-r-from-git-repo)
(global-set-key "\C-hb" 'helm-descbinds)

;; open helm list top of new split window in current buffer
(setq helm-display-function (lambda (buf)
							  (split-window-vertically)
							  (switch-to-buffer buf)
							  ))
