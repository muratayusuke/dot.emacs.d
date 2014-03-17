(add-to-list 'load-path "/usr/local/share/gtags/")
(require 'gtags)

;; auto update gtags when file saved
(defun my-update-gtags ()
  (let* ((file (buffer-file-name (current-buffer)))
     (dir (directory-file-name (file-name-directory file))))
    (when (executable-find "global")
	  (if (string= (shell-command-to-string "pgrep gtags") "")
		  (start-process "gtags-update" nil
						 "global" "-uv")))))

(add-hook 'after-save-hook
      'my-update-gtags)

(defun my-tag-mode-insert-hook ()
  (gtags-mode 1))

(add-hook 'js2-mode-hook 'my-tag-mode-insert-hook)
(add-hook 'perl-mode-hook 'my-tag-mode-insert-hook)
(add-hook 'php-mode-hook 'my-tag-mode-insert-hook)
(add-hook 'c-mode-common-hook 'my-tag-mode-insert-hook)
(add-hook 'rhtml-mode-hook 'my-tag-mode-insert-hook)
(add-hook 'feature-mode-hook 'my-tag-mode-insert-hook)
(add-hook 'ruby-mode-hook 'my-tag-mode-insert-hook)
(add-hook 'emacs-lisp-mode-hook 'my-tag-mode-insert-hook)
(add-hook 'lisp-mode-hook 'my-tag-mode-insert-hook)
(add-hook 'nxml-mode-hook 'my-tag-mode-insert-hook)

(setq gtags-mode-hook
      '(lambda ()
         (local-set-key (kbd "M-.") 'helm-gtags-find-tag)
         (local-set-key (kbd "M-,") 'helm-gtags-find-rtag)
         (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
         (local-set-key (kbd "M-*") 'helm-gtags-pop-stack)))

;; change synbol regexp for finding emacs function
(defun helm-gtags-token-at-point ()
  (save-excursion
    (let (start)
      (when (looking-at "[a-zA-Z0-9_]")
        (skip-chars-backward "a-zA-Z0-9_-")
        (setq start (point))
        (skip-chars-forward "a-zA-Z0-9_-")
        (buffer-substring-no-properties start (point))))))
