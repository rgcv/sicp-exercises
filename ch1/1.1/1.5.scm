; Exercise 1.5: Ben Bitdiddle has invented a test to determine whether the
; interpreter he is faced with is using applicative-order evaluation or
; normal-order evaluation. He defined the following two procedures:

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; Then, he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that uses applicative-order
; evaluation? What behavior will he observe with an interpreter that uses
; normal-order evaluation? Explain your answer. (Assume that the evaluation rule
; for the special form `if` is the same whether the interpreter is using normal
; or applicative order: The predicate expression is evaluated first, and the
; result determines whether to evaluate the consequent or the alternative
; expression.)

; A: Applicative-order: endless recursion.
; A call to a procedure only expands after its arguments have all be evaluated.
; Alas, `(p)` recursively evaluates to `(p)`, leaving the evaluator stuck in a
; loop calling the procedure `p`.
(test 0 (p))
(test 0 (p))
(test 0 (p))
...
;    Normal-order: 0
; Since operands are only evaluated once their values are needed, `(p)` won't be
; evaluated until then, first expanding the call to `test`. This leaves us with
; an `if`-clause, a special form that only evaluates the expression based on the
; condition's result. Since, in this case, it is true, we have no need to
; evaluate the call to `p`, producing the value `0`.
(test 0 (p))
(if (= 0 0) 0 (p))
0
