; Exercise 1.13: Prove that Fib(n) is the closest integer to φⁿ/√5, where φ = (1
; + √5)/2. Hint: Let ψ = (1 - √5)/2. Use induction and the definition of the
; Fibonacci numbers to prove that
;
; Fib(n) = (φⁿ - ψⁿ)/√5.

; A: Let P(n) be the statement Fib(n) = (φⁿ - ψⁿ)/√5.
;
; Hypothesis: ∀n ∈ ℕ₀ : P(n)
;
; Base cases: Fib(0), Fib(1)
;
; Fib(0) = (φ⁰ - ψ⁰)/√5
;        = 0/√5
;        = 0 ■
; Fib(1) = (φ - ψ)/√5
;        = (1 + √5 - 1 + √5)/2√5
;        = (2√5)/(2√5)
;        = 1 ■
;
; Inductive step: ∀k ∈ ℕ₀, P(k) ⇒ P(k + 1)
;
; Fib(k)     = (φ^k - ψ^k)/√5
; Fib(k + 1) = Fib(k) + Fib(k - 1)
;            = (φ^k - ψ^k)/√5 + (φ^(k - 1) - ψ^(k - 1))/√5
;            = ((φ + 1)∙φ^(k - 1) - (ψ + 1)∙ψ^(k - 1))/√5
;
; Given φ² = φ + 1, and ψ² = ψ + 1, we have:
; Fib(k + 1) = (φ²φ^(k - 1) - ψ²ψ^(k - 1))/√5
;            = (φ^(k+1) - ψ^(k+1))/√5 ■
;
; ∴ ∀n ∈ ℕ₀ : P(n)

; To prove φⁿ/√5 is the closest to Fib(n), we must prove that
; lim(n→∞) |Fib(n) - φⁿ/√5| = 0.
; From P(n), we have

; lim(n→∞) |(φⁿ - ψⁿ)/√5 - φⁿ/√5| = 0
; lim(n→∞) |ψⁿ/√5| = 0
; (1/√5) * lim(n→∞) |ψⁿ| = 0
; (1/√5) * lim(n→∞) |((1 - √5)/2)ⁿ| = 0

; We can verify that ((1 - √5)/2)ⁿ is convergent. We then have

; (1/√5) * lim(n→∞) |((1 - √5)/2)ⁿ|
; (1/√5) * 0
; 0
