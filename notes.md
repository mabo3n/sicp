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

### Iteration x recursion

> In general, an iterative process is one whose state can be summarized by a fixed number of *state variables*, together with a fixed rule that describes how the state variables should be updated as the process moves from state to state and an (optional) end test that specifies conditions under which the process should terminate. In computing n!, the number of steps required grows linearly with *n*. Such a process is called a *linear iterative process*.

> In contrasting iteration and recursion, we must be careful not to
confuse the notion of a recursive *process* with the notion of a recursive
*procedure*. When we describe a procedure as recursive, we are referring
to the syntactic fact that the procedure definition refers (either directly
or indirectly) to the procedure itself. But when we describe a process
as following a pattern that is, say, linearly recursive, we are speaking
about how the process evolves, not about the syntax of how a procedure
is written. It may seem disturbing that we refer to a recursive procedure
such as *fact-iter* as generating an iterative process.

Iterative *procedure*: do not calls itself;
Recursive *procedure*: directly or indirectly calls itself (syntactic wise);
Iterative *process*: its state can be summarized by a fixed number of variables + a rule for changing the state (and optionally + and "end" test condition);
Recursive *process*: Opposite of above. It keeps track of "hidden" chained information to be computed later on.

### Tree Recursion 

> In general, the number of steps required by a tree-recursive process will be proportional to the number of nodes in the tree, while the space required will
be proportional to the maximum depth of the tree.

