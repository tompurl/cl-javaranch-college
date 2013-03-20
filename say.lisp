(defparameter *small-numbers*
(make-array 20 :initial-contents '("zero" "one" "two" "three" "four" "five"
                                   "six" "seven" "eight" "nine" "ten"
                                   "eleven" "twelve" "thirteen" "fourteen"
                                   "fifteen" "sixteen" "seventeen" "eighteen"
                                   "nineteen")))
(defparameter *tens* (make-hash-table))
(setf (gethash 2 *tens*) "twenty")
(setf (gethash 3 *tens*) "thirty")
(setf (gethash 4 *tens*) "forty")
(setf (gethash 5 *tens*) "fifty")
(setf (gethash 6 *tens*) "sixty")
(setf (gethash 7 *tens*) "seventy")
(setf (gethash 8 *tens*) "eighty")
(setf (gethash 9 *tens*) "ninety")

; http://stackoverflow.com/a/5675054
; Note: This only works for positive numbers
(defun number-to-numlist (number)
  (loop for c across (write-to-string number) collect (digit-char-p c)))

(defun numlist-to-string (lst)
  (when lst
    (concatenate 'string 
                 (write-to-string (car lst)) (numlist-to-string (cdr lst)))))

(defun say (number)
  (let ((numlist (number-to-numlist number)))
    (case (length numlist)
      (1 (format t "~a" (elt *small-numbers* number)))
      (2 (if (< number 20)
           (format t "~a" (elt *small-numbers* number))
           (progn
             (princ (gethash (car numlist) *tens*))
             (if (> (cadr numlist) 0)
               (format t "-~a" (elt *small-numbers* (cadr numlist)))
               (princ #\return)))))
      (3
       (format t "~a hundred" (elt *small-numbers* (car numlist)))
       (when (/= 0 (mod number 100))
         ; When the number isn't divisible by 100
         (princ " and ")
         (say (parse-integer (numlist-to-string (cdr numlist))))))
         
      (4
       (format t "~a thousand" (elt *small-numbers* (car numlist)))
       (when (/= 0 (mod number 1000))
         (princ ", ")
         (say (parse-integer (numlist-to-string (cdr numlist))))))
      ;(5
       ;(say (numlist-to-string (subseq numlist 0 2)))
      ;)
      )))
