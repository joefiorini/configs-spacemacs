 (when (configuration-layer/layer-usedp 'prettier)
  (setq prettier-target-mode "rjsx-mode")
  (setq prettier-command "~/Code/Projects/prettier/bin/prettier.js")
  (setq prettier-args '("--single-quote" "--trailing-comma=es5"  "--print-width=80"))

  (load-file "~/.spacemacs.d/layers/prettier/prettier-js.el")
  (require 'prettier-js)

  (add-hook 'rjsx-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'prettier-before-save))))
