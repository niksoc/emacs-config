;;;convenience functions for competitive coding

(defun crt ()
  "compiles current file, runs it and performs diff on output and expected output file"
  (interactive)
  (let (c cb)
    (setq c (concat "g++ -std=c++11 " buffer-file-name))
    (setq cb (compile c)))
  (sleep-for 2) 
  (with-current-buffer "*compilation*"
    (goto-char 0)
    (if (search-forward "finished" nil t)
	(progn (shell-command "./a.out<input>myoutput")
	       (shell-command "diff myoutput output")
	       (display-buffer "*Shell Command Output*"))
      (display-buffer "*compilation*")
      ))
  (with-current-buffer "myoutput"
    (revert-buffer nil t nil))
  ) 

(provide 'coding)
;;; coding.el ends here
