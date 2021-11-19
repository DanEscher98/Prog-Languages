;#!/usr/bin/guile -s
;!#

; questions?: list, pair, equal, null, symbol, char, string, string=
; number, complex, real, rational, integer, exact, inexact, odd, even, positive, negative, zero

(define hello
	(lambda (name)
	(string-append "Hello " name "!")
	)
)

(define pi
	(* 4 (atan 1.0)))

; degree -> radian
(define (radian deg)
  (* deg (/ pi 180.0)))

; free fall time
(define (ff-time vy)
  (/ (* 2.0 vy) 9.8))

; horizontal distance
(define (dx vx t)
  (* vx t))

; distance
(define (distance v ang)
  (dx
   (* v (cos (radian ang)))                     ; vx
   (ff-time (* v (sin (radian ang))))))         ; t


(define (abs n)
	(if (> 0 n) (* -1 n) (n)))

;Integer to ASCII
(define (Int2Ascii n)
	(if (and (> n 32) (< n 127))
		(integer->char n) (display "error")))

;MAXVAL 174073
(define (factorial n)
	(if (<= n 1)
		1
		(* n (factorial (- n 1)))))


(define (fac-def a)
	(define (loop n p)
		(if (= n 1)
			p
			(let ((m (- n 1)))
				(proc m (* m p)))))
	(loop a a))

(define (fac-let n)
	(let loop((n1 n) (p n))           ; 1
    	(if (= n1 1)
			p
			(let ((m (- n1 1)))
	  			(loop m (* p m))))))

(define (fact-do n)
	(do
		[(n1 n (- n1 1)) (p n (* p (- n1 1)))]
		((= n1 1) p)
		;No body was needed
		))

(define (listx2 ls)
	(if (null? ls)
		'()
		(cons (* 2 (car ls)) (listx2 (cdr ls)))))


(begin
	(display "\nHello world owo!")
	(newline)
	(do [(i 0 (+ i 1))] ((= i 5) i)
		(display i)
		(newline))
	(display (hello "Daniel\n")))
