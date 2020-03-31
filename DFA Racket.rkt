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