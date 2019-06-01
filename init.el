(require 'bind-key)
(require 'cl)
(require 'package)
(require 'yasnippet)
(require 'multiple-cursors)

;; activate powerline
(add-to-list 'load-path (concat user-emacs-directory "lisp/emacs-powerline"))
(require 'powerline)


;;Activate julia mode
(add-to-list 'load-path (concat user-emacs-directory "lisp/julia-emacs"))
(require 'julia-mode)
(require 'julia-repl)

;;Active ein
(require 'ein)
(require 'ein-notebook)
(require 'ein-subpackages)

;; Load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))
