(define (validity_checker lst1)
       (cond ((null? lst1) 1)
              ((> (car (cadar lst1)) 31) 0)
 	      ((> (cadr (cadar lst1)) 12) 0)	
              (else (validity_checker (cdr lst1))
)
)
)
(define comparator
	(lambda (ls max)
		(cond ((null? ls) (car max))
			  ((< (caddr (cadar ls)) (caddr (cadr max))) (comparator (cdr ls) (car ls)))
			  ((< (cadr (cadar ls)) (cadr (cadr max))) (comparator (cdr ls) (car ls)))
			  ((< (car (cadar ls)) (car (cadr max))) (comparator (cdr ls) (car ls)))
			  (else (comparator (cdr ls) max))))) 
(define eldest
 (lambda (lst1)
(cond ((null? lst1) (display "invalid input"))
	  ((= (validity_checker lst1) 0) (display "check input"))
	  (else (comparator lst1 (car lst1)))
)
)
)
