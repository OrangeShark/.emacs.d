
(install-package-if-needed 'bind-map)
(require 'org)

(bind-map evil-global-org-map
  :keys ("M-o")
  :evil-keys ("SPC o")
  :evil-states (normal motion visual))
(bind-map-set-keys evil-global-org-map
  "a" 'org-agenda
  "l" 'org-store-link
  "c" 'org-capture)

(bind-map evil-org-map
  :keys ("M-m")
  :evil-keys ("SPC m")
  :evil-states (normal motion visual)
  :major-modes (org-mode))

(bind-map-set-keys evil-org-map
  "r" 'org-refile
  "t" 'org-todo)

(setq org-log-done t)
(setq org-agenda-files '("~/org"))

(setq org-default-nodes-file "~/org/refile.org")

(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))

(setq org-refile-use-outline-path t)

(setq org-capture-templates
      '(("t" "todo" entry (file "~/org/refile.org")
         "* TODO %?")))

(setq org-refile-allow-creating-parent-nodes 'confirm)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (dot . t)
   (scheme . t)))
