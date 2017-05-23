
(install-package-if-needed 'evil)
(require 'evil)
(evil-mode 1)
(require 'bind-map)
(bind-map evil-map
  :evil-keys ("SPC")
  :evil-states (normal motion visual))
(bind-map-set-keys evil-map
  ":" 'execute-extended-command
  "SPC" 'execute-extended-command)

(show-paren-mode 1)     ;; Highlights matching parenthesis

(global-hl-line-mode 1) ;; Highlight current line

(setq-default indent-tabs-mode nil)
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(install-package-if-needed 'projectile)
(install-package-if-needed 'bind-map)
(projectile-global-mode)
(require 'bind-map)
(bind-map evil-navigation-map
  :keys ("M-p")
  :evil-keys ("SPC p")
  :evil-states (normal motion visual))
(bind-map-set-keys evil-navigation-map
  "p" 'projectile-switch-project
  "f" 'projectile-find-file
  "d" 'projectile-find-dir
  "D" 'projectile-dired)

(bind-map evil-help-map
  :evil-keys ("SPC h")
  :evil-states (normal motion visual))
(bind-map-set-keys evil-help-map
  "d k" 'describe-key
  "d f" 'describe-function
  "d v" 'describe-variable
  "d d" 'apropos-documentation
  "d m" 'describe-mode
  "i i" 'info
  "i a" 'info-apropos)

(bind-map evil-window-map
  :evil-keys ("SPC w")
  :evil-states (normal motion visual))
(bind-map-set-keys evil-window-map
  "v" 'split-window-right
  "s" 'split-window-below
  "h" 'evil-window-left
  "j" 'evil-window-down
  "k" 'evil-window-up
  "l" 'evil-window-right
  "F" 'make-frame
  "o" 'other-frame
  "w" 'other-window
  "W" 'other-frame
  "1" 'delete-other-windows
  "0" 'delete-window
  "d" 'delete-window
  "D" 'delete-other-windows
  "c" 'delete-frame
  "C" 'delete-other-frames)

(bind-map evil-buffer-map
  :evil-keys ("SPC b")
  :evil-states (normal motion visual))
(bind-map-set-keys evil-buffer-map
  "b" 'switch-to-buffer
  "d" 'kill-buffer)

(bind-map evil-global-file-map
  :evil-keys ("SPC f")
  :evil-states (normal motion visual))
(bind-map-set-keys evil-global-file-map
  "f" 'find-file
  "s" 'save-buffer
  "r" 'revert-buffer)

(require 'ido)
(ido-mode t)
