;; ibus-mode
;; this requires ibus-el package
(require 'ibus)
;; Turn on ibus-mode automatically after loading .emacs
(add-hook 'after-init-hook 'ibus-mode-on)
;; Use C-SPC for Set Mark command
(ibus-define-common-key ?\C-\s nil)
;; Use C-/ for Undo command
(ibus-define-common-key ?\C-/ nil)
;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("limegreen" "white" "blue"))

;; enable key and disable key
(global-set-key [?\C-'] 'ibus-enable)
(global-set-key [?\C-\;] 'ibus-disable)
;; Enable muhenkan key only for preediting
;;(ibus-define-common-key 'muhenkan nil)
;;(ibus-define-preedit-key 'muhenkan t)
