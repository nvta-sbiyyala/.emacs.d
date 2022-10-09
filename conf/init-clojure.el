(require 'org)
(require 'ob-clojure)

;; https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-clojure.html, clojure config
(add-to-list 'load-path "/Users/shishir.biyyala/elisp/org-mode/lisp")

(setq org-babel-clojure-backend 'cider)
(require 'cider)

(provide 'init-clojure)
