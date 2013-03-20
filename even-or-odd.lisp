(defun even-or-odd (mynumber)
  (let ((remainder (mod mynumber 2)))
    (if (equal remainder 1) (princ "odd") (princ "even"))))
