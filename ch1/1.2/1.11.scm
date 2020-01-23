; Exercise 1.11: A function `f` is defined by the rule that
;
;         / n if n < 3,
; f(n) = {
;         \ f(n-1) + 2f(n-2) + 3f(n-3), n ≥ 3
;
; Write a procedure that computes $f$ by means of a recursive process.

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; Write a procedure that computes $f$ by means of an iterative process.

; f(0) = 0, f(1) = 1, f(2) = 2
; a    = 0, b    = 1, c    = 2
; f(3) = f(2) + 2f(1) + 3f(0)
;      = c    + 2b    + 3a
; f(4) = f(3)          + 2f(2) + 3f(1)
;      = c'            + 2b'   + 3a'
;      = (c + 2b + 3a) + 2c    + 3b
;
; c' -> c + 2b + 3a, b' -> c, a' -> b

(define (f n)
  (define (iter a b c n)
    (if (= n 0)
        a
        (iter b
              c
              (+ c (* 2 b) (* 3 a))
              (- n 1))))
  (iter 0 1 2 n))
