(require 'org)
(require 'ob-clojure)

;; https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-clojure.html, clojure config
;; commenting out on 10/09/22, to unblock redundancy across machines
;; (add-to-list 'load-path "/Users/shishir.biyyala/elisp/org-mode/lisp")

(setq org-babel-clojure-backend 'cider)
(require 'cider)

(provide 'init-clojure)
