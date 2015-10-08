

(defvar *slime-helper-file* "~/quicklisp/slime-helper.el")
(when (file-exists-p *slime-helper-file*)
  (progn
    (load (expand-file-name *slime-helper-file*))
    ;; Slime set up
    (setq inferior-lisp-program "sbcl")
    (slime-setup '(slime-company))))

(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
