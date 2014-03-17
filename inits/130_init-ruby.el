;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-modeの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/elisp/ruby/")
(require 'rvm)

(add-to-list 'load-path "~/.emacs.d/elisp/ruby-mode/")

(require 'ruby-mode)
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")

(setq auto-mode-alist
      (append '(
                ("\\.rb$" . ruby-mode)
                ("Rakefile" . ruby-mode)
                ("Gemfile" . ruby-mode)
                ("\\.rjs" . ruby-mode)
                ("\\.rake" . ruby-mode)
                ) auto-mode-alist))

(setq interpreter-mode-alist
      (append '(
                ("ruby" . ruby-mode)
                )
              interpreter-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode用フック処理追加
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun ruby-paren-match (arg)
  "RUBY ."
  (interactive "p")
  (let ((cw (thing-at-point 'word)))
    (cond ((looking-at "[[({]")
	   (forward-sexp 1)
	   (backward-char)
	   )
	  ((looking-at "[])}]")
	   (forward-char)
	   (backward-sexp 1)
	   )
	  ((string-match "^\\(end\\|rescue\\|when\\)$" cw)
	   (ruby-beginning-of-block)
	   )
	  ((string-match "^\\(if\\|class\\|module\\|def\\|begin\\|do\\|case\\)$" cw)
	   (ruby-end-of-block)
	   )
	  (t (self-insert-command arg))
	  )
    )
)

(defun my-ruby-mode-hook()
  (define-key ruby-mode-map "\C-m" 'ruby-reindent-then-newline-and-indent)
  (gtags-mode 1)
  (setq ac-sources (append ac-sources
                           '(ac-source-words-in-same-mode-buffers
                             ac-source-gtags
                             ac-source-yasnippet)))
  (local-set-key (kbd "TAB") 'indent-region)
  (local-set-key "\C-]" 'ruby-paren-match)
  (inf-ruby-keys))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;; rubocop
(add-to-list 'load-path "~/.emacs.d/elisp/dash.el/")
(add-to-list 'load-path "~/.emacs.d/elisp/rubocop-emacs/")
(require 'rubocop)

