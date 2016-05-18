
(add-to-list 'load-path (concat user-emacs-directory "lisp/"))
(require 'package-utils)


(defun init ()
  (init-ui)
  (set-theme 'moe-theme 'moe-dark)
  (init-evil-mode)
  (init-editing)
  (init-navigation)
  (init-elisp)
  (init-scheme))


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
  (evil-mode 1))

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
  (bind-map my-navigation-map
    :keys ("M-p")
    :evil-keys ("SPC")
    :evil-states (normal motion visual))
  (bind-map-set-keys my-navigation-map
    "p p" 'projectile-switch-project
    "p f" 'projectile-find-file
    "p d" 'projectile-find-dir
    "p D" 'projectile-dired))

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
  (bind-map-set-keys my-scheme-map
    "c c" 'geiser-compile-current-buffer
    "c p" 'geiser-add-to-load-path
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

(init)
