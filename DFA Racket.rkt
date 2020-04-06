#lang racket

(define dfa 
    '(a
        (
            ((a 0) a) ((a 1) b)
            ((b 0) c) ((b 1) a)
            ((c 0) b) ((c 1) c)
        )
    (b))
)

;;The final state is "b"

(define (is-final-state? state passed_dfa) 
    (if 
    (equal? (string->symbol state)  (car (list-ref passed_dfa 2))) #t #f)
)

;;;transitions functions
(define (a-state substring)
    (cond
        ((equal? substring "0") "a")
        ((equal? substring "1") "b")
        (else "not in the alphabet")
    )
)
(define (b-state substring)
    (cond
        ((equal? substring "0") "c")
        ((equal? substring "1") "a")
        (else "not in the alphabet")
    )
)
(define (c-state substring)
    (cond
        ((equal? substring "0") "b")
        ((equal? substring "1") "c")
        (else "not in the alphabet")
    )
)


;;; next state 
(define (next-state state str ) 
    (cond 
        ((equal? "a" state) (a-state str))
        ((equal? "b" state) (b-state str))
        ((equal? "c" state) (c-state str))
        (else "error") 
    )
)
;;; parse the string
(define (parse str) 
    (if (equal? str "") "not in the language" (is-in-the-language? "a" str))
)

(define (is-in-the-language? state str)
  (cond 
        ((and (= (string-length str) 1) (is-final-state? (next-state state str) dfa)) "it is in the language")
        ((and (= (string-length str) 1) (not (is-final-state? (next-state state str) dfa ))) "not in the language")
        (else (is-in-the-language? (next-state state (substring str 0 1)) (substring str 1)))
        ))
;;;test cases
(parse "")
(parse "0111")
(parse "01010")
(parse "01101")
(parse "011")
(parse "011010")
   
