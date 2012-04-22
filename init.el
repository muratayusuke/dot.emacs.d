;; 使い方：~/.emacs内にこのファイルを読み込むよう記載する
;; (load "~/.emacs.d/init.el")


;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
;(add-to-list 'load-path "~/.emacs.d/auto-install")

;; init-loader
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
;; デフォルトで"~/.emacs.d/inits"以下のファイルをロードする
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load)

;; 行番号表示
(require 'wb-line-number)
(wb-line-number-toggle)

;; 選択部分をハイライト
(transient-mark-mode t)

