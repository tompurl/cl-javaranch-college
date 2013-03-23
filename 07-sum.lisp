; http://www.javaranch.com/sum.jsp

(defun double-sum () 
  (let ((num 0.0))
    (loop for i from 1 to 1000 do (incf num 0.1))
    (princ num)))
