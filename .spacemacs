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
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     clojure
     elm
     emacs-lisp
     git
     markdown
     html
     ;; org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages
   '(smartparens)
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
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(bookmarks projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Consolas"
                               :size 20
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "C-SPC"
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
   dotspacemacs-enable-paste-micro-state nil
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
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
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
  (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
  (add-to-list 'package-pinned-packages '(clj-refactor . "melpa-stable") t)
  (add-to-list 'package-pinned-packages '(cljr-helm . "melpa-stable") t)
  (add-to-list 'package-pinned-packages '(ac-cider . "melpa-stable") t)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (global-linum-mode)
  (let ((comint-hooks '(eshell-mode-hook
                        shell-mode-hook
                        term-mode-hook
                        erc-mode-hook
                        messages-buffer-mode-hook
                        inferior-emacs-lisp-mode-hook
                        inferior-python-mode-hook)))
    (spacemacs/add-to-hooks (defun bb/no-hl-line-mode ()
                              (setq-local global-hl-line-mode nil))
                            comint-hooks)
    (spacemacs/add-to-hooks (defun bb/no-scroll-margin ()
                              (setq-local scroll-margin 0))
                            comint-hooks))
  (setq default-shell 'shell)
  (helm-mode +1)
  (cua-mode 1)
  (setq magit-git-executable "git")
  (define-key helm-map (kbd "<tab>") 'helm-select-action)

  (global-unset-key (kbd "C-k"))
  (global-unset-key (kbd "C-r"))
  (global-unset-key (kbd "C-z"))

  (global-set-key (kbd "C-z") 'undo)
  (global-set-key (kbd "C-S-z") 'redo)
  (global-set-key (kbd "C-s") 'save-buffer)
  (global-set-key (kbd "C-S-s") 'write-file)
  (global-set-key (kbd "C-s") 'save-buffer)
  (global-set-key (kbd "C-S-s") 'write-file)
  (global-set-key (kbd "C-w") 'kill-this-buffer)
  (global-set-key (kbd "C-a") 'mark-whole-buffer)
  (global-set-key (kbd "C-o") 'helm-find-files)
  (global-set-key (kbd "C-<tab>") 'other-window)
  (global-set-key (kbd "C-p") 'helm-M-x)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-<f4>") 'kill-emacs)

  (global-set-key (kbd "C-b") 'helm-mini)

  (global-set-key (kbd "C-d") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-S-d") 'mc/skip-to-next-like-this)
  (global-set-key (kbd "M-d") 'mc/edit-lines)

  ;; isearch stuff
  (global-set-key (kbd "C-f") 'isearch-forward)
  (global-set-key (kbd "C-S-f") 'isearch-backward)
  (add-hook 'isearch-mode-hook
            (lambda ()
              (define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
              (define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)
              (define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)))

  (require 'clojure-mode)
  (define-key clojure-mode-map (kbd "C-e e") 'cider-eval-last-sexp)
  (define-key clojure-mode-map (kbd "C-e f") 'cider-eval-defun-at-point)
  (define-key clojure-mode-map (kbd "C-e b") 'cider-eval-buffer)
  (define-key clojure-mode-map (kbd "C-e r") 'cider-eval-last-sexp-and-replace)

  (define-key clojure-mode-map (kbd "C-r r") 'cljr-rename-symbol)
  (define-key clojure-mode-map (kbd "C-r R") 'cljr-rename-file)

  (define-key clojure-mode-map (kbd "<f6>") 'cider-refresh)

  (eval-after-load 'paredit
    '(progn
       (define-key paredit-mode-map (kbd "<C-right>") 'paredit-forward)
       (define-key paredit-mode-map (kbd "<C-left>") 'paredit-backward)
       (define-key paredit-mode-map (kbd "<C-down>") 'paredit-forward-down)
       (define-key paredit-mode-map (kbd "<C-up>") 'paredit-backward-up)
       (define-key paredit-mode-map (kbd "<M-right>") 'paredit-forward-slurp-sexp)
       (define-key paredit-mode-map (kbd "<M-left>")  'paredit-forward-barf-sexp)))

  (defun my/frame-create (&optional title)
    "Create a new frame returning its internal id,
   optionally setting TITLE as title"
    (interactive "sNew frame name: ")
    (progn
      (setq my/frame-id (make-frame-command))
      (set-frame-name title))
    my/frame-id)

  (defun prepare-cider-web-project ()
    (interactive)
    (projectile-dired)
    (cider-jack-in)
    (let ((frame-id (my/frame-create)))
      (select-frame-set-input-focus frame-id)
      (split-window-below)
      (shell "lein-less")
      (comint-send-string (get-buffer-process (current-buffer)) "lein less auto\n")
      (other-window 1)
      (shell "lein-figwheel")
      (comint-send-string (get-buffer-process (current-buffer)) "lein figwheel\n")
      ))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
