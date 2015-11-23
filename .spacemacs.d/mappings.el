 (defun set-in-all-evil-states (key def &optional maps)
    (unless maps
      (setq maps (list evil-normal-state-map
                       evil-visual-state-map
                       evil-insert-state-map
                       evil-emacs-state-map
                       evil-motion-state-map)))
    (while maps
      (define-key (pop maps) key def)))


  (defun set-in-all-evil-states-but-insert (key def)
    (set-in-all-evil-states key def (list evil-normal-state-map
                                          evil-visual-state-map
                                          evil-emacs-state-map
                                          evil-motion-state-map)))


  (defun set-in-all-evil-states-but-insert-and-motion (key def)
    (set-in-all-evil-states key def (list evil-normal-state-map
                                          evil-visual-state-map
                                          evil-emacs-state-map)))

  (set-in-all-evil-states-but-insert "w" 'previous-line)
  (set-in-all-evil-states-but-insert "s" 'next-line)
  (set-in-all-evil-states-but-insert "e" 'evil-forward-char)
  (set-in-all-evil-states-but-insert "a" 'evil-backward-char)
  (set-in-all-evil-states-but-insert "D" 'evil-end-of-line)
  (set-in-all-evil-states-but-insert "Q" 'back-to-indentation)

  (set-in-all-evil-states-but-insert (kbd "C-w") 'evil-scroll-up)
  (set-in-all-evil-states-but-insert (kbd "C-s") 'evil-scroll-down)

  ;;; Words forward/backward
  (set-in-all-evil-states-but-insert "q" 'evil-backward-word-begin)
  (set-in-all-evil-states-but-insert "d" 'evil-forward-word-begin)
  ;;; WORD forward/backward
  (set-in-all-evil-states-but-insert (kbd "C-q") 'evil-forward-WORD-begin)
  (set-in-all-evil-states-but-insert (kbd "C-d") 'evil-backward-WORD-begin)

  ;;; Undo/redo
  (define-key evil-normal-state-map "z" 'undo)
  (when (fboundp 'undo-tree-undo)
    (define-key evil-normal-state-map "z" 'undo-tree-undo)
    (define-key evil-normal-state-map "Z" 'undo-tree-redo))

  ;;; Cut/copy/paste
  (set-in-all-evil-states-but-insert "x" 'evil-delete-char)
  (set-in-all-evil-states-but-insert "X" 'evil-delete-line)  ; delete to end of line; use dd to delete whole line
  (set-in-all-evil-states-but-insert "c" 'evil-yank)
  (set-in-all-evil-states-but-insert "C" 'evil-yank-line)
  (set-in-all-evil-states-but-insert "v" 'evil-paste-before)
  (set-in-all-evil-states-but-insert "V" 'evil-paste-after)

  ;;; Change
  (set-in-all-evil-states-but-insert "y" 'evil-change)
  (set-in-all-evil-states-but-insert "Y" 'evil-change-line)

  ;;; Search
  ;; f unchanged
  ;; F unchanged
  (set-in-all-evil-states-but-insert "p" 'evil-delete)
  (set-in-all-evil-states-but-insert "P" 'evil-delete-line)
  ;;; Visual mode
  (set-in-all-evil-states-but-insert "h" 'evil-visual-char)
  (set-in-all-evil-states-but-insert "H" 'evil-visual-line)
  ;(set-in-all-evil-states-but-insert "\C-h" 'mark-whole-buffer)

  (provide 'mappings)
