; Exercise 1.7: The `good-enough?` test used in computing square roots will not
; be very effective for finding the square roots of very small numbers. Also, in
; real computers, arithmetic operations are almost always performed with limited
; precision. This makes our test inadequate for very large numbers. Explain
; these statements, with examples showing how the test fails for small and large
; numbers.

; A: For very small numbers, `good-enough?` won't properly succeed (false
; positives) since the test uses a fixed tolerance that will accomodate a wide
; range of numbers below a certain threshold. `good-enough?` depends on
; `improve` which uses the `square` procedure to improve upon the given guess,
; which, for larger numbers, produces too big a result that can't be typically
; represented like other floating point numbers. As such, precision is lost and
; the test therefore becomes inadequate.  Moreover, for numbers that are too
; large, it can result in cyclic behavior since the improvement won't properly
; converge.

; An alternative strategy for implementing `good-enough?` is to watch how guess
; changes from one iteration to the next and to stop when the change is a very
; small fraction of the guess. Design a square-root procedure that uses this
; kind of end test. Does this work better for small and large numbers?

(define (good-enough? guess next)
  (< (abs (- guess next))
     (* 1.0e-20 next)))

(define (sqrt-iter guess x)
  (let ((next (improve guess x)))
    (if (good-enough? guess next)
        guess
        (sqrt-iter guess next))))
