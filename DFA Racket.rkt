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

;;;The final state is "b"
(define (is-final-state? state) 
    (if 
    (equal? state "b") #t #f)
)

;;;transitions functions
(define (a-state substring)
    (cond
        ((equal? substring "0") "a")
        ((equal? substring "1") "b")
        (else "not on the alphabet")
    )
)
(define (b-state substring)
    (cond
        ((equal? substring "0") "c")
        ((equal? substring "1") "a")
        (else "not on the alphabet")
    )
)
(define (c-state substring)
    (cond
        ((equal? substring "0") "b")
        ((equal? substring "1") "c")
        (else "not on the alphabet")
    )
)


;;; next state 
(define (next-state s str ) 
    (cond 
        ((equal? "a" s) (a-state str))
        ((equal? "b" s) (b-state str))
        ((equal? "c" s) (c-state str))
        (else "error") 
    )
)
;;; parse the string
(define (parse str) 
    (if (equal? str "") "it is in the language" (is-in-the-language? "a" str))
)

(define (is-in-the-language? state str)
  (cond 
        ((and (= (string-length str) 1) (is-final-state? (next-state state str))) "it is in the language")
        ((and (= (string-length str) 1) (not (is-final-state? (next-state state str)))) "no in the language")
        (else (is-in-the-language? (next-state state (substring str 0 1)) (substring str 1)))
        ))
   
