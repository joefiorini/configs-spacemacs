 (when (configuration-layer/layer-usedp 'prettier)
  (setq prettier-target-mode "react-mode")
  (setq prettier-command "~/Code/Projects/prettier/bin/prettier.js")
  (setq prettier-args '("--single-quote" "--trailing-comma"))

  (load-file "~/.spacemacs.d/layers/prettier/prettier-js.el")
  (require 'prettier-js)

  (add-hook 'react-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'prettier-before-save))))
