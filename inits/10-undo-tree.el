(require 'undo-tree)
(global-undo-tree-mode)

(setq undo-tree-auto-save-history t)

(global-set-key [?\C-/] 'undo-tree-undo)
(global-set-key [?\M-/] 'undo-tree-redo)
