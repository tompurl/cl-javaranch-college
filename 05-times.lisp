; http://www.javaranch.com/times.jsp

(defparameter *numlist* (list 0 1 2 3 4 5 6 7 8 9))

(defun my-times () 
  (let ((ceiling 10) (floor 0))

    ;Print header
    (princ "  ")
    (do ((x floor (1+ x))) ((= x ceiling))
      (format t "~2d " x))
    (format t "~%" nil)

    ; Print times table
    (do ((x floor (1+ x))) ((= x ceiling))
      (format t "~d " x)
      (do ((y floor (1+ y))) ((= y ceiling))
        (format t "~2d " (* x y)))
      (format t "~%" nil))
    ))

