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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cucumber.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/elisp/cucumber.el/")

;; ;(setq feature-default-language "fi")
;; ;; point to cucumber languages.yml or gherkin i18n.yml to use
;; ;; exactly the same localization your cucumber uses
;; ;(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
;; ;; and load feature-mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

; bind return to newline-and-indent
(defun my-feature-mode-hook()
  (define-key feature-mode-map "\C-m" 'newline-and-indent)
  (rinari-launch)
  (gtags-mode 1))

(add-hook 'feature-mode-hook 'my-feature-mode-hook)

;; set rspec-mode like key map
(define-key feature-mode-map  (kbd "C-c ,a") 'feature-verify-all-scenarios-in-project)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode用フック処理追加
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-ruby-mode-hook()
  (define-key ruby-mode-map "\C-m" 'ruby-reindent-then-newline-and-indent)
  (gtags-mode 1)
  (setq ac-sources (append ac-sources
                           '(ac-source-words-in-same-mode-buffers
                             ac-source-gtags
                             ac-source-yasnippet))))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
