### Substitution model
    
  - Applicative order  (Evaluate the arguments and then apply) (used by the interpreter)
    
    - Apply a compound procedure to arguments by evaluating the arguments first and then executing the body of the procedure with the evaluated arguments.
        
      ```scheme
      (f 5)
      (sum-of-squares (+ a 1) (* a 2))
      (sum-of-squares (+ 5 1) (* 5 2))
      (+ (square 6) (square 10))
      (+ (* 6 6) (* 10 10))
      (+ 36 100)
      136
      ```

  - Normal order  (Fully expand and then reduce)

    - Apply a compound procedure to arguments by evaluating the body of the procedure first, carrying on the argument's expressions until their evaluation are really needed.
    
      ```scheme
      (f 5)
      (sum-of-squares (+ 5 1) (* 5 2))
      (+ (square (+ 5 1)) (square (* 5 2)) )          ;not evaluating the arguments here
      (+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))     ;leads to extra evaluation here
      (+ (* 6 6) (* 10 10))                           ;(x argument being evaluated twice)
      (+ 36 100)
      136
      ```

