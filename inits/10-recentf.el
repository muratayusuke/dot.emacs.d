(require 'recentf-ext)

(setq recentf-auto-cleanup 'never)
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("^/[^/:]+:" "/svn-commit\.tmp$" "COMMIT_EDITMSG"
						"/bookmarks$"))

(recentf-mode 1)
