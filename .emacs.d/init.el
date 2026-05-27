;;; init.el --- Emacs configuration -*- lexical-binding: t -*-

(setenv "LSP_USE_PLISTS" "true")
(setq package-enable-at-startup nil)
;; Performance tweaks for modern machines
(setq gc-cons-threshold 100000000) ; 100 mb
(setq read-process-output-max (* 4 1024 1024)) ; 4mb

;; Remove extra UI clutter by hiding the scrollbar, menubar, and toolbar.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable warning popups
(setq warning-minimum-level :error)
(setq native-comp-async-report-warnings-errors 'silent)

;; Set the font. Note: height = px * 100
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 110)

;; Add unique buffer names in the minibuffer where there are many
;; identical files. This is super useful if you rely on folders for
;; organization and have lots of files with the same name,
;; e.g. foo/index.ts and bar/index.ts.
(require 'uniquify)

;; Automatically insert closing parens
(electric-pair-mode t)

;; Visualize matching parens
(show-paren-mode 1)

;; Prefer spaces to tabs
(setq-default indent-tabs-mode nil)

;; Automatically save your place in files
(save-place-mode t)

;; Save history in minibuffer to keep recent commands easily accessible
(savehist-mode t)

;; Keep track of open files
(recentf-mode t)

;; Keep files up-to-date when they change outside Emacs
(global-auto-revert-mode t)

;; Display line numbers only when in programming modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; The `setq' special form is used for setting variables. Remember
;; that you can look up these variables with "C-h v variable-name".
(setq uniquify-buffer-name-style 'forward
      window-resize-pixelwise t
      frame-resize-pixelwise t
      load-prefer-newer t
      backup-by-copying t
      ;; Backups are placed into your Emacs directory, e.g. ~/.config/emacs/backups
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      ;; I'll add an extra note here since user customizations are important.
      ;; Emacs actually offers a UI-based customization menu, "M-x customize".
      ;; You can use this menu to change variable values across Emacs. By default,
      ;; changing a variable will write to your init.el automatically, mixing
      ;; your hand-written Emacs Lisp with automatically-generated Lisp from the
      ;; customize menu. The following setting instead writes customizations to a
      ;; separate file, custom.el, to keep your init.el clean.
      text-mode-ispell-word-completion nil
      read-extended-command-predicate #'command-completion-default-include-p
      )

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setopt straight-use-package-by-default t)

(use-package which-key
  :straight nil
  :init
  (which-key-mode t)
  :custom
  (which-key-idle-delay 0.1)
  (which-key-idle-secondary-delay 0.1))

(use-package no-littering
  :demand t
  :init
  (require 'no-littering)
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name no-littering-var-directory))
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name no-littering-etc-directory))
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))

(use-package compile-angel
  :demand t
  :config
  (push "/init.el" compile-angel-excluded-files)
  (push "/early-init.el" compile-angel-excluded-files)
  (compile-angel-on-load-mode 1)
  :custom
  (compile-angel-verbose nil))

;; A quick primer on the `use-package' function (refer to
;; "C-h f use-package" for the full details).
;;
;; (use-package my-package-name
;;   :ensure t    ; Ensure my-package is installed
;;   :after foo   ; Load my-package after foo is loaded (seldom used)
;;   :init        ; Run this code before my-package is loaded
;;   :bind        ; Bind these keys to these functions
;;   :custom      ; Set these variables
;;   :config      ; Run this code after my-package is loaded

;; A package with a great selection of themes:
;; https://protesilaos.com/emacs/ef-themes
;; (use-package ef-themes)
(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic nil))

