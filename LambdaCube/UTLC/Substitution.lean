import LambdaCube.UTLC.Term

namespace LambdaCube.UTLC

open Term

def substitute(body : Term) (x : String) (v : Term) : Term :=
  match body with
  | var y =>
      if y = x then v else var y
  | app t1 t2 =>
      app (substitute t1 x v) (substitute t2 x v)
  | lam y t =>
      if y = x then
        lam y t
      else
        lam y (substitute t x v)

end LambdaCube.UTLC
