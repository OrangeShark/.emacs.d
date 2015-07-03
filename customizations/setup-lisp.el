

(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; Slime set up
(setq inferior-lisp-program "sbcl")

(slime-setup '(slime-company))

(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
