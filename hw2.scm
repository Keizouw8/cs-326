; Helpers
(define (includes? x L)
	(cond
		((null? L) #f)
		((equal? x (car L)) #t)
		(else (includes? x (cdr L)))
	)
)
(define (val T) (car T))
(define (left T) (car (cdr T)))
(define (right T) (car (cdr (cdr T))))

; Question 1
(define (subst x y L) 
	(define i (car L))
	(cons (if (equal? i x) y i) (if (= 1 (length L)) () (subst x y (cdr L))))
)

; Question 2
(define (all-different? L)
	(cond
		((null? L) #t)
		((includes? (car L) (cdr L)) #f)
		(else (all-different? (cdr L)))
	)
)

; Question 3
; part a
(define (n-nodes T)
	(if (null? T)
		0
		(+ 1 (n-nodes (left T)) (n-nodes (right T)))
	)
)
; part b
(define (n-leaves T)
	(cond
		((and (null? (left T)) (null? (left T))) 1)
		((null? (left T)) (n-leaves (right T)))
		((null? (right T)) (n-leaves (left T)))
		(else (+ (n-leaves (left T)) (n-leaves (right T))))
	)
)
; part c
(define (height T)
	(if (null? T) 0 (+ 1 (max (height (left T)) (height (right T)))))
)
; part d
(define (postorder T)
	(if (null? T) () (append (postorder (left T)) (append (postorder (right T)) (list (val T)))))
)

; Question 4
(define (flatten L)
	(cond
		((not (list? L)) (list L))
		((null? L) ())
		(else (append (flatten (car L)) (flatten (cdr L))))
	)
)

; Question 5
(define (member-bst? v T)
	(cond
		((null? T) #f)
		((= v (val T)) #t)
		((< v (val T)) (member-bst? v (left T)))
		((> v (val T)) (member-bst? v (right T)))
	)
)

; Tree for use in testing
(define T '(13 (5 (1 () ()) (8 () (9 () ()))) (22 (17 () ()) (25 () ()))))

; Test 1
(display (subst 'c 'k '(c o c o n u t)))(newline)

; Test 2
(display (all-different? '(3 7 2 7)))(newline)

; Test 3
; Part a
(display (n-nodes T))(newline)
; Part b
(display (n-leaves T))(newline)
; Part c
(display (height T))(newline)
; Part d
(display (postorder T))(newline)

;Test 4
(display (flatten '(1 (2 (3 4)) 5)))(newline)

;Test 5
(display (member-bst? 17 T))(newline)