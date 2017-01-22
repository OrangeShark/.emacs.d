
(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "lisp/"))
(add-to-list 'load-path (concat user-emacs-directory "customizations/"))
(require 'package-utils)


(defun init ()
  (init-git))

(load "ui.el")
(load "editing.el")

(load "setup-elisp.el")

(load "setup-scheme.el")

(load "setup-org.el")

(defun init-git ()
  (bind-map evil-git-map
    :keys ("M-g")
    :evil-keys ("SPC g")
    :evil-states (normal motion visual))
  (bind-map-set-keys evil-git-map
    "s" 'magit-status))

(init)

(require 'server)
(unless (server-running-p)
  (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (weechat solarized-theme rainbow-delimiters projectile moe-theme magit geiser evil-paredit bind-map)))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (put
            (quote with-directory)
            (quote scheme-indent-function)
            1)
           (put
            (quote with-repository)
            (quote scheme-indent-function)
            1))
     (eval modify-syntax-entry 43 "'")
     (eval modify-syntax-entry 36 "'")
     (eval modify-syntax-entry 126 "'")
     (bug-reference-bug-regexp . "<https?://\\(debbugs\\|bugs\\)\\.gnu\\.org/\\([0-9]+\\)>")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
