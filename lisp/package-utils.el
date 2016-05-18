(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(setq url-http-attempt-keepalives nil)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun install-package-if-needed (package)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'package-utils)
