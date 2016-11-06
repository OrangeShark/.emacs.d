
(install-package-if-needed 'bind-map)
(require 'org)
(bind-map evil-org-map
  :keys ("M-o")
  :evil-keys ("SPC o")
  :evil-states (normal motion visual))
(bind-map-set-keys evil-org-map
  "a" 'org-agenda
  "l" 'org-store-link)
(setq org-log-done t)
(setq org-agenda-files '("~/org"))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (dot . t)
   (scheme . t)))
