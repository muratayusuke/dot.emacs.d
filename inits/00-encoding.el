;; set default encoding utf-8-unix
(add-hook 'after-init-hook '(lambda ()
    (setq default-buffer-file-coding-system 'utf-8-unix)
))

;; controll order of auto detect encoding
(prefer-coding-system 'euc-jp-unix)
(prefer-coding-system 'utf-8-unix)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