;; Set theme
(load-theme 'doom-monokai-spectrum t)

;; Powerline package
(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; Minibuffer completion is essential to your Emacs workflow and
;; Vertico is currently one of the best out there. There's a lot to
;; dive in here so I recommend checking out the documentation for more
;; details: https://elpa.gnu.org/packages/vertico.html. The short and
;; sweet of it is that you search for commands with "M-x do-thing" and
;; the minibuffer will show you a filterable list of matches.
(use-package vertico
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  :init
  (vertico-mode))

;; use fzf-native. this thing seems to crash way too often, it's annoying
(use-package fzf-native
  :straight
  (:repo "dangduc/fzf-native"
   :host github
   :files (:defaults "*.c" "*.h" "*.txt")
   :rev :newest)
  :init
  (setq fzf-native-always-compile-module t)
  :config
  (fzf-native-load-own-build-dyn))

;; use fussy. It's kind of fussy hehe get it
(use-package fussy
  :straight (:url "https://github.com/jojojames/fussy" :rev :newest)
  :config
  (setq fussy-compare-same-score-fn 'fussy-histlen->strlen<)
  (fussy-setup-fzf)
  ;;(fussy-company-setup))
  (fussy-eglot-setup))

;; Improve the accessibility of Emacs documentation by placing
;; descriptions directly in your minibuffer. Give it a try:
;; "M-x find-file".
(use-package marginalia
  :after vertico
  :init
  (marginalia-mode))

;; Adds intellisense-style code completion at point that works great
;; with LSP via Eglot. You'll likely want to configure this one to
;; match your editing preferences, there's no one-size-fits-all
;; solution.
(use-package corfu
  :after fussy
  :init
  (add-hook 'corfu-mode-hook
        (lambda ()
          (setq-local fussy-max-candidate-limit 5000
                      fussy-default-regex-fn 'fussy-pattern-first-letter
                      fussy-prefer-prefix nil)))
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)
  (corfu-popupinfo-delay '(0.5 . 0.5))
  :config
  (corfu-popupinfo-mode 1))

;; add cape, recommended to use with corfu
(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

;; add company for completion, might work better than corfu (hopefully)
;; (use-package company
;;   :init
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   :custom
;;   (company-minimum-prefix-length 1)
;;   (company-idle-delay 0)
;;   (company-inhibit-inside-symbols t)
;;   (company-tooltip-align-annotations t))

;; (use-package company-quickhelp
;;   :init
;;   (company-quickhelp-mode)
;;   :custom
;;   (company-quickhelp-delay 0.5))

  ;; Adds LSP support. Note that you must have the respective LSP
  ;; server installed on your machine to use it with Eglot. e.g.
  ;; rust-analyzer to use Eglot with `rust-mode'.
(use-package eglot
    :ensure nil
    :bind (("s-<mouse-1>" . eglot-find-implementation)
           ("C-c ." . eglot-code-action-quickfix))
    ;; Add your programming modes here to automatically start Eglot,
    ;; assuming you have the respective LSP server installed.
    :hook ((go-mode . eglot-ensure)
           (web-mode . eglot-ensure)
           (lua-ts-mode . eglot-ensure))
    :config
    ;; You can configure additional LSP servers by modifying
    ;; `eglot-server-programs'. The following tells eglot to use TypeScript
    ;; language server when working in `web-mode'.
    (add-to-list 'eglot-server-programs
                 '(web-mode . ("typescript-language-server" "--stdio"))))

(use-package mason
  :config
  (mason-setup))

;; (use-package lsp-mode
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :commands lsp
;;   :hook ((lua-ts-mode . lsp)
;;          ;; which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration)))

;; Add extra context to Emacs documentation to help make it easier to
;; search and understand. This configuration uses the keybindings
;; recommended by the package author.
(use-package helpful
  :bind (("C-h f" . #'helpful-callable)
         ("C-h v" . #'helpful-variable)
         ("C-h k" . #'helpful-key)
         ("C-c C-d" . #'helpful-at-point)
         ("C-h F" . #'helpful-function)
         ("C-h C" . #'helpful-command)))

;; Adds vim emulation. Activate `evil-mode' to swap your default Emacs
;; keybindings with the modal editor of great infamy. There's a ton of
;; keybindings that Evil needs to modify, so this configuration also
;; includes `evil-collection' to fill in the gaps.
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package flycheck
  :custom
  (flycheck-display-errors-delay 0.1)
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-inline
  :after flycheck
  :init
  (global-flycheck-inline-mode 1))

(use-package projectile
  :init
  (setq projectile-project-search-path '("~/Projects/" "~/Documents/"))
  :config
  (projectile-mode +1))

;; Add consult and keybinds
(use-package consult
  ;; Replace bindings. Lazily loaded by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command) ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer) ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame) ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab) ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)         ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer) ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store) ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop) ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g r" . consult-grep-match)
         ("M-g f" . consult-flycheck) ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)   ;; orig. goto-line
         ("M-g M-g" . consult-goto-line) ;; orig. goto-line
         ("M-g o" . consult-outline) ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find) ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history) ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history) ;; orig. isearch-edit-string
         ("M-s l" . consult-line) ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi) ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history) ;; orig. next-matching-history-element
         ("M-r" . consult-history)) ;; orig. previous-matching-history-element
  ;; The :init configuration is always executed (Not lazy)
  :init
  ;; Tweak the register preview for `consult-register-load',
  ;; `consult-register-store' and the built-in commands.  This improves the
  ;; register formatting, adds thin separator lines, register sorting and hides
  ;; the window mode line.
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.02 any)
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-source-bookmark consult-source-file-register
   consult-source-recent-file consult-source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (keymap-set consult-narrow-map (concat consult-narrow-key " ?") #'consult-narrow-help)
  )

;; An extremely feature-rich git client. Activate it with "C-c g".
(use-package magit
  :bind (("C-c g" . magit-status)))

;; As you've probably noticed, Lisp has a lot of parentheses.
;; Maintaining the syntactical correctness of these parentheses
;; can be a pain when you're first getting started with Lisp,
;; especially when you're fighting the urge to break up groups
;; of closing parens into separate lines. Luckily we have
;; Paredit, a package that maintains the structure of your
;; parentheses for you. At first, Paredit might feel a little
;; odd; you'll probably need to look at a tutorial (linked
;; below) or read the docs before you can use it effectively.
;; But once you pass that initial barrier you'll write Lisp
;; code like it's second nature.
;; http://danmidwood.com/content/2014/11/21/animated-paredit.html
;; https://stackoverflow.com/a/5243421/3606440

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode)
  (show-smartparens-global-mode))

(use-package slime
  :init
  (require 'slime-autoloads)
  (setq inferior-lisp-program "sbcl")
  (setq slime-contribs '(slime-fancy
                         slime-coalton
                         slime-references
                         slime-sbcl-exts
                         slime-sprof
                         )))

(use-package go-mode
  :bind (:map go-mode-map)
  ("C-c C-f" . 'gofmt)
  :hook (before-save . gofmt-before-save))

(use-package markdown-mode
  ;; These extra modes help clean up the Markdown editing experience.
  ;; `visual-line-mode' turns on word wrap and helps editing commands
  ;; work with paragraphs of text. `flyspell-mode' turns on an
  ;; automatic spell checker.
  :hook ((markdown-mode . visual-line-mode)
         (markdown-mode . flyspell-mode))
  :init
  (setq markdown-command "multimarkdown"))

;; TypeScript, JS, and JSX/TSX support.
(use-package web-mode
  :mode (("\\.ts\\'" . web-mode)
         ("\\.js\\'" . web-mode)
         ("\\.mjs\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode))
  :custom
  (web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (web-mode-code-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-enable-auto-quoting nil))

(use-package yaml-mode)

(defun my/add-auto-mode (&rest args)
  "Add to \"auto-mode-alist\" pairs of extensions and modes ARGS."
  (while args
    (let* ((extension (pop args))
           (mode (pop args))
           (full-extension (format "\\%s\\'" extension))
           (full-element (cons full-extension mode)))
      (add-to-list 'auto-mode-alist full-element))))

(my/add-auto-mode ".lua" 'lua-ts-mode)

(use-package bind-map
  :demand t)
(bind-map my/leader-map
  :keys ("M-m")
  :evil-keys ("SPC")
  :evil-states (normal motion visual))

(bind-map-set-keys my/leader-map
  "SPC" 'execute-extended-command
  ;; files
  "f f" 'find-file
  ;; search
  "s s" 'consult-line
  "s S" 'consult-line-multi
  "s r" 'consult-ripgrep
  ;; buffers
  "b b" 'consult-buffer
  "b l" 'evil-next-buffer
  "b h" 'evil-prev-buffer
  "b d" 'evil-delete-buffer
  ;; toggles
  "T t" 'consult-theme
  "T l" 'display-line-numbers-mode
  ;; help
  "h f" 'helpful-callable
  "h v" 'helpful-variable
  ;; smartparens
  "p s" 'sp-forward-slurp-sexp
  "p S" 'sp-backward-slurp-sexp
  "p b" 'sp-forward-barf-sexp
  "p B" 'sp-backward-barf-sexp
  "p n" 'sp-next-sexp
  "p b" 'sp-previous-sexp
  ;; windows
  "w h" 'evil-window-left
  "w j" 'evil-window-down
  "w k" 'evil-window-up
  "w l" 'evil-window-right
  "w s" 'evil-split-window-below
  "w v" 'evil-vsplit-window-right
  "w d" 'evil-window-delete
  ;; projectile -- add more later
  "d f" 'projectile-find-file
  "d s r" 'projectile-ripgrep
  "d s x" 'projectile-find-references
  "d m" 'projectile-commander
  "d a" 'projectile-find-related-file
  "d !" 'projectile-run-shell-command-in-root
  "d &" 'projectile-run-async-shell-command-in-root
  "d t" 'projectile-run-eshell
  "d p p" 'projectile-switch-project
  "d p a" 'projectile-add-known-project
  "d p r" 'projectile-run-project
  "d p c" 'projectile-configure-project
  ;; magit?
  "g g" 'magit
  )
(which-key-add-key-based-replacements
  "SPC SPC" "command"
  "SPC h" "helpful"
  "SPC f" "files"
  "SPC b" "buffer"
  "SPC T" "toggles"
  "SPC p" "smartparens"
  "SPC m" "local"
  "SPC w" "windows"
  "SPC d" "projectile"
  "SPC d s" "search"
  "SPC d p" "projects"
  "SPC g" "magit")

(evil-define-key '(normal visual) 'global
  (kbd "C-s") 'consult-line
  (kbd "K") 'helpful-at-point)

(provide 'init)
;;; init.el ends here
