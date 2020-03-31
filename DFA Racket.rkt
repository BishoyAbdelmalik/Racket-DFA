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
