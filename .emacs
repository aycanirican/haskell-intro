(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package smex
    :ensure t
    :init
    (progn
      (smex-initialize)
      (global-set-key (kbd "M-x") 'smex)
      (global-set-key (kbd "M-X") 'smex-major-mode-commands)
      (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))

(use-package auto-package-update
  :ensure t
  :bind ("C-x P" . auto-package-update-now)
  :config
  (setq auto-package-update-delete-old-versions t))


(use-package multiple-cursors
    :ensure t
    :config
      (progn
        (global-set-key (kbd "C-c C-m") 'mc/edit-lines)
        (global-set-key (kbd "C->") 'mc/mark-next-like-this)
        (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
        (global-set-key (kbd "C-c C-d") 'mc/mark-all-like-this)))

(use-package undo-tree
    :ensure t
    :config (global-undo-tree-mode))

(use-package editorconfig
    :ensure t
    :config (editorconfig-mode 1))

(use-package haskell-mode
    :ensure t
    :init
    (progn
        ;; (require 'haskell-interactive-mode)
        (require 'haskell-process)
        (require 'haskell-mode)

        ;; ghc-mod
        ;(setq company-ghc-show-info t)
        ;(require 'company)
        ;(add-hook 'haskell-mode-hook 'company-mode)
        ;(autoload 'ghc-init "ghc" nil t)
        ;(autoload 'ghc-debug "ghc" nil t)
        ;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
        ;(add-to-list 'company-backends 'company-ghc)
        ;(add-hook 'haskell-mode-hook 'hindent-mode)

        (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
        (add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)
        (define-key haskell-mode-map (kbd "M-,") 'pop-tag-mark)
        (setq
              haskell-process-auto-import-loaded-modules t
              haskell-process-log t
              ;; haskell-process-args-ghci (quote ("--run" "cabal repl"))
              ;; haskell-process-path-ghci "nix-shell"
              haskell-process-type 'ghci
              haskell-process-path-ghci "styx"
              haskell-process-args-ghci '("repl")
              ; haskell-process-path-ghci "stack"
              ; haskell-process-args-ghci '("ghci")
              ; haskell-process-args-cabal-repl '()
              haskell-process-suggest-hoogle-imports t
              haskell-process-suggest-remove-import-lines t
              haskell-stylish-on-save t
              haskell-tags-on-save t
              haskell-process-suggest-remove-import-lines t
              haskell-process-auto-import-loaded-modules t)))

  (use-package f :ensure t)
  (use-package dante
    :ensure t
    ;; :load-path "~/elisp/dante"
    :init
    (progn
      (add-hook 'haskell-mode-hook 'dante-mode)
      (add-hook 'haskell-mode-hook 'flycheck-mode)

      (add-hook 'dante-mode-hook
        '(lambda () (flycheck-add-next-checker 'haskell-dante
                  '(warning . haskell-hlint))))
      ;; (setq dante-repl-command-line '("nix-shell" "--run" "cabal repl"))
      ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(line-number-mode t)
 '(package-selected-packages
   (quote
    (auto-package-update use-package undo-tree rainbow-delimiters nix-mode multiple-cursors markdown-mode magit hindent editorconfig dante company-ghc)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(winner-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
