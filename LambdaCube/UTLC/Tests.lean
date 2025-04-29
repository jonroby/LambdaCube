import LambdaCube.UTLC.Substitution

namespace LambdaCube.UTLC

open Term

-- Simple substitution
-- (x)[x := y] = y
example : substitute (var "x") "x" (var "y") = var "y" := by rfl

-- No substitution if variable is different
-- (z)[x := y] = z
example : substitute (var "z") "x" (var "y") = var "z" := by rfl

-- Substitute inside application 
-- (x z)[x := y] = (y z)
example : substitute (app (var "x") (var "z")) "x" (var "y") = app (var "y") (var "z") := by rfl

-- Do not substitute inside lambda if it binds the variable
-- (λx. x z)[x := y] = (λx. x z)
example : substitute (lam "x" (app (var "x") (var "z"))) "x" (var "y") = lam "x" (app (var "x") (var "z")) := by rfl

-- Substitute inside lambda if it binds a different variable
-- (λw. x w)[x := y] = (λw. y w)
example : substitute (lam "w" (app (var "x") (var "w"))) "x" (var "y") = lam "w" (app (var "y") (var "w")) := by rfl

end LambdaCube.UTLC
