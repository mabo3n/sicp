; Define a procedure that takes three numbers
; as arguments and returns the sum of the squares of the two
; larger numbers.

(define (ss-of-largers-1 a b c)
  (if (> a b) 
      (+ (* a a)
         (if (> b c) 
             (* b b) 
             (* c c)))
      (+ (* b b)
         (if (> a c) 
             (* a a) 
             (* c c)))))

(define (larger-of x y)
  (if (> x y) x y))
(define (square x) 
  (* x x))
(define (sum-of-squares x y) 
  (+ (square x) 
     (square y)))
(define (ss-of-largers-2 a b c)
  (if (> a b)
      (sum-of-squares a (larger-of b c))
      (sum-of-squares b (larger-of a c))))

