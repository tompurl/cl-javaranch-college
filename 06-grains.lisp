; http://www.javaranch.com/grains.jsp
; Unlike the Java solution, you don't need to use a special data structure or
; class to evaluate such a large number.

(defun grains ()
  ; Special first line where grain does not end with an s
  (format t "square 1:  1 grain~%")
  ; The rest
  (loop for i from 1 to 63 do
        (format t "square ~d:  ~d grains~%" (+ i 1) (expt 2 i))))
