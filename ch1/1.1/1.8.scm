; Exercise 1.8: Newton's method for cube roots is based on the fact that if y is
; an approximation to the cube root of x, then a better approximation is given
; by the value of (x/y² + 2y) / 3. Use this formula to implement a cube-root
; procedure analogous to the square-root procedure.

(load "square.scm")
(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess next)
  (< (abs (- guess next))
     (* 1.0e-20 guess)))

(define (cbrt-iter guess x)
  (let ((next (improve guess x)))
    (if (good-enough? guess next)
        guess
        (cbrt-iter next x))))

(define (cbrt x)
  (cond ((< x 0) (- (cbrt (- x))))
        ((= x 0) 0)
        (else (cbrt-iter 1.0 x))))
