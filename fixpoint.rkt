#lang racket
 (define (print2 line)
   (let ()
     (newline))
   (display line))
(define (close-enough? x y) (< (abs (- x y)) 0.001))
(define average (lambda (x y) (/ (+ x y) 2)))
(average -1 5)
(define (search f neg-point pos-point)
   (let ((midpoint (average neg-point pos-point)))
     (if (close-enough? neg-point pos-point)
         midpoint
         (let ((test-value (f midpoint)))
           (cond ((positive? test-value)
                  (search f neg-point midpoint))
                 ((negative? test-value)
                  (search f midpoint pos-point))
                 (else midpoint))))))
(search (lambda (midpoint)  (- midpoint 0  ) ) -10 1 )
(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else (error "Values are not of opposite sign" a b))
           )))
(half-interval-method (lambda (midpoint)  (- midpoint 0  ) ) -1 1)
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0)
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (print2 guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point cos 1.0)
(fixed-point (lambda (y) (+ (sin y) (cos y))) 12.0)
(fixed-point (lambda (y) (/ (+ (/ 2 y) y) 2)) 0.1)
(define (sqrt x)
  (fixed-point (lambda (y) (average (/ x y) y)) 0.1 ))
(sqrt 2)
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 0.1)


(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)

(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(deriv (lambda (x) (* x x)))
((lambda (x) ((deriv (lambda (x) (* x x))) x)) 5)