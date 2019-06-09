; Exercise 1.7: The good-enough? test used in computing
; square roots will not be very effective for finding the square
; roots of very small numbers. Also, in real computers, 
; arithmetic operations are almost always performed with 
; limited precision. This makes our test inadequate for very large
; numbers. Explain these statements, with examples showing
; how the test fails for small and large numbers. 
; An alternative strategy for implementing good-enough? is to watch
; how guess changes from one iteration to the next and to
; stop when the change is a very small fraction of the guess.
; Design a square-root procedure that uses this kind of end
; test. Does this work better for small and large numbers?

; The "good-enough?" test will not be suitable for very small 
; numbers because it has a fixed 0.001 error threshold which 
; may be too big, leading to the stop of the improve iterations
; before it gets a good guess.

(sqrt-iter 0.4 0.006)
; yields:    0.07775159822906665
; True sqrt: 0.07745966692414833

; In the example above, one can say we're still doing fine.
; But look what happens when the number we're trying to compute
; the square root of gets smaller:

(sqrt-iter 0.4 0.002)
; yields:    0.04725277521689847
; True sqrt: 0.04472135954999579

(sqrt-iter 0.4 0.001)
; yields:    0.03706660274500850
; True sqrt: 0.03162277660168379

(sqrt-iter 0.4 0.0006)
; yields:    0.03250778802751915
; True sqrt: 0.02449489742783178

; Near the error threshold and below the imprecision gets higher 
; and higher. Depending on the guess, the imprecision can get
; even higher, although they are not positively correlated.

(sqrt-iter 0.4 0.002)
; yields:    0.04725277521689847
; True sqrt: 0.04472135954999579

(sqrt-iter 20 0.002)
; yields:    0.04564858071775735
; True sqrt: 0.04472135954999579

(sqrt-iter 300 0.002)
; yields:    0.05323938256509979
; True sqrt: 0.04472135954999579

(sqrt-iter 8000 0.002)
; yields:    0.04976216806496371
; True sqrt: 0.04472135954999579

; Very large numbers may lead to overflow problems in general, 
; not just specifically on the "good-enough?" test. 
; I'm not aware of problems that may happen, besides that the 
; interpreter will get stuck trying to compute all 
; the iterations for very large numbers, like: 

(sqrt-iter 8000 80000000000000000000000)

; Here's an alternative "good-enough" that compares the guess 
; with its iumproved version to check if the change is smaller 
; than a given threshold:

(define (good-enough? guess improved-guess)
  (< (abs (- guess improved-guess))
     (* guess 0.001)))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

; It seems to be much more precise than the previous version:

(sqrt-iter 0.4 0.002)
; before:    0.04725277521689847
; after:     0.04472141087585796
; True sqrt: 0.04472135954999579

(sqrt-iter 0.4 0.001)
; before:    0.03706660274500850
; after:     0.0316252718039029
; True sqrt: 0.03162277660168379

(sqrt-iter 0.4 0.0006)
; before:    0.03250778802751915
; after:     0.02451403341260448
; True sqrt: 0.02449489742783178

; For large numbers, the advantage is that the maximum number
; we can compute the square root of is much larger in this 
; new version, since we're not squaring the guess in the 
; "good-enough?" test anymore. But the "very large number problem" 
; still persists, it just got more unlikely to face it.


; ------------- Corrections -------------
; For large numbers:
; 
; On the other hand, for very large values of the radicand, 
; the machine precision is unable to represent small differences 
; between large numbers. The algorithm might never terminate 
; because the square of the best guess will not be within 0.001 
; of the radicand and trying to improve it will keep on yielding 
; the same guess [i.e. (improve guess x) will equal guess]. 
; Try (sqrt 1000000000000) [that's with 12 zeroes], then try 
; (sqrt 10000000000000) [13 zeroes]. On my 64-bit intel machine, 
; the 12 zeroes yields an answer almost immediately whereas the 
; 13 zeroes enters an endless loop. The algorithm gets stuck 
; because (improve guess x) keeps on yielding 4472135.954999579 
; but (good-enough? guess x) keeps returning #f.

