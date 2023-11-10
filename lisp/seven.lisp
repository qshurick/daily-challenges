(defun seven(numbers)
    (dolist (item numbers)
        (if (= item 7)
            (return-from seven "Boom!")))
    "There's no 7")

(print (seven (list 1 2 3 4 5 6 7)))
(print (seven (list 8 6 22 100)))
(print (seven (list 2 55 60 97 86)))
