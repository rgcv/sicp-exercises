; 1.18 Using the results of 1.16 and 1.17, devise a procedure that generates an
; iterative process for multiplying two integers in terms of adding, doubling
; and halving and uses a logarithmic number of steps.

(define (mult a b)
  (define (aux a b c)
    (cond ((or (zero? a) (zero? b)) c)
          ((even? b) (aux (double a) (halve b) c))
          (else (aux a (- b 1) (+ c a)))))
  ((if (xor (negative? a) (negative? b)) - +)
   (aux (abs a) (abs b) 0)))
