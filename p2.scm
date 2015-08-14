(define (make-triprecord rgno sttime endtime)
(list rgno sttime endtime)
)
(define (get-regno bus)
(car bus))
(define (get-starttime bus)
(cadr bus))
(define (get-endtime bus)
(caddr bus))
(define (make-time hh mm)
(list hh mm))
(define (get-hh time)
(car time))
(define (get-mm time)
(cadr time))
(define (get-firstbus routelog)
(car routelog))
(define (get-restbus routelog)
(cdr routelog))

(define (calculate-time sttime endtime)
(- (+ (* (get-hh endtime) 60) (get-mm endtime)) (+ (* (get-hh sttime) 60) (get-mm sttime)))) 

(define (time-list routelog)
     (if(null? routelog)
        '()
      (cons (list (get-regno (get-firstbus routelog)) (calculate-time (get-starttime (get-firstbus routelog)) (get-endtime (get-firstbus routelog)))) (time-list (get-restbus routelog)))))

(define (make-timelog regno totaltime)
(list regno totaltime))
(define (get-totaltime timelog)
(cadr timelog))

(define (fastest-bus routelog min)
(cond ((null? routelog) min)
      ((< (get-totaltime (get-firstbus routelog)) (get-totaltime min)) (fastest-bus (get-restbus routelog) (get-firstbus routelog)))
      (else (fastest-bus (get-restbus routelog) min)))
)

(define (main routelog)
(  if(null? routelog) 
    '()
      (get-regno (fastest-bus (time-list routelog) (get-firstbus (time-list routelog))))))
