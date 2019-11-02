my_f(x,y) = 2x+3y

# a closure is used -> see 18337 notes (18.337J Parallel Computing)
derivative_of_my_f(x,y) = ForwardDiff.derivative(x->my_f(x,y),x)
