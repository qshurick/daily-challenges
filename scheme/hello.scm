(define convert_to_fahrenheit
    (lambda (value)
        (+ 32 (* value (/ 9. 5)))))

(define convert_to_celsius
    (lambda (value)
        (* (/ 5. 9) (- value 32))))

(define format
    (lambda (function value suffix)
        (string-append
            (number->string (round (function value)))
            suffix
            "\n"
        )))

(define formatted_convert_to_fahrenheit
    (lambda (value)
        (format convert_to_fahrenheit value " F")))

(define formatted_convert_to_celsius
    (lambda (value)
        (format convert_to_celsius value " F")))

(define convert
    (lambda (value #!optional label)
        (cond
            ((eqv? label 'C) (formatted_convert_to_fahrenheit value))
            ((eqv? label 'F) (formatted_convert_to_celsius value))
            (else "Error\n")
        )
    )
)

(begin
    (newline)
    (display (convert 35 'C))
    (display (convert 19 'F))
    (display (convert 33))
    (newline)
    (exit)
)
