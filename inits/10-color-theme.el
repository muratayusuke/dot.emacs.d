(require 'color-theme)
(color-theme-initialize)

(defun my-color-theme ()
  "color theme for programming"
  (interactive)
  (color-theme-install
   '(color-theme-example
     ((foreground-color . "white")
      (background-color . "black")
      (border-color . "black")
      (mouse-color . "light gray")
      (cursor-color . "light gray")
      (background-mode . dark))
     (default ((t (nil))))
     (region ((t (:foreground "black" :background "snow3"))))

     ;; fond-lock
     (font-lock-warning-face ((t (:foreground "NavajoWhite2" :bold nil :weight normal))))
     (font-lock-comment-face ((t (:foreground "NavajoWhite2"))))
     (font-lock-string-face ((t (:foreground "tomato2"))))
     (font-lock-keyword-face ((t (:foreground "DarkSeaGreen3"))))
     (font-lock-constant-face ((t (:foreground "aquamarine3"))))
     (font-lock-type-face ((t (:foreground "DarkOliveGreen3"))))
     (font-lock-variable-name-face ((t (:foreground "burlywood3"))))
     (minibuffer-prompt ((t (:foreground "LightSkyBlue"))))
     (compilation-info ((t (:foreground "DarkOliveGreen3" :bold nil :weight normal))))
     (escape-glyph ((t (:foreground "aquamarine3"))))
     (link ((t (:foreground "LightSkyBlue"))))

     (comint-highlight-prompt ((t (:foreground "LightSkyBlue" :bold nil :weight normal))))
     )))

(my-color-theme)
