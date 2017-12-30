foo(X, Y, [X,Y|_]).
foo(X, Y, [Z|_]) :- is_list(Z), foo(X, Y, Z).
foo(X, Y, [_|Zs]) :- foo(X, Y, Zs).
