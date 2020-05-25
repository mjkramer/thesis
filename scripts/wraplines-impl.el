(require 'latex)

(setq TeX-auto-local "auto_wraplines")

(let* ((basedir (file-name-directory
                 (directory-file-name (file-name-directory load-file-name))))
       (files (file-expand-wildcards (concat basedir "chapters/*.tex"))))
  (dolist (file files)
    (print (format "Formatting %s" file) #'external-debugging-output)
    (find-file file)
    (let ((fill-column 80)
          (LaTeX-fill-break-at-separators nil))
      (LaTeX-fill-buffer nil))
    (save-buffer)))
