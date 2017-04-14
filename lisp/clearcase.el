;------------------------------------------------------------------------------
; Fonctions clearcase
;------------------------------------------------------------------------------
(defun ct-co (filename comment)
  (interactive "fFichier: \nsCommentaire: ")
  (cleartool-command-refresh filename (list "co" "-c" comment) "checkOut"))


(defun ct-ci (filename comment)
  (interactive "fFichier: \nsCommentaire: ")
  (cleartool-command-refresh filename (list "ci" "-c" comment) "checkIn"))

(defun ct-unco (filename)
  (interactive "fFichier: ")
  (cleartool-command-refresh filename (list "unco" "-rm") "unCheckOut"))

(defun ct-diff-pre (filename)
  (interactive "fFichier: ")
  (cleartool-command-filename filename (list "diff" "-pre" "-columns" (number-to-string (- (window-width) 4))) "diff"))

(defun ct-print-current-view ()
  (interactive "")  
  (cleartool-command (list "pwv"  "-short") "view" )
  )
  

(defun cleartool-command-refresh (filename command buffer)
  (progn
    (cleartool-command-filename filename command buffer)
    (let ((filebuff (get-file-buffer (expand-file-name filename))))
      (if (not filebuff)
          (find-file filename)
        (progn
          (switch-to-buffer filebuff)
          (revert-buffer)
          )
        )
      )
    )
  )

(defun cleartool-command-filename (filename command buffer)
  (let ((filename (expand-file-name filename)))
    (cleartool-command (append command (list filename)) buffer)
    )
  )


(defun cleartool-command (command buffer)
  (progn
    (switch-to-buffer buffer)
    (erase-buffer)
    (apply 'call-process "cleartool" nil buffer 1 command)
    )
  )


(defun copy-sub-application (source dest)
  (interactive 
   (let (source dest)
     (setq source (read-from-minibuffer "Appli a copier: "
                                        nil nil nil
                                        query-replace-from-history-variable
                                        nil t))
     (setq dest (read-from-minibuffer "Nouveau nom: "
                                      nil nil nil
                                      query-replace-from-history-variable
                                      nil t))
     (list source dest)
     ))

  (query-replace-regexp (concat "^\\(.*\\)" source "\\(.*\\)$") 
                        (concat "\\1" source "\\2
\\1" dest "\\2") 
                        nil nil nil)
)
