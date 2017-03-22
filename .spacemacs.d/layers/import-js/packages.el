(setq import-js-packages
      '(
        (import-js :toggle (import-js//import-js-detect))
        ))

(defun import-js/init-import-js ()
  (defun import-js/set-import-js-keybindings (mode)
    "Set the key bindings for import-js in the given MODE."
    (spacemacs/set-leader-keys-for-major-mode mode
      "ii" 'import-js-import
      "if" 'import-js-fix
      "ig" 'import-js-goto))

  (add-hook 'rjsx-mode-hook
            '(lambda ()
                (import-js/set-import-js-keybindings 'rjsx-mode)))
  )
