;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-modeの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/elisp/ruby/")
(require 'rvm)

(add-to-list 'load-path "~/.emacs.d/elisp/ruby-mode/")

(require 'ruby-mode)
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
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

;; よくあるコードを、自動挿入する。
(require 'ruby-electric)

;; rinari
;; https://github.com/eschulte/rinari
(add-to-list 'load-path "~/.emacs.d/elisp/rinari/")
(require 'rinari)

;; rhtml-mode
;; https://github.com/eschulte/rhtml
(add-to-list 'load-path "~/.emacs.d/elisp/rhtml/")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda ()
      (rinari-launch)
      (gtags-mode 1)))
(setq auto-mode-alist
      (append '(
                ("\\.rxml$" . rhtml-mode)
                ("\\.erb$". rhtml-mode)
                ("\\.rhtml$". rhtml-mode)
                ) auto-mode-alist))

;; rail snippet
(yas/load-directory "~/.emacs.d/elisp/yasnippets-rails/rails-snippets")

;; rspec snippet
(yas/load-directory "~/.emacs.d/elisp/yasnippets-rspec/rspec-snippets")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/elisp/ruby-block/")

(require 'ruby-block)
(ruby-block-mode t)

; ;; 何もしない
; (setq ruby-block-highlight-toggle 'noghing)
;; ミニバッファに表示
(setq ruby-block-highlight-toggle 'minibuffer)
;; オーバレイする
; (setq ruby-block-highlight-toggle 'overlay)
;; ミニバッファに表示し, かつ, オーバレイする.
; (setq ruby-block-highlight-toggle t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode用フック処理追加
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-ruby-mode-hook()
  (define-key ruby-mode-map "\C-m" 'ruby-reindent-then-newline-and-indent)
  ; (pabbrev-mode t)
  (ruby-electric-mode t)
  (ruby-block-mode t)
  (setq ruby-block-highlight-toggle t)
  (local-set-key [f1] 'ri)
  (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
  (local-set-key [f4] 'ri-ruby-show-args)
  (gtags-mode 1)
  (setq ac-sources (append ac-sources
                           '(ac-source-words-in-same-mode-buffers
                             ac-source-gtags
                             ac-source-yasnippet))))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
