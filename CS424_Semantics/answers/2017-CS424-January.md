# Answers to January 2017 paper

### Question 1
#### scheme
Define a Scheme function foo which finds all atoms inside an s-expression which pass a given predicate.

Examples:
```scheme
(foo number? '(a (2 (c 3) 4))) ;=> (2 3 4)
(foo symbol? '(a (2 (c 3) 4))) ;=> (a c)
(foo symbol? 'a) ;=> (a)
(foo number? 'a) ;=> ()
```

Working answer:
```scheme
(define flatten
  (lambda (x)
    (cond ((null? x) x)
          ((pair? (car x)) (append (flatten (car x)) (flatten (cdr x))))
          (else (append (list (car x)) (flatten (cdr x)))))))

(define foo
  (lambda (f x)
    (filter f (flatten x))))
```
*comment:*
The flatten function defined above would return all the elements of a multi-dimensional list 1D list.
```scheme
(flatten '(a (2 (c 3) 4))) ;=> (a 2 c 3 4)
```
Then you just need to apply the filter function onto it.


### Question 2
#### Haskell
Define a Haskell function weaveHunks which takes an int and two lists and weaves them together in hunks of the given size.
Be sure to declare its type signature.

Examples:
```Haskell
weaveHunks 3 "abcdefghijklmno" "ABCDEFGHIJKLMNO"
-- > abcABCdefDEFghiGHIjklJKLmnoMNO
weaveHunks 2 [1..10] [11..20]
-- > [1,2,11,12,3,4,13,14,5,6,15,16,7,8,17,18,9,10,19,20]
```

Working answer:
```haskell
nheads :: Int -> [a] -> [a]
nheads n [] = []
nheads n (x:xs) = if n == 1 then x:[] else x:nheads (n - 1) xs

ntails :: Int -> [a] -> [a]
ntails n [] = []
ntails n (x:xs) = if n == 1 then xs else ntails (n - 1) xs

weaveHunks :: Int -> [a] -> [a] -> [a]
weaveHunks n xs [] = xs
weaveHunks n [] ys = ys
weaveHunks n xs ys = nheads n xs ++ nheads n ys ++ weaveHunks n (ntails n xs) (ntails n ys)
```
*comment:*
nheads fetches the first n elements in a list and ntails fetches what is after nheads in the list.
```haskell
nheads 2 [1..5] -- > [1, 2]
ntails 2 [1..5] -- > [3, 4, 5]
```

### Question 3
#### Prolog

Work in Progress
![](https://data.whicdn.com/images/287013068/original.gif)
