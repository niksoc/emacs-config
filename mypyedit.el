(elpy-enable)
(when (require 'flycheck nil t)
 (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
 (add-hook 'elpy-mode-hook 'flycheck-mode))
(elpy-use-ipython)
(require 'py-autopep8) 
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)