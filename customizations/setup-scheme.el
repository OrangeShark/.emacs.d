
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
(setq geiser-active-implementations '(guile))
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
  "g m" 'geiser-edit-module)


(defun add-scheme-pretty-symbols ()
  "words for prettify-symbols-mode"
  (setq prettify-symbols-alist
        '(("lambda" . 955))))

(add-hook 'scheme-mode-hook 'add-scheme-pretty-symbols)
