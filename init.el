;; Packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(setq url-http-attempt-keepalives nil)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(;; vi style features
    evil

    ;; for editing markdown
    markdown-mode
    
    ;; rust-lang major mode
    rust-mode

    ;; typescript
    typescript-mode

    ;; minor mode for editing S-expression data
    paredit

    ;; key bindings for Clojure
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; interation with Clojure REPL
    cider

    ;; text completion
    company

    ;; The Superior Lisp Interaction Mode for Emacs
    slime
    slime-company

    ;; scheme
    geiser

    ;; ido
    ido-ubiquitous
    
    ;; Enhances M-x
    smex
    
    ;; project navigation
    projectile
    
    ;; rainbow parenthesis
    rainbow-delimiters

    ;; edit html like sexps
    tagedit

    ;; git integration
    ;magit

    ;; theme
    moe-theme

    ;; org-mode
    org))

;; Install package if not already installed
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Customizations
(require 'evil)
(evil-mode 1)

;; add guix profile
(add-to-list 'load-path "~/.guix-profile/share/emacs/site-lisp/")
(require 'guix-init nil t)
;; Add customization directory
(add-to-list 'load-path "~/.emacs.d/customizations")

(load "navigation.el")

;; Changes to the user interface
(load "ui.el")

;; Make editing easier
(load "editing.el")

;; Theme
(load "themes.el")

;; misc config
(load "misc.el")

;; git config
;(load "git.el")

;; For editing elisp
(load "elisp-editing.el")

;; Language specific
(load "setup-haskell.el")
(load "setup-scheme.el")
(load "setup-markdown.el")
(load "setup-javascript.el")
(load "setup-clojure.el")
(load "setup-lisp.el")
(load "setup-org.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" default)))
 '(safe-local-variable-values (quote ((eval modify-syntax-entry 43 "'") (eval modify-syntax-entry 36 "'") (eval modify-syntax-entry 126 "'") (bug-reference-bug-regexp . "<https?://\\(debbugs\\|bugs\\)\\.gnu\\.org/\\([0-9]+\\)>")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
