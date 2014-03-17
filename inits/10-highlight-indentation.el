(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

(defun my-highlight-indentation-hook()
  (highlight-indentation-current-column-mode))

(add-hook 'ruby-mode-hook 'my-highlight-indentation-hook)
(add-hook 'haml-mode-hook 'my-highlight-indentation-hook)
