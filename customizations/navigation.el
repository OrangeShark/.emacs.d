;; customization for navigating files

;; Make buffer names unique
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Recent file mode
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; interactively do things
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(ido-mode t)

;; Allows partial matches
(setq ido-enable-flex-matching t)

(setq ido-use-filename-at-point nil)

(setq ido-auto-merge-work-directories-length -1)

(setq ido-use-virtual-buffers t)

(ido-ubiquitous-mode 1)

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Enhances M-x
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; projectile everywhere!
(projectile-global-mode)
