;; 使い方：~/.emacs内にこのファイルを読み込むよう記載する
;; (load "~/.emacs.d/init.el")

;; デバッグ
(setq debug-on-error t)

;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; init-loader
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
;; デフォルトで"~/.emacs.d/inits"以下のファイルをロードする
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load)

;; 行番号表示
;(require 'wb-line-number)
;(wb-line-number-toggle)

;; 選択部分をハイライト
(transient-mark-mode t)

;; TAB幅の設定
(setq-default tab-width 4)
(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; 自動でフォーカスのあるウィンドウの幅を広げる
(require 'widen-window)
(global-widen-window-mode t)

;; emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))
(require 'sudo-ext)

;; 自動で最大化
(set-frame-parameter nil 'fullscreen 'maximized)

;; auto revert when other process change files
(auto-revert-mode)