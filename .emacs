;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))
   
;;(require 'use-package-ensure)
;;(setq use-package-always-ensure t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; pdf view
(pdf-tools-install)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-enabled-themes (quote (deeper-blue)))
 '(org-agenda-files
   (quote
    ("/home/david/Dropbox/Notas/TODO/TODO.org" "/home/david/Dropbox/Notas/TODO/agenda.org" "/home/david/Dropbox/Notas/TODO/birthday.org" "/home/david/Dropbox/Notas/TODO/contas.org")))
 '(org-babel-load-languages
   (quote
    ((sh . t)
     (matlab . t)
     (latex . t)
     (emacs-lisp . t)
     (C . t)
     (octave . t)
     (python . t)
     (R . t)
     (js . t))))
 '(org-babel-no-eval-on-ctrl-c-ctrl-c nil)
 '(org-confirm-babel-evaluate nil)
 '(org-latex-pdf-process
   (quote
    ("pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f" "rm -rf *.tex *.prv preview.fmt")))
 '(package-selected-packages (quote (org-ref nov pdf-tools org-bullets company)))
 '(pdf-annot-list-format
   (quote
    ((page . 3)
     (type . 10)
     (label . 24)
     (date . 24)
     (contents . 56))))
 '(send-mail-function (quote sendmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-set-key "\C-ca" 'org-agenda)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(global-visual-line-mode t)
(setq org-src-fontify-natively t)
(setq org-image-actual-width nil)
(setq org-startup-with-inline-images t)
(package-initialize)

(setq org-emphasis-alist
  '(("*" (bold :foreground "RoyalBlue" ))
    ("/" italic)
    ("_" underline)
    ("=" (:background "maroon" :foreground "white"))
    ("~" (:background "deep sky blue" :foreground "MidnightBlue"))
    ("´" (:strike-through nil))
    ("!"  (bold :foreground "FireBrick"))
    ("&" (bold :background "Yellow" :foreground "black"))
    ))

(setq org-hide-emphasis-markers t)

;; UI Preferences. Tweak window chrome. I don’t usually use the menu or scroll bar, and they take up useful space.
 (tool-bar-mode 0)
 (menu-bar-mode 0)
 (scroll-bar-mode -1)

;; There’s a tiny scroll bar that appears in the minibuffer window. This disables that:
(set-window-scroll-bars (minibuffer-window) nil nil)

;; The default frame title isn’t useful. This binds it to the name of the current project:
(setq frame-title-format '((:eval (projectile-project-name))))

;;(global-hl-line-mode)

;; Always indent with spaces. Never use tabs. Tabs are the devil’s whitespace.
(setq-default indent-tabs-mode nil)

;;Wrap paragraphs automatically. AutoFillMode automatically wraps paragraphs, kinda like hitting M-q. I wrap a lot of paragraphs, so this automatically wraps ‘em when I’m writing text, Markdown, or Org.
;;(add-hook 'text-mode-hook 'auto-fill-mode)
;;(add-hook 'gfm-mode-hook 'auto-fill-mode)
;;(add-hook 'org-mode-hook 'auto-fill-mode)

(setq org-ellipsis "⤵")

;; Make TAB act as if it were issued in a buffer of the language’s major mode.
(setq org-src-tab-acts-natively t)

;; When editing a code snippet, use the current window rather than popping open a new one (which shows the same information).
(setq org-src-window-setup 'current-window)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c C-l") 'org-insert-link)

;; Disable auto fill mode
(setq auto-fill-mode -1)
(remove-hook 'org-mode-hook #'auto-fill-mode)
(add-hook 'html-mode-hook 'turn-off-auto-fill)
(add-hook 'text-mode-hook 'turn-off-auto-fill)
  (dolist
      (the_mode
       (list 'nxml-mode))
    (add-hook the_mode 'turn-off-auto-fill))


;;Pretty bullets instead of a list of asterisks.
;;(require 'org-bullets)
;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;(use-package org-bullets
  ;;:init
  ;;(add-hook 'org-mode-hook 'org-bullets-mode))

(use-package org-bullets
:ensure t
:init
;;(setq org-bullets-bullet-list
;;'("◉" "◎" "<img draggable="false" role="img" class="emoji" alt="⚫" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/26ab.svg">" "○" "►" "◇"))
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;(setcar org-emphasis-regexp-components "\t('\"{[:alpha:]")
;;(setcar (nthcdr 1 org-emphasis-regexp-components) "[:alpha:]- \t.,:!?;'\")}\\")
;;(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)


;; For EPUB files with nov-mode
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; remember cursor position, for emacs 25.1 or later
(save-place-mode 1)


;; Bookmarks plus library
(let ((bookmarkplus-dir "~/.emacs.d/custom/bookmark-plus/")
              (emacswiki-base "https://www.emacswiki.org/emacs/download/")
              (bookmark-files '("bookmark+.el" "bookmark+-mac.el" "bookmark+-bmu.el" "bookmark+-key.el" "bookmark+-lit.el" "bookmark+-1.el")))
          (require 'url)
          (add-to-list 'load-path bookmarkplus-dir)
          (make-directory bookmarkplus-dir t)
          (mapcar (lambda (arg)
                    (let ((local-file (concat bookmarkplus-dir arg)))
                      (unless (file-exists-p local-file)
                        (url-copy-file (concat emacswiki-base arg) local-file t))))
                    bookmark-files)
          (byte-recompile-directory bookmarkplus-dir 0)
          (require 'bookmark+))

;; prevent the creation of backup files:
(setq make-backup-files nil)
