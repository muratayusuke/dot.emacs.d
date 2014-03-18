(setq el-get-dir "~/.emacs.d/elisp/el-get/")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;; define el-get repository
(setq el-get-sources
      '(
        (:name auto-highlight-symbol
               :type github
               :pkgname "emacsmirror/auto-highlight-symbol")
        ))

;; Packages to install from el-get
(defvar my/el-get-packages
  '(
    auto-highlight-symbol
    )
  "A list of packages to install from el-get at launch.")

(el-get 'sync my/el-get-packages)
