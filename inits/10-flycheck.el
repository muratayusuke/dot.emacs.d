(require 'flycheck)
(require 'flycheck-pos-tip)
(add-hook 'after-init-hook #'global-flycheck-mode)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(defun flycheck-print-current-checker (args)
  "Print checker for current buffer.
ARGS is dummy"
  (interactive "P")
  (print (flycheck-get-checker-for-buffer))
  )

(flycheck-define-checker chef-foodcritic
  "A Chef cookbooks syntax checker using Foodcritic.

See URL `http://acrmp.github.io/foodcritic/'."
  :command ("foodcritic" source)
  :error-patterns
  ((error line-start (message) ": " (file-name) ":" line line-end))
  :modes (enh-ruby-mode ruby-mode)
  :predicate
  (lambda ()
    (let ((parent-dir (f-parent default-directory)))
      (or
       ;; Chef CookBook
       ;; http://docs.opscode.com/chef/knife.html#id38
       (locate-dominating-file parent-dir "recipes")
       ;; Knife Solo
       ;; http://matschaffer.github.io/knife-solo/#label-Init+command
       (locate-dominating-file parent-dir "cookbooks"))))
  :next-checkers ((warnings-only . ruby-rubocop)))
