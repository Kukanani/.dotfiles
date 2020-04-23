;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

(global-visual-line-mode t)
(setq org-support-shift-select t)
(setq org-todo-keywords 
  '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "ARCHIVED")))

;; Setting Colours (faces) for todo states to give clearer view of work 
(setq org-todo-keyword-faces
  '(("TODO" . "red")
   ("DOING" . "blue")
   ("BLOCKED" . "orange")
   ("REVIEW" . "orange")
   ("DONE" . "green")
   ("ARCHIVED" . "purple")))
