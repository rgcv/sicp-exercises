; 1.20 The process that a procedure generates is of course dependent on the
; rules used by the interpreter.  As an example, consider the iterative gcd
; procedure using normal-order evaluation.  (The normal-order evaluation rule
; for `if` is described in 1.5.)  Using the substitution method (for normal
; order), illustrate the process generated in evaluating `(gcd 206 40)` and
; indicate the `remainder` operations that are actually performed.

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))
(if (= (remainder 206 40) 0) ; +1
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder 40 (remainder 206 40)) 0) ; +2
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 206 40)
                  (remainder 40 (remainder 206 40))) 0) ; +4
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))
(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40)))) 0) ; +7
    (remainder (remainder 206 40)
               (remainder 40 (remainder 206 40))) ; +4
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40)
                                          (remainder 40 (remainder 206 40)))))))
2

; How many `remainder` operations are actually performed in the normal-order
; evaluation of `(gcd 206 40)`?

; A: Total of 18 remainder operations.

; In the applicative-order evaluation?

(gcd 206 40)
(gcd 40 (remainder 206 40)) ; +1
(gcd 6 (remainder 40 6)) ; +1
(gcd 4 (remainder 6 4)) ; +1
(gcd 2 (remainder 4 2)) ; +1
2

; A: Total of 4 remainder operations.
