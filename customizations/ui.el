;; Turn off the menu bar
(menu-bar-mode -1)

;; Line numbering
(require 'linum)
(global-linum-mode t)

;; Disable line numbering for certain modes
(defcustom linum-disabled-modes-list
  '(eshell-mode wl-summary-mode compilation-mode org-mode dired-mode erc-mode term-mode)
  "* List of modes disabled when global linum mode is on"
  :type '(repeat (sexp :tag "Major mode"))
  :tag " Major modes where linum is disabled: "
  :group 'linum)
(defcustom linum-disable-starred-buffers 't
  "* Disable buffers that have stars in them like *Gnu Emacs*"
  :type 'boolean
  :group 'linum)
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes-list)
              (and linum-disable-starred-buffers
                   (string-match "*" (buffer-name))))
    (linum-mode 1)))

;; No cursor blinking
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")
