#lang racket

(define up (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) )
(define denominator (* 3 (- 6 2) (- 2 7)))
(/ up denominator)