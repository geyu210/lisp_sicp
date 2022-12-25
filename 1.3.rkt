#lang racket
(define (square x) (* x x))
(define (choosebigest x y z) (if (> x y) (if (> x z) x z) (if (> y z) y z)))
(define (choosemiddle x y z) (if (> x y) (if (> y z) y (if (> x z) z x )) (if (> x z) x (if (> z y) y z))))
(choosebigest 4 2 1)
(choosemiddle 4 2 1)
(define (sum_square x y z) (+ (square (choosebigest x y z)) (square (choosemiddle x y z))))
(sum_square 1 2 3)