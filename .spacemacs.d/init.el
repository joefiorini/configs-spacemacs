;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     html
     auto-completion
     nginx
     yaml
     markdown
     nginx
     vimscript
     elixir
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; better-defaults
     emacs-lisp
     dash
     git
     github
     ;; markdown
     (org :variables
          org-enable-github-support t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     osx
     jf-javascript
     ruby-on-rails
     (elm
      :variables
      elm-sort-imports-on-save t
      elm-format-command "elm-format-0.18"
     )
     shell-scripts
     import-js
     prettier
     scala
     (ruby :variables
           ruby-test-runner 'rspec
           ruby-enable-enh-ruby-mode t)
     haskell
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages
   '(
     import-js
     graphql-mode
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages
   '(
     exec-path-from-shell
     )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         solarized-light
                         spacemacs-dark
                         spacemacs-light
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
 
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  ;(require 'evil-surround)
  ;;(global-evil-surround-mode 1)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; map multiple states at once (courtesy of Michael Markert;
  ;; http://permalink.gmane.org/gmane.emacs.vim-emulation/1674)

  ;; (load "~/.spacemacs.d/mappings.el")

  ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode))
  ;; Customize javascript comments because who wants to /* */ everywhere? Bleh!
  ;; (setq-default web-mode-comment-formats (remove '("javascript" . "/*") web-mode-comment-formats))
  ;; (add-to-list 'web-mode-comment-formats '("javascript" . "//"))
  (setq-default web-mode-comment-formats
                '(("java"       . "/*")
                  ("javascript" . "//")
                  ("php"        . "/*")))
  (setq evil-shift-width 2)
  (setq-default indent-tabs-mode nil)
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   js2-bounce-indent t
   js2-mode-show-parse-errors nil
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2
   ;; flycheck-javascript-eslint-executable "./node_modules/.bin/eslint"
   flycheck-eslintrc ".eslintrc"
  )

  (setq-default js-indent-level 2)

  (setq ruby-insert-encoding-magic-comment nil)
  (setq import-js-project-root "/Users/joe/Code/LendingHome-monolith/consumer/")
  ;; Enabled for FiraCode font
  (mac-auto-operator-composition-mode)

  ;; (setq flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list)

  ;; auto-save all buffers when switching windows
  (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
  (add-hook 'before-save-hook 'whitespace-cleanup)
  ;; (require 'magit-gh-pulls)
  ;; (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

  (add-hook 'scss-mode-hook 'flycheck-mode)

  (defun vruby-activate ()
    "Activate a vruby instance"
    (interactive)
    (setenv "VRUBY" (concat default-directory "vruby/2.3.1"))
    (setenv "RUBY_VERSION" "2.3.1")
    (setenv "RUBY_ENGINE" "ruby")
    (setenv "RUBY_ROOT" (concat default-directory "vruby/2.3.1"))
    (setenv "GEM_HOME" (concat default-directory ".gem/" (getenv "RUBY_ENGINE") "/" (getenv "RUBY_VERSION")))
    (setenv "GEM_PATH" (getenv "GEM_HOME"))

    (add-to-list 'exec-path (concat default-directory "vruby/2.3.1/bin"))
    (add-to-list 'exec-path (concat (getenv "GEM_HOME") "/bin"))

    (setenv "PATH" (concat (getenv "GEM_HOME") "/bin" path-separator default-directory "vruby/2.3.1/bin" path-separator (getenv "PATH")))
    (setq eshell-path-env (getenv "PATH"))
  )

  (evil-leader/set-key "or" 'vruby-activate)

  ;; Help performance when loading large buffers
  (setq line-number-display-limit large-file-warning-threshold)
  (setq line-number-display-limit-width 200)

  (defun my--is-file-lage ()
    "If buffer too lage and may cause performance issue."
    (< large-file-warning-threshold (buffer-size)))

  (define-derived-mode my-large-file-mode fundamental-mode "LargeFile"
    "Fixes performance issues in Emacs for large files."
    (setq bidi-display-reordering nil)
    (jit-lock-mode nil)
    (buffer-disable-undo)
    (set (make-variable-buffer-local 'global-hl-line-mode) nil)
    (set (make-variable-buffer-local 'line-number-mode) nil)
    (set (make-variable-buffer-local 'column-number-mode) nil))

  (add-to-list 'magic-mode-alist (cons #'my--is-file-lage #'my-large-file-mode))

  ;; (add-hook 'spacemacs-post-user-config-hook
  ;;           (lambda ()
  ;;             (desktop-save-mode)
  ;;             (desktop-read)))
  (spaceline-toggle-version-control-on)

  ;; (defun jf-magit-ci-skip  ()
  ;;   (interactive)
  ;;   (magit-call-git "commit" "--allow-empty" "-m" "[ci skip]")
  ;;   )

  ;; (magit-define-popup-action
  ;;   'magit-commit-popup ?n "[ci skip]" 'jf-magit-ci-skip)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(magit-bury-buffer-function (quote magit-mode-quit-window))
 '(package-selected-packages
   (quote
    (yaml-mode ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spacemacs-theme spaceline powerline smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rainbow-delimiters pug-mode projectile-rails rake inflections popwin phpunit phpcbf php-extras php-auto-yasnippets persp-mode pcre2el pbcopy paradox spinner ox-gfm osx-trash osx-dictionary orgit org-projectile org-present org org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file noflet nginx-mode neotree move-text mmm-mode minitest markdown-toc markdown-mode magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang info+ indent-guide import-js grizzl ido-vertical-mode hydra hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md flycheck-pos-tip pos-tip flycheck-elm flycheck pkg-info epl flx-ido flx fish-mode fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight ensime sbt-mode scala-mode enh-ruby-mode emmet-mode elm-mode elisp-slime-nav dumb-jump f drupal-mode php-mode diminish diff-hl dash-at-point company-web web-completion-data company-tern s dash-functional tern company-statistics company-shell company column-enforce-mode coffee-mode clean-aindent-mode chruby bundler inf-ruby bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build solarized-theme dash)))
 '(safe-local-variable-values
   (quote
    ((import-js-projct-root . "~/Code/LendingHome-monolith")
     (flycheck-disabled-checkers ruby-rubocop)
     (flycheck-disabled-checkers quote
                                 (ruby-rubocop))))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "nil" :slant normal :weight normal :height 130 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(magit-bury-buffer-function (quote magit-mode-quit-window))
 '(package-selected-packages
   (quote
    (rjsx-mode add-node-modules-path xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help window-purpose imenu-list zenburn-theme yaml-mode web-mode web-beautify tagedit solarized-theme smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder rbenv pug-mode projectile-rails rake inflections phpunit phpcbf php-extras php-auto-yasnippets pbcopy ox-gfm osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro alert log4e gntp org-download noflet nginx-mode monokai-theme mmm-mode minitest markdown-toc markdown-mode magithub magit-gitflow magit-gh-pulls livid-mode skewer-mode simple-httpd less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang import-js grizzl htmlize helm-gitignore helm-dash helm-css-scss helm-company helm-c-yasnippet haml-mode gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md fuzzy flycheck-pos-tip pos-tip flycheck-elm flycheck fish-mode feature-mode evil-magit magit magit-popup git-commit with-editor ensime sbt-mode scala-mode enh-ruby-mode emmet-mode elm-mode drupal-mode php-mode diff-hl dash-at-point company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company coffee-mode chruby bundler inf-ruby auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(safe-local-variable-values
   (quote
    ((import-js-projct-root . "~/Code/LendingHome-monolith")
     (flycheck-disabled-checkers ruby-rubocop)
     (flycheck-disabled-checkers quote
                                 (ruby-rubocop))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
