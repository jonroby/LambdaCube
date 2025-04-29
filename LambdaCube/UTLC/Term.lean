namespace LambdaCube.UTLC

inductive Term
| var : String → Term
| lam : String → Term → Term
| app : Term → Term → Term

end LambdaCube.UTLC
