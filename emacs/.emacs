;; Set up package.el + MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Enable use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; Recent files
(use-package recentf
  :config
  (setq recentf-max-saved-items 25
        recentf-max-menu-items 25)
  (recentf-mode t)
  :bind ("C-x C-r" . recentf-open-files))


;; Options
(setq inhibit-splash-screen t ;; Disable splash screen
      org-startup-indented 1 ;; Enable headline indent on org mode
      display-line-numbers-type 'relative) ;; Relative line number
(global-hl-line-mode t) ;; Highlight current line.
(menu-bar-mode -1) ;; Disable menu bar
(tool-bar-mode -1) ;; Disable tool bar
(scroll-bar-mode -1) ;; Disable scroll bar

(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; line numbers in programming mode

;; Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)
(evil-set-undo-system 'undo-redo) ;; Enable redo
(load-theme 'modus-vivendi)

(custom-set-variables
 '(package-selected-packages '(evil)))
(custom-set-faces
 )
