(defun leap (year)
  (if (equal (mod year 4) 0)
    (progn
      (if (equal (mod year 100) 0)
        (progn
          (if (equal (mod year 400) 0)
            (princ "It's a leap year!")
            (princ "Not a leap year!")))
        (princ "It's a leap year!")))
    (princ "Not a leap year!")))
