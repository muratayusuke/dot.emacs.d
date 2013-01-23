;;; 試行錯誤用ファイルを開くための設定
(require 'open-junk-file)
;; C-x C-zで試行錯誤ファイルを開く
(global-set-key (kbd "C-x C-z") 'open-junk-file)

;;; 式の評価結果を注釈するための設定
(require 'lispxmp)
;; emacs-lisp-modeでC-c　C−dを押すと注釈される
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

;;; 括弧の対応を保持して編集する設定
;;(require 'paredit)
;;(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;;(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;;(add-hook 'lisp-mode-hook 'enable-paredit-mode)
;;(add-hook 'ielm-mode-hook 'enable-paredit-mode)

;(require 'auto-async-byte-compile)
;; 自動バイトコンパイルを無効にするファイル名の正規表現
;(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
;(add-hook 'emacs-lisp-mode-hook 'turn-on-cwarn-mode)
;(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
;(setq eldoc-idle-delay 0.2)       ; すぐに表示したい
;(setq eldoc-minor-mode-string "") ; モードラインにElDocと表示しない

;; 釣り合いの取れる括弧をハイライトする
;(show-paren-mode 1)

;; 改行と同時にインデントも行う
(global-set-key "\C-m" 'newline-and-indent)

;; find-functionをキー割り当てする
(find-function-setup-keys)

;; 正規表現のグルーピング部分に色付け
(set-face-foreground 'font-lock-regexp-grouping-backslash "green3")
(set-face-foreground 'font-lock-regexp-grouping-backslash "green")
