(require 'haml-mode)
(setq auto-mode-alist
      (append '(
                ("\\.haml" . haml-mode)
                ) auto-mode-alist))
