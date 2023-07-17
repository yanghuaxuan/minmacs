(setq package-enable-at-startup nil)
(setq straight-use-package-by-default t)

; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
 (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
(bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
  (url-retrieve-synchronously
   "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
   'silent 'inhibit-cookies)
(goto-char (point-max))
(eval-print-last-sexp)))
(load bootstrap-file nil 'nomessage))

; Native Emacs org has an older version of org, which causes problems for packages installed with straight which rely on Org. We need to install an upstream version of Org before using Org-babel
(straight-use-package '(org :type git :repo "https://code.orgmode.org/bzg/org-mode.git" :local-repo "org" :depth full :pre-build (straight-recipes-org-elpa--build) :build (:not autoloads) :files (:defaults "lisp/.el" ("etc/styles/" "etc/styles/"))))


(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))
(setq straight-use-package-by-default t)
