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
 '(custom-enabled-themes '(tango-dark))
 '(font-latex-fontify-sectioning 1.0)
 '(font-latex-match-biblatex-keywords '(("citep" "[[{") ("citet" "[[{")))
 '(frame-background-mode 'dark)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(inhibit-startup-screen t)
 '(ispell-program-name "/usr/local/bin/ispell")
 '(large-file-warning-threshold nil)
 '(org-babel-load-languages '((C . t)))
 '(package-selected-packages
   '(terminal-here xterm-color ein yasnippet websocket skewer-mode s request pdf-tools olivetti multiple-cursors magit helm deferred cl-generic auto-complete auctex))
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
