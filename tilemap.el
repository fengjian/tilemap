#!/usr/local/bin/emacs --script

(require 'json)
(require 'cl)

(setq image-magic-sh "./img_clip.sh")
(setq magic-argv '("northkorea_Map.png" "512x512" "nk.png"))


(defun expend-args-to-process (cmd args)
  (append `(process-lines ,cmd) args)
  )


(defun make-clip-img-info ()
  (let* ((outstr) (result))
      (setq outstr (apply  (expend-args-to-process
                            (expand-file-name image-magic-sh) magic-argv)))
      (dolist (str outstr result)
        (let ((ts))
          (setq ts (split-string str " "))
          (let ( (size) (pos) (node))
              (setq size (split-string (nth 2 ts) "x"))
              (setq pos (split-string (nth 3 ts) "x\\|+"))
              (setq size (mapcar 'string-to-number size))
              (setq pos (mapcar 'string-to-number pos))

              (setq node (list :name (file-name-nondirectory  (car ts))
                               :fmt (downcase (cadr ts))
                             :width (car size)
                             :height (cadr size)
                             :sw (car pos)
                             :sh (cadr pos)
                             :x (nth 2 pos)
                             :y (nth 3 pos)
                             :id  (string-to-number (cadr (split-string (file-name-base (car ts)) "-")))
                             ))
              (setq result (cons node result)))
          )
        )
      (message "%s" (json-encode (vconcat (sort result (lambda (x  y)
                                                         (< (plist-get x ':id) (plist-get y ':id))
                                                         )))
                                 ))
    )
  )



(make-clip-img-info)



