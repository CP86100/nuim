(define foo
  (lambda (x xs)
    (cond ((null? xs) xs)
          ((null? (cdr xs)) '())
          ((list? (car xs)) (append (foo x (car xs)) (foo x (cdr xs))))
          ((eq? x (car xs)) (cons (car (cdr xs)) (foo x (cdr xs))))
          (else (foo x (cdr xs))))))
