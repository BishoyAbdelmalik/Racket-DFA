#lang racket
;;;Definition of dfa
(define  dfa1 '(q0
                (((q0 1) q1) ((q0 0) q2)
                     ((q1 1) q0) ((q1 0) q3)
                     ((q2 1) q3)((q2 0) q0)
                     ((q3 1) q2)((q3 0) q1))
                (q0)))

;;; q0 a final state in dfa1?
(define (final-state? s ls) (equal? s (car (list-ref ls 2))))
;(final-state? 'q0 dfa1)

;State q0 transition
(define (q0-state trans)
  (cond
    ((= trans 1 ) 'q1)
    ((= trans 0 ) 'q2)
    (else "not in the alphabet")))
;What will this expression evaluate into?
;(q0-state 0) 





;State q1 transition
 (define (q1-state trans)
  (cond
    ((= trans 1 ) 'q0)
    ((= trans 0 ) 'q3)
    (else "not in the alphabet")))
;What will this expression evaluate into?
;(q1-state 0)

;State q2 transition
(define (q2-state trans)
  (cond
    ((= trans 1 ) 'q3)
    ((= trans 0 ) 'q0)
    (else "not in the alphabet")))

;State q3 transition
 (define (q3-state trans)
  (cond
    ((= trans 1 ) 'q2)
    ((= trans 0 ) 'q1)
    (else "not in the alphabet")))

;;; next state 
(define (next-state state trans)
  (cond
    ((equal? state 'q0) (q0-state trans))
    ((equal? state 'q1) (q1-state trans))
    ((equal? state 'q2) (q2-state trans))
    ((equal? state 'q3) (q3-state trans))
    (else "error")))
;What will this expression evaluate into?
;(next-state 'q0 0)



; parsing starting with special case when the first state is also a final state
(define (parse str)
       (if (equal? str "") "it is in the language" 
               (is-in-the-language 'q0 str))) 
(define (is-in-the-language? state str)


(define (is-in-the-language state str)
   (cond
     ((and (= (string-length str) 1)
              (final-state? 
                  (next-state state (string->number str)) dfa1)) "it is in the language")
     ((and (= (string-length str) 1)
               (not (final-state? 
                        (next-state state (string->number str)) dfa1)) "it is not in the language"))
     (else 
           (is-in-the-language 
                (next-state state (string->number (substring str 0 1))) 
                             (substring str 1)))))