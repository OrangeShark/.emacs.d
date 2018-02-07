
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

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c b") #'org-iswitchb)


(require 'adjust-parens)
(add-hook 'emacs-lisp-mode-hook #'adjust-parens-mode)


;; Scheme configuration
(add-hook 'scheme-mode-hook #'adjust-parens-mode)


;; Start emacs edit server only if it not running
(require 'server)
(unless (server-running-p)
  (server-start))

(require 'org-protocol)
