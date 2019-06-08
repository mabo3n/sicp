; Observe that our model of evaluation allows
; for combinations whose operators are compound expressions. 
; Use this observation to describe the behavior of the
; following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Instead of summing "a" to an expression that negates "b" if it is negative, 
; the sum operator itself is replaced by an expression that yields the minus 
; operator if b is <= 0.


