(require 'flycheck-grammarly)

(with-eval-after-load 'flycheck
  (flycheck-grammarly-setup))
(setq flycheck-grammarly-check-time 0.8)

(provide 'init-grammarly)
