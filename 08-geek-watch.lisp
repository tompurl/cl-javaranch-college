; http://www.javaranch.com/geekWatch.jsp
; I'm using a third party library, so first I set up Quicklisp:
; http://www.quicklisp.org/beta/#installation

(ql:quickload "local-time")

(defun geek-watch (choice) 
  (case choice
    (1 (format t "Number of seconds since January 1 1970: ~d" 
               (local-time:timestamp-to-unix (local-time:now))))
    (2 (format t "Number of milliseconds since January 1 1970: ~d" 
               (* 1000 (local-time:timestamp-to-unix (local-time:now)))))
    (3 (format t "Number of days since January 1 1970: ~d" 
               (round (/ (local-time:timestamp-to-unix (local-time:now)) 86400.0))))
    (4 (local-time:format-timestring t (local-time:now) :format 
                                     (list "Current date and time: " 
                                           :month "/" :day "/" :year " " :hour ":" :min ":" :sec)))
    (otherwise (format t 
                       "Invalid choice number: ~s. Please choose a number between 1 and 4." choice))))

