(use-package vterm
  :commands vterm
  :config
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
  ;;(setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
  (setq vterm-max-scrollback 10000)
  (defun turn-off-chrome ()
    (hl-line-mode -1)
    (display-line-numbers-mode -1))
  :hook (vterm-mode . turn-off-chrome))
;; https://blog.sumtypeofway.com/posts/emacs-config.html
(use-package vterm-toggle
  :custom
  (vterm-toggle-fullscreen-p nil "Open a vterm in another window.")
  (vterm-toggle-scope 'project)
  :bind (("C-c t" . #'vterm-toggle)
         :map vterm-mode-map
         ("C-\\" . #'popper-cycle)
         ("s-t" . #'vterm) ; Open up new tabs quickly
         ("s-v" . #'vterm-yank)
         ))

(provide 'init-vterm)
