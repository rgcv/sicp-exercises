; Exercise 1.4: Observe that our model of evaluation allows for combinations
; whose operators are compound expressions. Use this observation to describe the
; behavior of the following procedure

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; A: If `b` is positive, a sum is performed between `a` and `b`. Otherwise, `b`
; is subtracted from `a`. This is an example of an operator that is the result
; of a compound expression (an `if`-clause) instead of just being applied
; literally to the following arguments.
