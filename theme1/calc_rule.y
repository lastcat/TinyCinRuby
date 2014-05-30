# $Id$
#
# Tiny C Compiler.

class TinyCC
##ここはまだいじってない###
  prechigh
    left '*'
    left '+'
  preclow
###########################
rule
  program: expr {puts val[0]}
  expr: mult_expr {result = val[0]}
  		| mult_expr "+" expr {result = val[0] + val[2]}
  mult_expr: NUMBER {result = val[0]}
           | NUMBER "*" mult_expr {result = val[0] * val[2]}
end

