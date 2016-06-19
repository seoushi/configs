(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(inhibit-startup-screen t)
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/home/sean/projects/mlc/include/"))))
 '(sr-speed-bar-width-x 15)
 '(sr-speedbar-default-width 15)
 '(sr-speedbar-max-width 20)
 '(sr-speedbar-right-side t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)


(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not. Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))


(ensure-package-installed 'nyan-mode 'solarized-theme 'dash 'color-theme 'auto-complete-clang 'auto-complete 'popup 'company-c-headers 'company 'popup 'sr-speedbar 'yasnippet)

(package-initialize)


(require 'tramp)
(setq tramp-default-method "scp")
(require 'sr-speedbar)
(sr-speedbar-open)


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'cc-mode)
(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

(nyan-mode)
(load-theme 'solarized-dark)
