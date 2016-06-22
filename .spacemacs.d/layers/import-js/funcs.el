(defun import-js//import-js-detect ()
  "Detect importjs binary and warn if not found"
  (let ((found (executable-find "importjs")))
    (unless found
      (spacemacs-buffer/warning "importjs binary not found! install it with npm install -g import-js"))
    found))
