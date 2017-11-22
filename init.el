
;; Set customizations in another file instead of the init file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Add MELPA repository for more packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Remove menu, tool, and scroll bars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'moe-theme)
(load-theme 'moe-dark t)

;; General editing
(show-paren-mode 1) ;; hi-light matching parens
(setq-default indent-tabs-mode nil) ;; don't insert tabs
(setq auto-save-default nil
      backup-directory-alist `(("." . ,(expand-file-name "backups"
                                                         user-emacs-directory))))

(require 'ido)
(ido-mode t)

(require 'evil)
(evil-mode 1)

(projectile-mode)

(require 'org)
(setq org-board-capture-file "~/Wiki/links.org")
(setq org-agenda-files '("~/org")
      org-default-notes-file "~/org/refile.org"
      org-capture-templates
      `(("l" "capture link for org-archive" entry
         (file+headline ,org-board-capture-file "Unsorted")
         "* %?\n:PROPERTIES:\n:URL: %x\n:WGET_OPTIONS: -k\n:END:\n\n Added %U")))

(defun do-org-board-dl-hook ()
  (when (equal (buffer-name)
               (concat "CAPTURE-" (file-name-nondirectory org-board-capture-file)))
    (org-board-archive)))
(add-hook 'org-capture-before-finalize-hook #'do-org-board-dl-hook)

(bind-map org-leader-map
  :evil-keys ("SPC m")
  :major-modes (org-mode)
  :bindings
  ("t" #'org-todo
   "r" #'org-refile
   "c" #'org-ctrl-c-ctrl-c
   "bo" #'org-board-open
   "il" #'org-insert-link
   "RET" #'org-open-at-point))

(require 'bind-map)

(bind-map base-leader-map
  :evil-keys ("SPC")
  :bindings
  ("SPC" #'execute-extended-command
   ;; file commands 
   "ff" #'find-file
   "fs" #'save-buffer
   "fr" #'revert-buffer
   ;; buffer commands
   "bb" #'switch-to-buffer
   "bk" #'kill-buffer
   ;; help commands 
   "hk" #'describe-key
   "hf" #'describe-function
   "hv" #'describe-variable
   "hP" #'describe-package
   "hm" #'describe-mode
   ;; info commands
   "ii" #'info
   "ia" #'info-apropos
   ;; project commands
   "pf" #'projectile-find-file
   "pp" #'projectile-switch-project
   "pd" #'projectile-find-dir
   "pD" #'projectile-dired
   "pl" #'projectile-find-file-in-directory
   "pb" #'projectile-switch-to-buffer
   "pE" #'projectile-edit-dir-locals
   ;; org commands
   "oa" #'org-agenda
   "ol" #'org-store-link
   "oc" #'org-capture
   ;; magit commands
   "gs" #'magit-status))


;; emacs lisp configurations
(bind-map emacs-lisp-leader-map
  :evil-keys ("SPC m")
  :major-modes (emacs-lisp-mode lisp-interactive-mode)
  :bindings
  ("c c" 'emacs-lisp-byte-compile
   ;; Eval
   "e b" 'eval-buffer
   "e d" 'eval-defun
   "e r" 'eval-region
   "e e" 'eval-last-sexp))

(require 'adjust-parens)
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook #'adjust-parens-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-smartparens-mode)


;; Scheme configuration
(add-hook 'scheme-mode-hook #'adjust-parens-mode)
(add-hook 'scheme-mode-hook #'smartparens-mode)
(add-hook 'scheme-mode-hook #'smartparens-strict-mode)
(add-hook 'scheme-mode-hook #'evil-smartparens-mode)

;; Start emacs edit server only if it not running
(require 'server)
(unless (server-running-p)
  (server-start))

(require 'org-protocol)
