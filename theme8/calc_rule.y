
#
# Tiny C Compiler.

class TinyCC
  prechigh
#    left '*' '/' '%'
#    left '+' '-'
#	left '<' '>' '<=' '>='
#	left '==' '!='
#	left '&'
#	left '|'
	left '&&'
	left '||'

	left ')' '}'
	right '(' '{'
  preclow
rule
	program:external_declaration{result = [val[0]]}
	       |program external_declaration{result =#[val[0],val[1]]}
		                                         val[0]+[val[1]]}
	
	external_declaration:declaration{result = val[0]}
						|function_definition{result = val[0]}
	
	declaration:RESERVED declarator_list ';'{result = val[1]}
                                              #result = [val[1]].map do |x| x.unshift(val[0]) end}

	declarator_list:declarator{#result = [val[0]]}
	                                    result = [make_decl(val[0]).unshift("int")]}
				   |declarator_list ',' declarator{result = val[0].push(make_decl(val[2]).unshift("int"))}

	declarator:IDENTIFIER{#result = [val[0]]}
	                      result = val[0]}

	function_definition:RESERVED declarator '(' {@cur_lev += 1} parameter_type_list ')' compound_statement{stack_pop}
																							{
	                                                                                      #@cur_lev += 1
	                                                                                       #result = ["func",make_fun_def(val[1],val[4]),val[4],val[6]]
																						   result = ["func",make_fun_def(val[1],val[4])].push(val[4]).push(val[6])
																						   @param_add = 4}
	                                                                                      #@cur_lev}

	#function_definition:RESERVED declator {make_fun_def()} '(' {@cur_rev += 1} parameter_type_list ')' compound_statement{stack_pop}
	#																													 {
	#																													   result = ["func",make_fun_def(val[1],val[4])].push(val[4]).push(val[6])
	#																													   @param_add = 4
	#																													 }

	parameter_type_list:parameter_declaration{result = [make_param(val[0])]}
	                   |parameter_type_list ',' parameter_declaration{result = val[0].push(make_param(val[2]))}
					   |/* none */


	parameter_declaration:RESERVED declarator{result = val[1]}

	statement:';'{}
	         |expression ';'{result = val[0]}
			 |compound_statement{result = val[0]}
			 |'if' '(' expression ')' statement{result = ["IF", val[2],val[4]]}
			 |'if' '('expression ')' statement 'else' statement{result = ["IF",val[2],val[4],val[6]]}
			 |'while' '(' expression')' statement{result = ["WHILE",val[2],val[4]]}
			 |'return' expression';'{result = ["RETURN",val[1]]}
	
	compound_statement:'{'{@cur_lev += 1} declaration_list statement_list'}'{stack_pop}{
	                                                         #@cur_lev += 1
															 #result = [val[1],val[2]]
															 result = ["comp",val[2],val[3]]
															 #@cur_lev -= 1
															 }

	declaration_list:declaration{result = val[0]}
	 				|declaration_list declaration{
					                              
					                              result = val[0]+[val[1]]}
					| /* none*/

	statement_list:statement {result = [val[0]]}
				  |statement_list statement{result = val[0] + [val[1]]}
				  |/*none*/

	expression:assign_expr {result = val[0]}
			  |expression',' assign_expr {result = [val[0],val[2]]}
	
	assign_expr:logical_or_expr {result = val[0]}
			   |IDENTIFIER '=' assign_expr {#result=[val[1],val[0],val[2]]}
			                                result = [val[1],ref_var(val[0]),val[2]]}

    logical_or_expr:logical_and_expr{result = val[0]}
				   |logical_or_expr '||' logical_and_expr{result = [val[1],val[0],val[2]]}

	logical_and_expr:equality_expr {result = val[0]}
					|logical_and_expr '&&' equality_expr{result = [val[1],val[0],val[2]]}

#    logical_and_expr:logical_and_expr '&&' equality_expr{result = [val[1],val[0],val[2]]}
#	                |equality_expr{result = val[0]}

	equality_expr:relational_expr {result = val[0]}
				 |equality_expr '==' relational_expr {result = [val[1],val[0],val[2]]}
				 |equality_expr '!=' relational_expr {result = [val[1],val[0],val[2]]}

	relational_expr:add_expr {result = val[0]}
				   |relational_expr '<' add_expr {result = [val[1], val[0], val[2]]}
				   |relational_expr '>' add_expr {result = [val[1], val[0], val[2]]}
				   |relational_expr '<=' add_expr {result = [val[1], val[0], val[2]]}
				   |relational_expr '>=' add_expr {result = [val[1], val[0], val[2]]}
	
	add_expr:mult_expr {result = val[0]}
			|add_expr '+' mult_expr {
			                         #puts("PLUS!!!")
			                         result = [val[1], val[0], val[2]]}
			|add_expr '-' mult_expr {result = [val[1], val[0], val[2]]}

	mult_expr:unary_expr {result = val[0]}
			 |mult_expr '*' unary_expr{result = [val[1], val[0], val[2]]}
			 |mult_expr '/' unary_expr{result = [val[1], val[0], val[2]]}

	unary_expr:postfix_expr{result = val[0]}
			  |'-'unary_expr{result = [val[0], val[1]]}

	postfix_expr:primary_expr{result = val[0]}
				|IDENTIFIER '('argument_expression_list')' {#result = ["FCALL", val[0] ,val[2]]}
				                                             result = ref_fun(val[0],val[2].size).push(val[2])}
															 #result = ref_fun(val[0],val[2].size)}        
				
	primary_expr:IDENTIFIER {result = ref_var(val[0])}
				|CONSTANT {result = [val[0],"CONSTANT"]}
				|'('expression')'{result = val[1]}

	argument_expression_list:assign_expr {result = [val[0]]}
							|argument_expression_list','assign_expr {result =  val[0]+[val[2]]}
							|/*none*/

			   
end

