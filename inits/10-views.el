; 選択範囲（リージョン）をハイライト
(transient-mark-mode 1)

; 対応する｛｝をハイライト
(show-paren-mode 1)

;; シンタックスハイライトを有効にする
(global-font-lock-mode t)

;; font-lockでの装飾レベル
(setq font-lock-maximum-decoration t)
(setq fast-lock nil)
(setq lazy-lock nil)
(setq jit-lock t)

; 色設定
;; region の色


(if (boundp 'window-system)
    (setq initial-frame-alist
          (append (list
                   '(menu-bar-lines . 1)
                   ; '(font . "MS Mincho 12")
                   ;; 東雲なら shinonome16-fontset などを指定
                   ; '(vertical-scroll-bars . nil) ;;スクロールバーはいらない
                   '(width . 205) ;; ウィンドウ幅
                   '(height . 71) ;; ウィンドウの高さ
                   ; '(top . 60) ;;表示位置
                   ; '(left . 140) ;;表示位置
                   '(line-spae 0)
                   )
                  initial-frame-alist)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; フォントの設定
;;01234567890123456789
;;あいうえおかきくけこ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cond (window-system
       (set-face-attribute 'default nil
                           :family "Takao Pゴシック"
                           :height 100)
       (set-fontset-font (frame-parameter nil 'font)
                         'japanese-jisx0208
                         '("Takaoゴシック" . "unicode-bmp")
                         )
       (set-fontset-font (frame-parameter nil 'font)
                         'katakana-jisx0201
                         '("Takaoゴシック" . "unicode-bmp")
                         )
	   (set-fontset-font (frame-parameter nil 'font)
						 'mule-unicode-0100-24ff
						 '("monaco" . "iso10646-1")
						 )
       (setq face-font-rescale-alist
             '(
               (".*さざなみゴシック.*" . 1.0)
               (".*Takaoゴシック.*"    . 1.1)
               ))
       ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; initial frameのサイズ設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cond (window-system
       (setq default-frame-alist
             (append (list
                      '(width  . 255)
                      '(height . 77)
                      '(top    . 50)
                      '(left   . 300)
                      )
                     initial-frame-alist))
       ))

;====================================
; スクロール設定
;====================================
(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 4) ;4行ずつスクロールする

;; ツールバーを隠す
(tool-bar-mode -1)

;; show EOF
(setq-default indicate-empty-lines t)
