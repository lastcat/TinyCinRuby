
#
# Tiny C Compiler.

class TinyCC
  prechigh
    left '*' '/' '%'
    left '+' '-'
	left '<' '>' '<=' '>='
	left '==' '!='
	left '&'
	left '|'
	left '&&'
	left '||'

	left ')' '}'
	right '(' '{'
  preclow
rule
	program:external_declaration
	       |program external_declaration
	
	external_declaration:declaration
						|function_definition
	
	declaration:RESERVED declarator_list ';'

	declarator_list:declarator
				   |declarator_list ',' declarator

	declarator:IDENTIFIER

	function_definition:RESERVED declarator '(' parameter_type_list ')' compound_statement

	parameter_type_list:parameter_declaration
	                   |parameter_type_list ',' parameter_declaraion
					   | /* none */

	parameter_declaration:RESERVED declarator

	statement:';'
	         |expression ';'
			 |compound_statement
			 |'if' '(' expression ')' statement
			 |'if' '('expression ')' statement 'else' statement
			 |'while' '(' expression')' statement
			 |'return' expression';'
	
	compound_statement:'{'declaration_list statement_list'}'

	declaration_list:declaration
	 				|declaration_list declaration
					| /* none*/

	statement_list:statement
				  |statement_list statement
				  |/*none*/

	expression:assign_expr
			  |expression',' assign_expr
	
	assign_expr:logical_or_expr
			   |IDENTIFIER '=' assign_expr

	logical_or_expr:logical_and_expr
				   |logical_or_expr '||' logical_and_expr

	logical_and_expr:equality_expr
					|logical_and_expr '&&' equality_expr

	equality_expr:relational_expr
				 |equality_expr '==' relational_expr
				 |equality_expr '!=' relational_expr

	relational_expr:add_expr
				   |relational_expr '<' add_expr
				   |relational_expr '>' add_expr
				   |relational_expr '<=' add_expr
				   |relational_expr '>=' add_expr
	
	add_expr:mult_expr
			|add_expr '+' mult_expr
			|add_expr '-' mult_expr

	mult_expr:unary_expr
			 |mult_expr '*' unary_expr
			 |mult_expr '/' unary_expr

	unary_expr:postfix_expr
			  |'-'unary_expr

	postfix_expr:primary_expr
				|IDENTIFIER '('argument_expression_list')'

	primary_expr:IDENTIFIER
				|CONSTANT
				|'('expression')'

	argument_expression_list:assign_expr
							|argument_expression_list','assign_expr
							|/*none*/

			   
end

