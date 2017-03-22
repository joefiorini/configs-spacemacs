(defconst jf-javascript-packages
  '(
    add-node-modules-path
    company-flow
    flycheck
    rjsx-mode
    ))

(defun jf-javascript/init-rjsx-mode ()
  (use-package rjsx-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

      (setq
       js2-mode-show-strict-warnings nil
       js2-mode-show-parse-errors nil
       js-indent-level 2
       js2-basic-offset 2
       js2-strict-trailing-comma-warning nil
       js2-strict-missing-semi-warning nil))

    :config
    (modify-syntax-entry ?_ "w" js2-mode-syntax-table)))

(defun jf-javascript/init-add-node-modules-path ()
  (use-package add-node-modules-path
    :defer t
    :init
    (with-eval-after-load 'rjsx-mode
      (add-hook 'rjsx-mode-hook #'add-node-modules-path))))

(defun jf-javascript/post-init-company-flow ()
  (spacemacs|add-company-backends
    :backends
    '((company-flow :with company-dabbrev-code)
      company-files)))

(defun jf-javascript/post-init-flycheck ()
  (with-eval-after-load 'flycheck
    (push 'javascript-jshint flycheck-disabled-checkers)
    (push 'json-jsonlint flycheck-disabled-checkers))

  (spacemacs/add-flycheck-hook 'rjsx-mode))
