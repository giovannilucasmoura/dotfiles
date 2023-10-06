(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; line numbers in programming mode

(load-theme 'modus-vivendi)

;; Options
(setq inhibit-splash-screen t) ;; Disable splash screen
(setq org-startup-indented 1) ;; Enable headline indent on org mode
(setq display-line-numbers-type 'relative) ;; Relative line number
(global-hl-line-mode t) ;; Highlight current line.
(menu-bar-mode -1) ;; Disable menu bar
