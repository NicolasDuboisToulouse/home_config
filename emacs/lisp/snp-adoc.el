; Auto load ascidoc mode for adoc-files
(autoload 'adoc-mode "adoc-mode" "adoc-mode" t)
(add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode))
(add-hook 'adoc-mode-hook (lambda() (buffer-face-mode t)))

; \C-c\C-g call asciidoc_2_pdf
(eval-after-load 'adoc-mode
  '(define-key adoc-mode-map "\C-c\C-g" 'asciidoc_2_pdf))

; Generate PDF for current buffer
(defun asciidoc_2_pdf ()
  (interactive)

  (when (buffer-modified-p) (save-buffer))

  (defvar pdf_buffer "*pdf*")
  (defvar adoc_file buffer-file-name)
  (defvar pdf_file (concat (file-name-sans-extension adoc_file) ".pdf"))

  (with-output-to-temp-buffer pdf_buffer
    (pop-to-buffer pdf_buffer)
    (princ (concat "Generating PDF for file " adoc_file "...\n"))
    (if (equal 0 (call-process "c:/local/Ruby23-x64/bin/asciidoctor-pdf" nil pdf_buffer 1 "-b" "pdf" adoc_file))
        (progn
          (princ "PDF generation done.\n")
          (w32-shell-execute "open" pdf_file)
          )
        (princ "PDF generation fail !\n")
        )
    (princ "\nhit q to close.\n")
    )
)

