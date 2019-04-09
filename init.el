; Initial mode to text-mode
(setq initial-major-mode 'text-mode)
; Default mode for new files also text-mode
(setq default-major-mode 'text-mode)
; For text-mode line breaks?
(setq text-mode-hook '(lambda () (auto-fill-mode 1)))
; Set default marginal
(setq default-fill-column 80)

;; Some custom key mappings
;(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key [f12] 'compile)
(global-set-key "\M-\C-h" 'backward-kill-word)

;; Misc options
(setq compile-command "make")
; Hilight matching paren
(show-paren-mode t)
; Show line numbers by default or not
(global-linum-mode 1)
; Disable backup
(setq make-backup-files nil)
; Disable auto save
(setq auto-save-default nil)
; Unclutter UI (done in ~/.Xdefaults instead)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
; Don't blink cursor
(blink-cursor-mode -1)
; Enable rainbow mode by default
(setq rainbow-mode t)
; Tetris score file
(setq tetris-score-file
  "~/.emacs.d/tetris-scores")
; Enable ido-mode by default
(ido-mode 1)
(setq ido-enable-flex-matching t)

; Macros
; Scroll up/down with C-S-n/p
(fset 'sm-scroll-up-one-line
   "\C-u1\366")
(fset 'sm-scroll-down-one-line
   "\C-u1\C-v")

; LaTeX-specific
; Use pdftex instead of latex
(setq TeX-PDF-mode t)
; AUCTeX-specific
(setq TeX-auto-save t)
     (setq TeX-parse-self t)
     (setq-default TeX-master nil)
; Default viewers
(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "atril -f %o")
        ("^html?$" "." "chromium %o"))))

; Type Unicode chars with C-q XXXX
(setq read-quoted-char-radix 16)
; Don't add newlines when pressing down at the EOB
(setq next-line-add-newlines nil)
; Expand tabs to spaces
;(setq-default indent-tabs-mode nil)
; If at BOL, C-k kills whole line
(setq kill-whole-line t)
; Newline and indent
;(global-set-key "\C-m" 'newline-and-indent)
; Set scrolling to one line only
(setq scroll-step 1)
(setq scroll-conservatively 5)

; Default browser
(setq browse-url-browser-function (quote browse-url-generic))
(setq browse-url-generic-program "chromium")

;; Color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'zenburn t)
(load-theme 'wheatgrass t)

;; Packages stuff
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

; Uncomment 1 col below when sbcl is installed again.
;;; Set up the Common Lisp environment
;;(add-to-list 'load-path "/usr/share/common-lisp/source/slime/")
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
;(setq inferior-lisp-program "/usr/bin/sbcl")
;(require 'slime)
;
;; Custom keybindings for Slime
;(slime-setup)
;     (define-key slime-repl-mode-map (kbd "M-RET")
;                 'slime-complete-symbol)

;; Text and the such
;; Use colors to highlight commands, etc.
(global-font-lock-mode t)
;; Disable the welcome message
(setq inhibit-startup-message t)
;; Format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")

;; Display time
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; Always end a file with a newline
(setq require-final-newline t)
;; Stop emacs from arbitrarily adding lines to the end of a file when the
;; cursor is moved past the end of it:
(setq next-line-add-newlines nil)
;; Flash instead of that annoying bell
(setq visible-bell nil)
;; Use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)

; Evil mode (start with M-x evil-mode)
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; Emulate Vim's "inoremap jk <esc>" with evil
(define-key evil-insert-state-map "j" #'cofi/maybe-exit)

(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
			   nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?k))
	(delete-char -1)
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
					      (list evt))))))))
;;; Make ESC quit pretty much everything
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

; Enable surround.el
(add-to-list 'load-path "~/.emacs.d/evil-surround")
(require 'evil-surround)
(global-evil-surround-mode 1)

; Some custom mappings for Evil
(define-key evil-normal-state-map ",a" 'org-agenda)
; Easier access to M-x
(define-key evil-normal-state-map ",x" 'execute-extended-command)
;(define-key evil-normal-state-map (kbd "<f12>") 'org-export-as-html)

; Make C-n/p act more Vim-like
(define-key evil-normal-state-map "\C-n" 'evil-next-buffer)
(define-key evil-normal-state-map "\C-p" 'evil-prev-buffer)

; See more easily if we're suddenly in Emacs mode
(setq evil-emacs-state-cursor '("blue" box))

