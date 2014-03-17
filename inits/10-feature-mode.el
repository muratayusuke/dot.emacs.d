(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; set rspec-mode like key map
(define-key feature-mode-map  (kbd "C-c ,a") 'feature-verify-all-scenarios-in-project)
