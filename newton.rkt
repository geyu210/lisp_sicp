#lang racket
(define (abs x ) (if (< x 0) (- 0 x) x))
(define (goodenough? x y) (< (abs (- x y)) 0.0001))
(define (nextguess guess target) (/ (+ (/ target guess) guess) 2))
(goodenough? 1 1.000000003)
(define (square x) (* x x))
(define (sqrt guess target) (if (goodenough?
                                 (square (nextguess guess target))
                                 target
                                 )
                                (nextguess guess target)
                                (sqrt (nextguess guess target) target )
                                ))
(sqrt 0.1 2)
(define (cube guess target)
  (if (goodenough? (* guess guess guess) target)
      guess
      (cube (/ (+ (/ target (square guess)) (* 2 guess)) 3) target)))
(cube 1 8)