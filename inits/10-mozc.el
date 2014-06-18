(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

;; not working...
(progn ;toggle input method
  (define-key global-map "\C-'"
	(lambda ()
	  (interactive)
	  (if current-input-method (inactivate-input-method))
	  (toggle-input-method)))
  ;; (define-key global-map [muhenkan]
  ;;   (lambda ()
  ;;     (interactive)
  ;;     (inactivate-input-method)))
  (define-key global-map [zenkaku-hankaku]
	(lambda ()
	  (interactive)
	  (toggle-input-method)))

  (defadvice mozc-handle-event (around intercept-keys (event))
	"Intercept keys muhenkan and zenkaku-hankaku, before passing keys to mozc-server (which the function mozc-handle-event does), to properly disable mozc-mode."
	(if (member event (list 'zenkaku-hankaku 'muhenkan))
	    (progn
	      (mozc-clean-up-session)
	      (toggle-input-method))
	  (progn ;(message "%s" event) ;debug
	    ad-do-it)))
  (ad-activate 'mozc-handle-event))
