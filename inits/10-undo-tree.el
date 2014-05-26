(eval-after-load "undo-tree"
  '(progn
     (global-undo-tree-mode)
     (setq undo-tree-auto-save-history t
           undo-tree-history-directory-alist `(("." .,
                                                (expand-file-name "~/.emacs.d/undo-tree-hist/"))))
     (defadvice undo-tree-make-history-save-file-name
       (after undo-tree activate)
       (setq ad-return-value (concat ad-return-value ".gz")))))

(require 'undo-tree)
(global-undo-tree-mode)

(setq undo-tree-auto-save-history t)

(global-set-key [?\C-/] 'undo-tree-undo)
(global-set-key [?\M-/] 'undo-tree-redo)
