(require 'recentf-ext)

(setq recentf-auto-cleanup 'never)
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 500)
(add-to-list 'recentf-exclude "^/[^/:]+:")
(add-to-list 'recentf-exclude "svn-commit\.tmp$")
(add-to-list 'recentf-exclude "COMMIT_EDITMSG")
(add-to-list 'recentf-exclude "bookmarks")
(add-to-list 'recentf-exclude "\\.recentf")
(add-to-list 'recentf-exclude "\\.revive\\.el")

(recentf-mode 1)
