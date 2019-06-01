(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-auto-save t)
 '(TeX-electric-math nil)
 '(TeX-parse-self t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(font-latex-fontify-sectioning 1.0)
 '(font-latex-match-biblatex-keywords (quote (("citep" "[[{") ("citet" "[[{"))))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(inhibit-startup-screen t)
 '(ispell-program-name "/usr/local/bin/ispell")
 '(large-file-warning-threshold nil)
 '(org-babel-load-languages (quote ((C . t))))
 '(package-selected-packages
   (quote
    (julia-repl ein yasnippet websocket skewer-mode s request pdf-tools olivetti multiple-cursors magit helm deferred cl-generic auto-complete auctex)))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Andale Mono"))))
 '(font-latex-sectioning-0-face ((t (:inherit font-latex-sectioning-1-face :weight bold))))
 '(font-latex-sectioning-1-face ((t (:inherit font-latex-sectioning-2-face :weight bold))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face :weight bold))))
 '(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face :weight bold))))
 '(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-5-face :weight bold))))
 '(font-latex-sectioning-5-face ((t (:foreground "tomato2" :weight bold))))
 '(font-latex-slide-title-face ((t (:inherit font-lock-type-face :weight bold)))))

;; indent orgmode heading
(setq org-startup-indented t)
; (setq org-hide-leading-stars t)

;;activate RefTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)
(setq reftex-default-bibliography '("~/Library/texmf/bibtex/bib/references.bib"))

;;activate matlab mode with .m files:
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
 (setq matlab-shell-command "matlab")

;;add MELPA to package list
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives
	       '("gnu" . "http://elpa.gnu.org/packages")))
(package-initialize)

;;for multiple cursor mode
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;;magit shortcut
(global-set-key (kbd "C-x g") 'magit-status)

;; activate power line
(add-to-list 'load-path
	     "~/.emacs.d/lisp/emacs-powerline")
(require 'powerline)

;; activate ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; Convenient key bindings to move fast
(global-set-key (kbd "M-n") '(lambda() (interactive) (next-line 5)))
(global-set-key (kbd "M-p") '(lambda() (interactive) (next-line -5)))

;; Default line wrapping
(global-visual-line-mode 1)

;; display line number
;(global-linum-mode 1)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'TeX-mode-hook 'linum-mode)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(require 'cl)

(setq ispell-dictionary "english")

;; allow to use tex in emacs gui
(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))
(setq exec-path (append exec-path '("/usr/texbin")))

;; set capture location for org
;(setq org-directory "/Volumes/Data/Home")
;(setq org-default-notes-file (concat org-directory "/notes.org"))
;(define-key global-map "\C-cc" 'org-capture)

;; Set to the name of the file where new notes will be stored
;(setq org-mobile-inbox-for-pull (concat org-directory "/flagged.org"))
;; Set to <your Dropbox root directory>/MobileOrg.
;(setq org-mobile-directory "/Users/nicolas/Dropbox/Applications/MobileOrg")

;; set multi-state workflow for org
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "DELEGATED")))

;; open references.bib very quickly
(defun refbibf ()
  "open references.bib in a new frame"
  (interactive)
  (find-file-other-frame "~/Library/texmf/bibtex/bib/references.bib"))

(defun refbib ()
  "open references.bib in the current window"
  (interactive)
  (find-file "~/Library/texmf/bibtex/bib/references.bib"))

(defun import-missing-ref ()
  "import missing references from the TeX output buffer into the current bib file"
  (interactive)
  ()
    )

;; keybindings for the latex mode only:
(add-hook 'LaTeX-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-c r") 'refbibf)))
(add-hook 'LaTeX-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-c b") 'refbib)))
;; automatically update pdf view after latex compilation
(add-hook 'TeX-after-compilation-finished-functions 'TeX-revert-document-buffer)

(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;;double frame width and split
(defun dblframe () (interactive) (set-frame-width (selected-frame) (truncate (* 1.9 (frame-width)))) (split-window-horizontally))
;;(defun smallframe () (interactive) (set-frame-width (selected-frame) (truncate (/ (frame-width) 1.8))) (delete-other-windows))
(defun scale-frame-and-font-up ()
  "increase font size and frame size together"
  (interactive)
  (set-frame-width (selected-frame) (round (* 1.5 (frame-width))))
  (text-scale-increase 1)
  )
(defun scale-frame-and-font-down ()
  "decrease font size and frame size together"
  (interactive)
  (set-frame-width (selected-frame) (round (* 0.67 (frame-width))))
  (text-scale-decrease 1)
  )
(global-set-key (kbd "C-+") 'scale-frame-and-font-up)
(global-set-key (kbd "C--") 'scale-frame-and-font-down)

;; toggle fullscreen mode with a shortcut
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

;; use paren/braces matching
(electric-pair-mode 1)

;; add local lisp directory containing random useful lisp files.
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; julia stuff
(add-to-list 'load-path "~/.emacs.d/lisp/julia-emacs")
(require 'julia-mode)
(require 'julia-repl)
(add-hook 'julia-mode-hook 'julia-repl-mode)

;;(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers

;;start server:
(require 'server)
(unless (server-running-p)
    (server-start))

;;allow to use a few executables (needed to build pdf-tools)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/lib/pkgconfig")) 

;; activate pdf-tools
(pdf-tools-install)

;; activate yasnippets
(require 'yasnippet)
(yas-reload-all)
(add-hook 'LaTeX-mode-hook #'yas-minor-mode)

;; activate ein
(require 'ein)
(require 'ein-notebook)
(require 'ein-subpackages)


;; allow to use julia and jupyter in emacs gui
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:~/anaconda3/bin"))
(setq exec-path (append exec-path '("/usr/local/bin"  "~/anaconda3/bin")))

;; focus on new frames
(when (featurep 'ns)
  (defun ns-raise-emacs ()
    "Raise Emacs."
    (ns-do-applescript "tell application \"Emacs\" to activate"))

  (defun ns-raise-emacs-with-frame (frame)
    "Raise Emacs and select the provided frame."
    (with-selected-frame frame
      (when (display-graphic-p)
        (ns-raise-emacs))))

  (add-hook 'after-make-frame-functions 'ns-raise-emacs-with-frame)

  (when (display-graphic-p)
    (ns-raise-emacs)))
