(require 'helm-config)
(helm-mode t)

(require 'helm-git-files)

(defun my-helm ()
  "`helm' for opening files all resource."
  (interactive)
  (helm-other-buffer `(helm-source-buffers-list
                       helm-source-recentf
                       helm-c-source-files-in-current-dir
					   helm-source-locate
                       helm-git-files:modified-source
                       helm-git-files:untracked-source
                       helm-git-files:all-source
                       ,@(helm-git-files:submodule-sources
                          '(modified untracked all))
                       helm-source-bookmarks)
                     "*my helm*"))

(global-set-key "\M-x" 'helm-M-x)
(global-set-key "\C-xb" 'my-helm)
(global-set-key "\M-y" 'helm-show-kill-ring)
(global-set-key "\M-/" 'helm-ag-r-from-git-repo)
