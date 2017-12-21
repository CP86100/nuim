# Answers to Autumn 2017 papers

### Question 1
#### Scheme
Define a Scheme function foo that takes two lists and yields a list combining all the elements in the two inputs, taking 1 from the first list, 2 from the second list, 3 from the first list, 4 from the second list, etc, until both lists are exhausted.

Examples:
```scheme
(foo '(a b c d e f g) '(aa bb cc dd ee ff gg))
; => (a aa bb b c d cc dd ee ff e f g gg)

(foo '(a b c d e f g) '())
; => (a b c d e f g)

(foo '() '(aa bb cc dd ee ff gg))
; => (aa bb cc dd ee ff gg)
```

Working Answer:
```scheme
(define nheads
  (lambda (n xs)
    (cond ((null? xs) xs)
          ((= n 1) (list (car xs)))
          (else (append (list (car xs)) (nheads (- n 1) (cdr xs)))))))

(define ntails
  (lambda (n xs)
    (cond ((null? xs) xs)
          ((= n 1) (cdr xs))
          (else (ntails (- n 1) (cdr xs))))))

(define fooMerge
  (lambda (n xs ys)
    (cond ((null? xs) ys)
          ((null? ys) xs)
          (else (append (nheads n xs) (nheads (+ n 1) ys) (fooMerge (+ n 2) (ntails n xs) (ntails (+ n 1) ys)))))))

(define foo
  (lambda (xs ys)
    (cond ((null? xs) ys)
          ((null? ys) xs)
          (else (append (nheads 1 xs) (nheads 2 ys) (fooMerge 3 (ntails 1 xs) (ntails 2 ys)))))))
```
*comment:*
There might be a shorter way of doing it, but this is the best working solution that I could come up with.

### Question 2
#### Haskell
Define a Haskell function foo, including type signature, that takes two lists and yields a list combining all the elements in the two inputs, taking 1 from the first list, 2 from the second list, 3 from the first list, 4 from the second list, etc, until both lists are exhausted.

Examples:
```Haskell
foo [1,2,3,4,5,6,7,8] [11,12,13,14,15,16,17,18]
-- > [1,11,12,2,3,4,13,14,15,16,5,6,7,8,17,18]
```

Working Answer:
```Haskell
nheads :: Int -> [a] -> [a]
nheads n [] = []
nheads n (x:xs) = if n == 1 then x:[] else x:nheads (n - 1) xs

ntails :: Int -> [a] -> [a]
ntails n [] = []
ntails n (x:xs) = if n == 1 then xs else ntails (n - 1) xs

foo :: [a] -> [a] -> [a]
foo [] ys = ys
foo xs [] = xs
foo xs ys = nheads 1 xs ++ nheads 2 ys ++ fooMerge 3 (ntails 1 xs) (ntails 2 ys)

fooMerge :: Int -> [a] -> [a] -> [a]
fooMerge n xs [] = []
fooMerge n [] ys = ys
fooMerge n xs ys = nheads n xs ++ nheads (n + 1) ys ++ fooMerge (n + 2) (ntails n xs) (ntails (n + 1) ys)
```

*comment:*
As you can see this question the exact same as Question 1 but in Haskell, you might found that the Haskell and Scheme codes are very similar.

### Question 3
#### Prolog

Define a Prolog predicate thrice/2 which is true when its first argument appears three times in its second argument, which must be a list.

Example:
```Prolog
?- thrice(e, [t,h,e,b,e,a,t,b,e]).
% => yes / true
?- thrice(e, [t,h,e,b,e,a,t,b]).
% => no / false
```

Working Answer:
```Prolog
thrice(X, List) :- count(X, List, N), N == , !.

count(_, [], 0).
count(X, [X | T], N) :- !, count(X, T, N1), N is N1 + 1.
count(X, [_ | T], N) :- count(X, T, N).
```
*comment:*
In case you didn't know thrice/2 the '/2' means the predicate (function) takes in 2 parameters.

### Question 4
#### Lambda Calculus
In the simply typed lambda calculus, why does the formal parameter of a lambda expression require a type (in the formal syntax) but the body does not?

**Answer:**
 ???

 ### Question 5

Give an example of a legal reasonable Scheme program which cannot be easily translated into Haskell because the types won't work.

**Answer:**
???
