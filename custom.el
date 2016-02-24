(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(fci-rule-color "#eee8d5")
 '(lua-indent-level 4)
 '(session-use-package t nil (session))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(set-language-environment 'UTF-8)
(setenv "LC_CTYPE" "zh_CN.UTF-8")
(setenv "PATH" (concat "D:/Program Files/Git/usr/bin;" (getenv "PATH")))
(setenv "PATH" (concat "D:/;" (getenv "PATH")))


(setq kill-ring-max 1000)
(blink-cursor-mode 0)
(global-hl-line-mode t)
(setq scroll-margin 6)

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(setq user-full-name "fengjian")
(setq user-mail-address "fengjianxinghun@gmail.com")

(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key (kbd "C-c C-c") 'auto-comment-anything)

(defun comment-or-uncomment-line ()
  (comment-or-uncomment-region
   (line-beginning-position) (line-end-position)))

(defun auto-comment-anything ()
  (interactive)
  (if (or (null transient-mark-mode) mark-active)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-line)))


(defun cmd-on-region (cmd)
  (interactive "sshell-cmd:")
  (if (region-active-p)
      (progn
	(shell-command-on-region
	 (region-beginning)
	 (region-end) cmd (current-buffer) t))
    (insert (shell-command-to-string cmd))))

(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(add-hook 'python-mode-hook
	  (lambda ()
	    (eldoc-mode)
	    (linum-mode t)
	    ;; (anaconda-mode)
	    ;; (ac-anaconda-setup)
	    ))

(add-hook 'lua-mode-hook
	  (lambda ()
	    (linum-mode t)
	    (setq lua-indent-level 4)
	    ))

(set-face-attribute
 'default nil :font "DejaVu Sans Mono 11")
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Microsoft Yahei" :size 16)))

(setq python-shell-interpreter "ipython")

;;(setq tramp-default-method "plink")
(setq plantuml-jar-path "E:/plantuml.jar")
(provide 'custom)
