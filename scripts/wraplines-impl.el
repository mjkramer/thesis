(require 'latex)

(setq TeX-auto-local "auto_wraplines")
(setq fill-column 80)

(let* ((basedir (file-name-directory
                 (directory-file-name (file-name-directory load-file-name))))
       (files (file-expand-wildcards (concat basedir "chapters/*.tex"))))
  (dolist (file files)
    (print (format "Formatting %s" file) #'external-debugging-output)
    (find-file file)
    (LaTeX-fill-buffer nil)
    (save-buffer))
  (delete-directory (concat basedir "chapters/" TeX-auto-local)
                    t))
