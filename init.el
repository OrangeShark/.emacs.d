(add-to-list 'load-path (concat user-emacs-directory "lisp/"))
(require 'package-utils)


(defun init ()
  (init-ui)
  (set-theme 'moe-theme 'moe-dark)
  (init-evil-mode)
  (init-editing)
  (init-navigation)
  (init-org)
  (init-elisp)
  (init-scheme)
  (init-git))


(defun init-ui ()
  (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  (require 'linum-off)
  (global-linum-mode t)
  (setq-default frame-title-format "%b (%f)"))

(defun set-theme (theme style)
  (install-package-if-needed theme)
  (require theme)
  (funcall style))

(defun init-evil-mode ()
  (install-package-if-needed 'evil)
  (require 'evil)
  (evil-mode 1)
  (require 'bind-map)
  (bind-map evil-map
    :evil-keys ("SPC")
    :evil-states (normal motion visual))
  (bind-map-set-keys evil-map
    ":" 'execute-extended-command))

(defun init-editing ()
  (show-paren-mode 1)     ;; Highlights matching parenthesis
  (global-hl-line-mode 1) ;; Highlight current line
  (setq-default indent-tabs-mode nil)
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory
						"backups"))))
  (setq auto-save-default nil))

(defun init-navigation ()
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
    "D" 'projectile-dired))

(defun init-elisp ()
  (install-package-if-needed 'bind-map)
  (install-package-if-needed 'paredit)
  (install-package-if-needed 'evil-paredit)
  (install-package-if-needed 'rainbow-delimiters)
  (require 'bind-map)
  (bind-map my-elisp-map
    :keys ("M-m")
    :evil-keys ("SPC m")
    :evil-states (normal motion visual)
    :major-modes (emacs-lisp-mode lisp-interaction-mode))
  (bind-map-set-keys my-elisp-map
    "c c" 'emacs-lisp-byte-compile
    ;; Eval
    "e b" 'eval-buffer
    "e d" 'eval-defun
    "e r" 'eval-region
    "e e" 'eval-last-sexp)
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))

(defun init-scheme ()
  (install-package-if-needed 'bind-map)
  (require 'bind-map)
  (bind-map my-scheme-map
    :keys ("M-m")
    :evil-keys ("SPC m")
    :evil-states (normal motion visual)
    :major-modes (scheme-mode))
  (install-package-if-needed 'geiser)
  (install-package-if-needed 'paredit)
  (install-package-if-needed 'evil-paredit)
  (install-package-if-needed 'rainbow-delimiters)
  (add-hook 'scheme-mode-hook #'paredit-mode)
  (add-hook 'scheme-mode-hook 'evil-paredit-mode)
  (add-hook 'scheme-mode-hook #'rainbow-delimiters-mode)
  (setq geiser-default-implementation 'guile)
  (bind-map-set-keys my-scheme-map
    "c c" 'geiser-compile-current-buffer
    "c p" 'geiser-add-to-load-path
    ;; start geiser
    "r g" 'run-guile
    ;; Eval
    "e b" 'geiser-eval-buffer
    "e d" 'geiser-eval-definition
    "e r" 'geiser-eval-region
    "e e" 'geiser-eval-last-sexp
    ;; Documentation
    "h h" 'geiser-doc-symbol-at-point
    "h d" 'geiser-doc-look-up-manual
    "h m" 'geiser-doc-module
    ;; Navigation
    "g g" 'geiser-edit-symbol-at-point
    "g b" 'geiser-pop-symbol-stack
    "g m" 'geiser-edit-module))


(defun init-org ()
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
     (scheme . t))))

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
 '(safe-local-variable-values
   (quote
    ((eval modify-syntax-entry 43 "'")
     (eval modify-syntax-entry 36 "'")
     (eval modify-syntax-entry 126 "'")
     (bug-reference-bug-regexp . "<https?://\\(debbugs\\|bugs\\)\\.gnu\\.org/\\([0-9]+\\)>")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
