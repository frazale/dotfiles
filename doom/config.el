;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-bluloco-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq inferior-lisp-program "/usr/bin/sbcl")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(with-eval-after-load 'which-key
  (setq which-key-idle-delay 0.1))


;; custom keybinds
(map!
 :desc "end of line" :nv "C-S-l" #'evil-end-of-visual-line
 :desc "start of line" :nv "C-S-h" #'evil-first-non-blank-of-visual-line
 :desc "paragraph up" :nv "C-S-k" #'backward-paragraph
 :desc "paragraph down" :nv "C-S-j" #'forward-paragraph
 :desc "previous buffer" :nv "H" #'previous-buffer
 :desc "next buffer" :nv "L" #'next-buffer
 :desc "window left" :nv "M-h" #'evil-window-left
 :desc "window down" :nv "M-j" #'evil-window-down
 :desc "window up" :nv "M-k" #'evil-window-up
 :desc "window right" :nv "M-l" #'evil-window-right)

(with-eval-after-load 'corfu
  (use-package fzf-native
    :init
    (setq fzf-native-always-compile-module t)
    :config
    (fzf-native-load-own-build-dyn))

  (use-package fussy
    :after (fzf-native)
    :config
    (setq fussy-compare-same-score-fn 'fussy-histlen->strlen<)
    (fussy-setup-fzf)
    (fussy-eglot-setup))

  (use-package slime
    :init
    (require 'slime-company)
    (remove-hook 'lisp-mode-hook #'sly-editing-mode)

    :config
    (slime-setup '(slime-fancy
                   slime-mrepl
                   slime-asdf
                   slime-highlight-edits
                   slime-quicklisp
                   slime-coalton)))

  (advice-add 'corfu--capf-wrapper :before 'fussy-wipe-cache)
  (setq corfu-auto-delay 0.1)
  (setq corfu-auto-prefix 1)
  (add-hook 'corfu-mode-hook
            (lambda ()
              (setq-local fussy-max-candidate-limit 5000
                          fussy-default-regex-fn 'fussy-pattern-first-letter
                          fussy-prefer-prefix nil))))

(map! :mode 'lisp-mode
      :desc "describe symbol" :nv "K" #'slime-describe-symbol
      :localleader
      :desc "expand macro" :nv "m" #'slime-eval-macroexpand-inplace
      (:prefix ("s" . "slime")
       :desc "slime" :nv "s" #'slime
       :desc "slime-connect" :nv "C-s" #'slime-connect
       :desc "slime-cd" :nv "c" #'slime-cd)
      (:prefix ("e" . "eval")
       :desc "eval buffer" :nvi "b" #'slime-eval-buffer
       :desc "eval expr" :nvi "e" #'slime-eval-last-expression
       :desc "eval defun" :nvi "d" #'slime-eval-defun))
