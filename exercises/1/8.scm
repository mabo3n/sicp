; Exercise 1.8: Newton’s method for cube roots is based on
; the fact that if y is an approximation to the cube root of x,
; then a beer approximation is given by the value

; (x/y**2) + 2*y ) / 3

; Use this formula to implement a cube-root procedure analogous 
; to the square-root procedure. (In Section 1.3.4 we will
; see how to implement Newton’s method in general as an
; abstraction of these square-root and cube-root procedures.)

(define (improve guess x)
  (/ (+ (* 2 guess)
        (/ x (square guess)))
     3))

(define (good-enough? guess improved-guess)
  (< (abs (- guess improved-guess))
     (* guess 0.001)))

(define (cbrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))