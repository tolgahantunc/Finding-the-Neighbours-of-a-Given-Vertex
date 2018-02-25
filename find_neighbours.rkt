#lang racket

(define find-neighbours (lambda (input-graph vertex-id neighbours)
       (cond 
         ((null? (cdr input-graph)) neighbours)
          (else
           (cond ((equal? (caar input-graph) vertex-id) 
                  (find-neighbours (cdr input-graph) vertex-id (append neighbours (list (cadar input-graph)))))
           (else 
               (if (equal? (cadar input-graph) vertex-id)
                  (find-neighbours (cdr input-graph) vertex-id (append neighbours (list (caar input-graph))))
                  (find-neighbours (cdr input-graph) vertex-id neighbours))))))))

(define (search hyperedge x except-this-vertex)
  (cond
    ((null? hyperedge) '())
    (#t (cond
          ((equal? x (car hyperedge)) (append except-this-vertex (cdr hyperedge)))
          (#t (search (cdr hyperedge) x (append except-this-vertex (list (car hyperedge)))))))))

;(search '(v3 v4 v6) 'v4 '())

(define find-neighbours-generic (lambda (input-graph vertex-id neighbours )
       (if (null? (cdr input-graph))
           neighbours                          
          (find-neighbours-generic (cdr input-graph) vertex-id 
                                           (append neighbours (search (car input-graph) vertex-id '()))))))


;(caar '((v1 v2) (v2 v3) (v2 v7) (v7 v8) (v4 v7) (v5 v4) (v6)))
;(cadar '((v1 v2) (v2 v3) (v2 v7) (v7 v8) (v4 v7) (v5 v4) (v6)))

;(find-neighbours '((v1 v2) (v2 v3) (v2 v7) (v7 v8) (v4 v7) (v5 v4) (v6)) 'v4 '())
(find-neighbours-generic '((v1 v2) (v2 v3) (v2 v7) (v3 v4 v6) (v7 v8) (v4 v7) (v5 v4) (v6)) 'v4 '())

