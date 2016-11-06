
(install-package-if-needed 'evil)
(require 'evil)
(evil-mode 1)
(require 'bind-map)
(bind-map evil-map
  :evil-keys ("SPC")
  :evil-states (normal motion visual))
(bind-map-set-keys evil-map
  ":" 'execute-extended-command)

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
