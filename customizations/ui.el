
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(require 'linum-off)
(global-linum-mode t)
(setq-default frame-title-format "%b (%f)")

;; Theme
(install-package-if-needed 'moe-theme)
(require 'moe-theme)
(moe-dark)
