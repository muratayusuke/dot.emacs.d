;; デバッグ
(setq debug-on-error t)

;; 選択部分をハイライト
(transient-mark-mode t)

;; TAB幅の設定
(setq-default tab-width 4)
(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))
(require 'sudo-ext)

;; 自動で最大化
(set-frame-parameter nil 'fullscreen 'maximized)

;; auto revert when other process change files
(global-auto-revert-mode 1)

;; paren match
(defun paren-match (arg)
  "Go to the matching parenthesis."
  (interactive "p")
  (cond ((looking-at "[[({]")
         (forward-sexp 1)
         (backward-char)
         )
        ((looking-at "[])}]")
         (forward-char)
         (backward-sexp 1)
         )
        (t (self-insert-command arg))
        ))
(global-set-key "\C-]" 'paren-match)

;; uniquify
(require 'uniquify)

;; popwin.el
(add-to-list 'load-path "~/.emacs.d/elisp/popwin-el")
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; turn off toolbar
(tool-bar-mode -1)

;; join line
(global-set-key (kbd "C-S-j")
				(lambda ()
				  (interactive)
				  (join-line -1)))

;; text-scale
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
(global-set-key (kbd "<C-mouse-6>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-7>") 'text-scale-decrease)
(define-key global-map (kbd "C-0")
  '(lambda ()
     (interactive)
     (progn (text-scale-mode 0)(buffer-face-mode 0))))
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-+") 'text-scale-increase)

;; dmacro
(defconst *dmacro-key* "\C-t" "繰返し指定キー")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

;; highlight-indentation
(add-to-list 'load-path "~/.emacs.d/elisp/highlight-indentation")
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;; isearch with selected region
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))
