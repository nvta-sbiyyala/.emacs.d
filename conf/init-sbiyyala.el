(find-file "~/git/sbiyyala-docs/todo.org")
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'dracula t)

(define-key global-map [f8] 'shell)                        ; F8

(global-auto-revert-mode t)

(global-set-key "\M-g" 'goto-line)

(global-set-key "\C-x/" 'point-to-register)

(global-set-key "\C-xj" 'jump-to-register)

(global-set-key "\C-xx" 'copy-to-register)

(global-set-key "\C-xg" 'insert-register)

					;disable backup
(setq backup-inhibited t)
					;disable auto save
(setq auto-save-default nil)

(setq confirm-kill-emacs 'yes-or-no-p)          ; Confirm quit

;; Define a keybinding for renaming the buffer
(global-set-key "\C-xr" 'rename-buffer)

;; Define a keybinding for clearing buffer
(global-set-key "\C-xe" 'erase-buffer)

(put 'erase-buffer 'disabled nil)

;; Make emacs window title show path of current file
(setq-default frame-title-format
              '(:eval
                (format "Happy Hacking! %s"
                        (buffer-name)
                        (cond
                         (buffer-file-truename
                          (concat "(" buffer-file-truename ")"))
                         (dired-directory
                          (concat "{" dired-directory "}"))
                         (t
                          "[no file]")))))

(setq js-indent-level 2)

   ;; (defun autopair-insert-opening ()
   ;;   (interactive)
   ;;   (when (autopair-pair-p)
   ;;     (setq autopair-action (list 'opening (autopair-find-pair) (point))))
   ;;   (autopair-fallback))

;; (autopair-global-mode) ;; enable autopair in all buffers

(add-hook 'web-mode-hook
      (lambda ()
        ;; short circuit js mode and just do everything in jsx-mode
        (if (equal web-mode-content-type "javascript")
            (web-mode-set-content-type "jsx")
          (message "now set to: %s" web-mode-content-type))))
;; alarm
(setq alert-default-style 'libnotify)

;; https://stackoverflow.com/questions/4006005/how-can-i-set-emacs-tab-settings-by-file-type
(setq css-indent-offset 2)
;; follow this : https://github.com/prathamesh-sonpatki/dotemacs/blob/master/hooks/web.el

;; mongo
;;(add-to-list 'load-path "~/.emacs.d/vendor/inf-mongo")
;;(require 'inf-mongo)

;; markdown mode
(add-to-list 'load-path "/Users/shishir.biyyala/.emacs.d/vendor/markdown-mode")

;; Remember last session
(desktop-save-mode 1)

(put 'upcase-region 'disabled nil)

;; PYTHON CONFIGURATION
;; --------------------------------------
;; Running jupyter playbook in emacs
;; In a shell, run jupyter-notebook
;; ein:notebooklist-open to open a notebook

(elpy-enable)
(setq python-shell-interpreter "python"
      python-shell-interpreter-args "-i")
(setq python-shell-completion-native-enable nil)
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;; hack to overcome the no-show title
(dolist (x '((ns-transparent-titlebar . unbound)
             (ns-appearance . unbound)))
  (add-to-list 'frameset-filter-alist x))
(setenv "PAGER" "cat")

;; ;; kubectl
;; (add-to-list 'load-path "~/git/kubectl")
;; (require 'kubectl)

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "yellow")
        ("CANCELED" . (:foreground "blue" :weight bold))))

(set-fontset-font t 'symbol "Apple Color Emoji")
(set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)
(set-fontset-font t 'symbol "Segoe UI Emoji" nil 'append)
(set-fontset-font t 'symbol "Symbola" nil 'append)
;; Save what you enter into minibuffer prompts
(setq history-length 25)
(savehist-mode 1)
(recentf-mode 1)

;; https://sites.google.com/site/steveyegge2/effective-emacs
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(provide 'init-sbiyyala)
