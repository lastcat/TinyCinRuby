
#
# Tiny C Compiler.

class TinyCC
  prechigh
#    left '*' '/' '%'
#    left '+' '-'
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
	program:external_declaration{result = val[0]} 
	       |program external_declaration{result = [val[0],val[1]]}
	
	external_declaration: declaration{result = val[1]}
						|function_definition{result = val[0]}
	
	declaration:RESERVED declarator_list ';'{result = val[1].unshift(val[0])}

	declarator_list:declarator{
	                             #puts("declatorのなかみ:#{val[0]}")
	                             #result = val[0]
								 result = make_decl(val[0])
							   }
				   |declarator_list ',' declarator{result = [val[0],val[2]]}

	declarator:IDENTIFIER{
	                      result = val[0]
						 }

	function_definition:RESERVED declarator '(' parameter_type_list ')' compound_statement{
																							#puts("functionのdeclaratorのなかみ:#{val[1]}")
	                                                                                        #result = [[val[0],val[1]],val[3],val[5]]
																							result = make_fun_def([val[0],val[1],val[3],val[5]])
																							pop_object(@cur_lev)
																							@cur_lev-=1
																					      }

	parameter_type_list:parameter_declaration{
	                                           @cur_lev+=1
											   result = [val[0]]
											 }
	                   |parameter_type_list ',' parameter_declaration{result = val[0].push(val[2])}
					   |/* none */


	parameter_declaration:RESERVED declarator{
	                                          #puts("parameter_declarationの中身:#{val[1]}")
	                                          #result = [val[0],val[1]]
											  #puts make_param_decl(val[1])
											  result = make_param_decl(val[1]).unshift(val[0])
											  #result = make_param_decl(val[1])
											 }

	statement:';'{}
	         |expression ';'{result = val[0]}
			 |compound_statement{result = val[0]}
			 |'if' '(' expression ')' statement{result = ["IF", val[2],val[4]]}
			 |'if' '('expression ')' statement 'else' statement{result = ["IF",val[2],val[4],val[6]]}
			 |'while' '(' expression')' statement{result = ["WHILE",val[2],val[4]]}
             |'return' expression';'{result = ["RETURN",val[1]]}
	
	compound_statement:'{'declaration_list statement_list'}'{
	                                                         @cur_lev+=1
	                                                         result = [val[1],val[2]]
															 pop_object(@cur_lev)
															 @cur_lev-=1
															}

	declaration_list:declaration{result = val[0]}
	 				|declaration_list declaration{result = [val[0],val[1]]}
					| /* none*/

	statement_list:statement {result = val[0]}
				  |statement_list statement{result = val[0], val[1]}
				  |/*none*/

	expression:assign_expr {result = val[0]}
			  |expression',' assign_expr {result = [val[0],val[2]]}
	
	assign_expr:logical_or_expr {result = val[0]}
			   |IDENTIFIER '=' assign_expr {result=[val[1],val[0],val[2]]}

    logical_or_expr:logical_and_expr{result = val[0]}
				   |logical_or_expr '||' logical_and_expr{result = [val[1],val[0],val[2]]}

	logical_and_expr:equality_expr {result = val[0]}
					|logical_and_expr '&&' equality_expr{result = [val[1],val[0],val[2]]}

	equality_expr:relational_expr {result = val[0]}
				 |equality_expr '==' relational_expr {result = [val[1],val[0],val[2]]}
				 |equality_expr '!=' relational_expr {result = [val[1],val[0],val[2]]}

	relational_expr:add_expr {result = val[0]}
				   |relational_expr '<' add_expr {result = [val[1], val[0], val[2]]}
				   |relational_expr '>' add_expr {result = [val[1], val[0], val[2]]}
				   |relational_expr '<=' add_expr {result = [val[1], val[0], val[2]]}
				   |relational_expr '>=' add_expr {result = [val[1], val[0], val[2]]}
	
	add_expr:mult_expr {result = val[0]}
			|add_expr '+' mult_expr {result = [val[1], val[0], val[2]]}
			|add_expr '-' mult_expr {result = [val[1], val[0], val[2]]}

	mult_expr:unary_expr {result = val[0]}
			 |mult_expr '*' unary_expr{result = [val[1], val[0], val[2]]}
			 |mult_expr '/' unary_expr{result = [val[1], val[0], val[2]]}

	unary_expr:postfix_expr{result = val[0]}
			  |'-'unary_expr{result = [val[0], val[1]]}

	postfix_expr:primary_expr{result = val[0]}
				|IDENTIFIER '('argument_expression_list')' {
				                                            #puts("postfixのargument_expression_listのなかみ:#{val[2]}")
				                                            #result = val[2].unshift(val[0]).unshift("FCALL")
															result = ref_fun(val[2])
														   }
				
	primary_expr:IDENTIFIER {
	                          #puts("primary_exprのなかみ:#{val[0]}")
	                          #result = val[0]
							  result = ref_var(val[0])
							}
				|CONSTANT {result = val[0]}
				|'('expression')'{result = val[1]}

	argument_expression_list:assign_expr {result = val[0]}
							|argument_expression_list','assign_expr {result = [val[0] , val[2]]}
							|/*none*/

			   
end

