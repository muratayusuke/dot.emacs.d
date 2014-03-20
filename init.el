;; 使い方：~/.emacs内にこのファイルを読み込むよう記載する
;; (load "~/.emacs.d/init.el")

;; package configuration
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'cl)

;; install packages
(defvar my-installing-package-list
  '(
    ;; init-loader
    init-loader

    ;; for package compile
    dash
    f

	;; helm
	helm
	helm-gtags
	helm-git-files
	helm-ag-r
	helm-descbinds

	;; edit-mode
	emmet-mode
	php-mode
	markdown-mode
	scss-mode
	coffee-mode
	js2-mode
	yaml-mode

	;; ruby
	feature-mode
	rubocop
	inf-ruby

	;; region related
	multiple-cursors
	expand-region
	anzu

	;; git
	magit
	git-gutter-fringe
	gitconfig-mode
	gitignore-mode

	;; flycheck
	flycheck
	flycheck-pos-tip

	;; others
	golden-ratio
	auto-complete
	smartparens
	undohist
	highlight-indentation
	color-theme
	yasnippet
    ))

(let ((not-installed (loop for x in my-installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

(require 'dash)
(require 'f)

(defun was-compiled-p (path)
  "Does the directory at PATH contain any .elc files?"
  (--any-p (f-ext? it "elc") (f-files path)))

(defun ensure-packages-compiled ()
  "If any packages installed with package.el aren't compiled yet, compile them."
  (--each (f-directories package-user-dir)
    (unless (was-compiled-p it)
      (byte-recompile-directory it 0))))

(ensure-packages-compiled)

;; load-path
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; init-loader
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
;; デフォルトで"~/.emacs.d/inits"以下のファイルをロードする
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load)
