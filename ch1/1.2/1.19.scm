; 1.19 There is a clever algorithm for computing the Fibonacci numbers in a
; logarithmic number of steps.  Recall the transformation of the state variables
; a and b in the `fib-iter` process: a ← a + b and b ← a.  Call this
; transformation T, and observe that applying T over and over again n times,
; starting with 1 and 0, produces the pair Fib(n + 1) and Fib(n).  In other
; words, the Fibonacci numbers are produced by applying T^n, the nth power of
; the transformation T, starting with the pair (1, 0).  Now consider T to be the
; special case of p = 0 and q = 1 in a family of transformations T_pq, where
; T_pq transforms the pair (a, b) according to a ← bq + aq + ap and b ← bp +
; aq.  Show that if we apply such a transformation T_pq twice, the effect is the
; same as using a single transformation T_p'q' of the same form, and compute
; p'q' in terms of p and q.  This gives us an explicit way to square these
; transformations, and thus we can compute T^n using successive squaring, as in
; the `fast-expt` procedure.  Put this all together to complete the following
; procedure, which runs in a logarithmic number of steps:

; (define (fib n)
;   (define (iter a b p q count)
;     (cond ((= count 0) b)
;           ((even? count) (iter a
;                                b
;                                p'
;                                q'
;                                (/ count 2)))
;           (else (iter (+ (* b q) (* a q) (* a p))
;                       (+ (* b p) (* a q))
;                       p
;                       q
;                       (- count 1)))))
;   (iter 1 0 0 1 n))

; A: Let T_pq be the transformation described by the the 2x2 matrix
;
; M = | q + p  q |
;     |   q    p |
;
; such that by multiplying M by the column vector (a, b) yields the new values
; for a and b according to applying T_pq(a, b):
;
; M | a | = | q + p  q | | a | = | a(q + p) + bq | = | bq + aq + ap |
;   | b | = |   q    p | | b |   |    aq + bp    |   |    bp + aq   |.
;
; Since it is a linear transformation, multiplying the pair by M twice is
; analogous to applying T_pq twice, or rather, applying T_p'q' once
; transformation (i.e. multiplying the pair by M²).  As such, M² times (a,b) is
; of the form
;
; M² = | q' + p'  q' | = | (q + p)² + q²  q² + 2pq |
;      |   q'     p' | = |   q² + 2pq     p² + q²  |,
;
; where p' = p² + q², and q' = q² + 2pq. Replacing p' and q' with the computed
; values in the `fib` procedure, we have the following final definition:

(define (fib n)
  (define (iter a b p q count)
    (cond ((= count 0) b)
          ((even? count) (iter a
                               b
                               (+ (* q q) (* p p)) ; p'
                               (+ (* q q) (* 2 p q)) ; q'
                               (/ count 2)))
          (else (iter (+ (* b q) (* a q) (* a p))
                      (+ (* b p) (* a q))
                      p
                      q
                      (- count 1)))))
  (iter 1 0 0 1 n))
