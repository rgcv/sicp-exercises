; Exercise 1.3: Define a procedure that takes three numbers as arguments and
; returns the sum of the squares of the two larger numbers.

(load "square.scm")
(define (sum-of-two-larger x y z)
  (if (> x y)
      (+ (square x) (square (if (> y z) y z)))
      (+ (square y) (square (if (> x z) x z)))))

