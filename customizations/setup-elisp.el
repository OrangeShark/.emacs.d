
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
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
