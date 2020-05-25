(require 'latex)

(setq TeX-auto-local "auto_wraplines")

(let* ((basedir (file-name-directory
                 (directory-file-name (file-name-directory load-file-name))))
       (files (file-expand-wildcards (concat basedir "chapters/*.tex"))))
  (dolist (file files)
    (message "Formatting %s" file)
    (find-file file)
    (let ((fill-column 80)
          (LaTeX-fill-break-at-separators nil))
      (LaTeX-fill-buffer nil))
    (save-buffer))
  (delete-directory (concat basedir "chapters/" TeX-auto-local)
                    t))
