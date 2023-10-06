;; Set up package.el + MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; line numbers in programming mode

(load-theme 'modus-vivendi)

;; Options
(setq inhibit-splash-screen t) ;; Disable splash screen
(setq org-startup-indented 1) ;; Enable headline indent on org mode
(setq display-line-numbers-type 'relative) ;; Relative line number
(global-hl-line-mode t) ;; Highlight current line.
(menu-bar-mode -1) ;; Disable menu bar

;; Recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)
(evil-set-undo-system 'undo-redo) ;; Enable redo

(custom-set-variables
 '(package-selected-packages '(evil)))
(custom-set-faces
 )
