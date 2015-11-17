(require 'terraform-mode)
(setq auto-mode-alist
      (append '(
                ("\\.tf" . terraform-mode)
                ) auto-mode-alist))
