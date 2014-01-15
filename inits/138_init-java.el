(defun my-java-mode-hook()
  (gtags-mode 1))
(add-hook 'java-mode-hook 'my-java-mode-hook)
