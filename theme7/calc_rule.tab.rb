#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.11
# from Racc grammer file "".
#

require 'racc/parser.rb'
class TinyCC < Racc::Parser
##### State transition tables begin ###

racc_action_table = [
     6,    57,    51,    23,    10,    29,    19,    40,    32,    61,
    33,    34,    20,    51,    48,    18,     5,    50,    74,    60,
    62,    51,    23,    14,    29,    48,    40,    32,    50,    33,
    34,    10,    95,    48,    51,    23,    50,    29,    53,    40,
    32,    61,    33,    34,    23,    51,    48,    51,    97,    50,
    40,    51,    40,    51,    53,    98,    74,    48,    40,    48,
    50,    99,    50,    48,    51,    48,    50,    96,    50,    40,
    51,    18,    51,    53,    25,    74,    48,    74,    51,    50,
    69,    70,    48,    74,    48,    50,    51,    50,    63,    64,
    48,    74,    10,    50,    51,    23,    25,    29,    48,    40,
    32,    50,    33,    34,    54,    51,    48,    51,    55,    50,
    74,    51,    40,    51,    12,    13,    40,    48,    40,    48,
    50,    59,    50,    48,    62,    48,    50,    11,    50,    51,
    23,    51,    29,    10,    40,    32,    74,    33,    34,   103,
    51,    48,    51,    48,    50,    74,    50,    74,    51,    71,
    72,     5,    48,    74,    48,    50,    51,    50,    71,    72,
    48,    74,    51,    50,    51,    79,    53,    40,    48,    74,
   nil,    50,    52,    53,    48,   nil,    48,    50,   nil,    50,
    65,    66,    67,    68,    65,    66,    67,    68,    65,    66,
    67,    68,    69,    70,    69,    70,    69,    70,    69,    70,
    71,    72,    63,    64 ]

racc_action_check = [
     1,    35,    35,    35,    13,    35,    16,    35,    35,    40,
    35,    35,    16,    67,    35,    14,     1,    35,    67,    40,
    80,    97,    97,     9,    97,    67,    97,    97,    67,    97,
    97,    18,    75,    97,    96,    96,    97,    96,    75,    96,
    96,    74,    96,    96,    19,    55,    96,    54,    78,    96,
    55,    59,    54,    53,    78,    82,    59,    55,    53,    54,
    55,    82,    54,    59,    51,    53,    59,    77,    53,    51,
    72,    20,    71,    77,    23,    72,    51,    71,    70,    51,
    90,    90,    72,    70,    71,    72,    69,    71,    42,    42,
    70,    69,    25,    70,    26,    26,    26,    26,    69,    26,
    26,    69,    26,    26,    32,    68,    26,    99,    33,    26,
    68,    60,    99,    34,     8,     8,    60,    68,    34,    99,
    68,    39,    99,    60,    41,    34,    60,     6,    34,   103,
   103,    65,   103,     5,   103,   103,    65,   103,   103,   100,
    48,   103,    64,    65,   103,    48,    65,    64,    63,    92,
    92,     0,    48,    63,    64,    48,    62,    64,    91,    91,
    63,    62,    61,    63,    66,    56,    56,    61,    62,    66,
   nil,    62,    30,    30,    61,   nil,    66,    61,   nil,    66,
    43,    43,    43,    43,    85,    85,    85,    85,    86,    86,
    86,    86,    89,    89,    88,    88,    87,    87,    44,    44,
    45,    45,    84,    84 ]

racc_action_pointer = [
   135,     0,   nil,   nil,   nil,   114,   127,   nil,    97,     9,
   nil,   nil,   nil,   -15,    -1,   nil,    -6,   nil,    12,    29,
    55,   nil,   nil,    58,   nil,    73,    80,   nil,   nil,   nil,
   155,   nil,    90,    94,    99,   -12,   nil,   nil,   nil,   110,
    -5,   114,    82,   178,   173,   173,   nil,   nil,   126,   nil,
   nil,    50,   nil,    39,    33,    31,   148,   nil,   nil,    37,
    97,   148,   142,   134,   128,   117,   150,    -1,    91,    72,
    64,    58,    56,   nil,    27,    20,   nil,    55,    36,   nil,
    10,   nil,    43,   nil,   196,   182,   186,   171,   169,   167,
    55,   131,   122,   nil,   nil,   nil,    20,     7,   nil,    93,
   118,   nil,   nil,   115,   nil ]

racc_action_default = [
   -60,   -60,    -1,    -3,    -4,   -60,   -60,    -2,   -60,    -6,
    -8,   105,    -5,   -60,   -12,    -7,   -60,   -10,   -60,   -60,
   -60,   -13,    -9,   -24,   -11,   -60,   -27,   -22,    -6,   -14,
   -60,   -16,   -60,   -60,   -60,   -60,   -23,   -25,   -28,   -30,
   -54,   -32,   -34,   -36,   -39,   -44,   -47,   -50,   -60,   -52,
   -55,   -60,   -15,   -60,   -60,   -60,   -60,   -21,   -26,   -60,
   -60,   -59,   -60,   -60,   -60,   -60,   -60,   -60,   -60,   -60,
   -60,   -60,   -60,   -51,   -54,   -60,   -29,   -60,   -60,   -20,
   -33,   -31,   -60,   -57,   -35,   -37,   -38,   -40,   -41,   -42,
   -43,   -45,   -46,   -48,   -49,   -56,   -60,   -60,   -53,   -60,
   -17,   -19,   -58,   -60,   -18 ]

racc_goto_table = [
    37,    73,    56,    76,    26,    27,    17,     9,    36,    58,
    81,    83,    24,    91,    92,    15,    85,    86,    80,    75,
    21,    84,    77,    78,    93,    94,    35,    28,    87,    88,
    89,    90,     2,     7,    22,    16,     1,    82,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   102,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   100,   101,   nil,   nil,   nil,   nil,   nil,   104 ]

racc_goto_check = [
    10,    21,    11,    14,    12,     3,     9,     6,     3,    10,
    14,    14,     9,    20,    20,     6,    18,    18,    16,    11,
     6,    17,    11,    11,    21,    21,    13,     6,    19,    19,
    19,    19,     2,     2,     8,     7,     1,    24,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    14,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    10,    10,   nil,   nil,   nil,   nil,   nil,    10 ]

racc_goto_pointer = [
   nil,    36,    32,   -18,   nil,   nil,     2,    21,    15,    -8,
   -26,   -32,   -19,     0,   -50,   nil,   -41,   -41,   -47,   -37,
   -56,   -47,   nil,   nil,   -24 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     8,   nil,   nil,    31,   nil,
   nil,    30,   nil,   nil,    38,    39,    41,    42,    43,    44,
    45,    46,    47,    49,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 31, :_reduce_1,
  2, 31, :_reduce_2,
  1, 32, :_reduce_3,
  1, 32, :_reduce_4,
  3, 33, :_reduce_5,
  1, 35, :_reduce_6,
  3, 35, :_reduce_7,
  1, 36, :_reduce_8,
  6, 34, :_reduce_9,
  1, 37, :_reduce_10,
  3, 37, :_reduce_11,
  0, 37, :_reduce_none,
  2, 39, :_reduce_13,
  1, 40, :_reduce_14,
  2, 40, :_reduce_15,
  1, 40, :_reduce_16,
  5, 40, :_reduce_17,
  7, 40, :_reduce_18,
  5, 40, :_reduce_19,
  3, 40, :_reduce_20,
  4, 38, :_reduce_21,
  1, 42, :_reduce_22,
  2, 42, :_reduce_23,
  0, 42, :_reduce_none,
  1, 43, :_reduce_25,
  2, 43, :_reduce_26,
  0, 43, :_reduce_none,
  1, 41, :_reduce_28,
  3, 41, :_reduce_29,
  1, 44, :_reduce_30,
  3, 44, :_reduce_31,
  1, 45, :_reduce_32,
  3, 45, :_reduce_33,
  1, 46, :_reduce_34,
  3, 46, :_reduce_35,
  1, 47, :_reduce_36,
  3, 47, :_reduce_37,
  3, 47, :_reduce_38,
  1, 48, :_reduce_39,
  3, 48, :_reduce_40,
  3, 48, :_reduce_41,
  3, 48, :_reduce_42,
  3, 48, :_reduce_43,
  1, 49, :_reduce_44,
  3, 49, :_reduce_45,
  3, 49, :_reduce_46,
  1, 50, :_reduce_47,
  3, 50, :_reduce_48,
  3, 50, :_reduce_49,
  1, 51, :_reduce_50,
  2, 51, :_reduce_51,
  1, 52, :_reduce_52,
  4, 52, :_reduce_53,
  1, 53, :_reduce_54,
  1, 53, :_reduce_55,
  3, 53, :_reduce_56,
  1, 54, :_reduce_57,
  3, 54, :_reduce_58,
  0, 54, :_reduce_none ]

racc_reduce_n = 60

racc_shift_n = 105

racc_token_table = {
  false => 0,
  :error => 1,
  "<" => 2,
  ">" => 3,
  "<=" => 4,
  ">=" => 5,
  "==" => 6,
  "!=" => 7,
  "&" => 8,
  "|" => 9,
  "&&" => 10,
  "||" => 11,
  ")" => 12,
  "}" => 13,
  "(" => 14,
  "{" => 15,
  :RESERVED => 16,
  ";" => 17,
  "," => 18,
  :IDENTIFIER => 19,
  "if" => 20,
  "else" => 21,
  "while" => 22,
  "return" => 23,
  "=" => 24,
  "+" => 25,
  "-" => 26,
  "*" => 27,
  "/" => 28,
  :CONSTANT => 29 }

racc_nt_base = 30

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"<\"",
  "\">\"",
  "\"<=\"",
  "\">=\"",
  "\"==\"",
  "\"!=\"",
  "\"&\"",
  "\"|\"",
  "\"&&\"",
  "\"||\"",
  "\")\"",
  "\"}\"",
  "\"(\"",
  "\"{\"",
  "RESERVED",
  "\";\"",
  "\",\"",
  "IDENTIFIER",
  "\"if\"",
  "\"else\"",
  "\"while\"",
  "\"return\"",
  "\"=\"",
  "\"+\"",
  "\"-\"",
  "\"*\"",
  "\"/\"",
  "CONSTANT",
  "$start",
  "program",
  "external_declaration",
  "declaration",
  "function_definition",
  "declarator_list",
  "declarator",
  "parameter_type_list",
  "compound_statement",
  "parameter_declaration",
  "statement",
  "expression",
  "declaration_list",
  "statement_list",
  "assign_expr",
  "logical_or_expr",
  "logical_and_expr",
  "equality_expr",
  "relational_expr",
  "add_expr",
  "mult_expr",
  "unary_expr",
  "postfix_expr",
  "primary_expr",
  "argument_expression_list" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'calc_rule.y', 19)
  def _reduce_1(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 20)
  def _reduce_2(val, _values, result)
    result = [val[0],val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 22)
  def _reduce_3(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 23)
  def _reduce_4(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 25)
  def _reduce_5(val, _values, result)
    result = val[1].unshift(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 28)
  def _reduce_6(val, _values, result)
    	                             #puts("declatorのなかみ:#{val[0]}")
	                             #result = val[0]
								 result = make_decl(val[0])
							   
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 32)
  def _reduce_7(val, _values, result)
    result = [val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 35)
  def _reduce_8(val, _values, result)
    	                      result = val[0]
						 
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 39)
  def _reduce_9(val, _values, result)
    																							#puts("functionのdeclaratorのなかみ:#{val[1]}")
	                                                                                        #result = [[val[0],val[1]],val[3],val[5]]
																							result = make_fun_def([val[0],val[1],val[3],val[5]])
																							pop_object(@cur_lev)
																							@cur_lev-=1
																					      
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 47)
  def _reduce_10(val, _values, result)
    	                                           @cur_lev+=1
											   result = [val[0]]
											 
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 50)
  def _reduce_11(val, _values, result)
    result = val[0].push(val[2])
    result
  end
.,.,

# reduce 12 omitted

module_eval(<<'.,.,', 'calc_rule.y', 55)
  def _reduce_13(val, _values, result)
    	                                          #puts("parameter_declarationの中身:#{val[1]}")
	                                          #result = [val[0],val[1]]
											  #puts make_param_decl(val[1])
											  result = make_param_decl(val[1]).unshift(val[0])
											  #result = make_param_decl(val[1])
											 
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 62)
  def _reduce_14(val, _values, result)
    
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 63)
  def _reduce_15(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 64)
  def _reduce_16(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 65)
  def _reduce_17(val, _values, result)
    result = ["IF", val[2],val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 66)
  def _reduce_18(val, _values, result)
    result = ["IF",val[2],val[4],val[6]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 67)
  def _reduce_19(val, _values, result)
    result = ["WHILE",val[2],val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 68)
  def _reduce_20(val, _values, result)
    result = ["RETURN",val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 71)
  def _reduce_21(val, _values, result)
    	                                                         @cur_lev+=1
	                                                         result = [val[1],val[2]]
															 pop_object(@cur_lev)
															 @cur_lev-=1
															
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 77)
  def _reduce_22(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 78)
  def _reduce_23(val, _values, result)
    result = [val[0],val[1]]
    result
  end
.,.,

# reduce 24 omitted

module_eval(<<'.,.,', 'calc_rule.y', 81)
  def _reduce_25(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 82)
  def _reduce_26(val, _values, result)
    result = val[0], val[1]
    result
  end
.,.,

# reduce 27 omitted

module_eval(<<'.,.,', 'calc_rule.y', 85)
  def _reduce_28(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 86)
  def _reduce_29(val, _values, result)
    result = [val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 88)
  def _reduce_30(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 89)
  def _reduce_31(val, _values, result)
    result=[val[1],val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 91)
  def _reduce_32(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 92)
  def _reduce_33(val, _values, result)
    result = [val[1],val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 94)
  def _reduce_34(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 95)
  def _reduce_35(val, _values, result)
    result = [val[1],val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 97)
  def _reduce_36(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 98)
  def _reduce_37(val, _values, result)
    result = [val[1],val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 99)
  def _reduce_38(val, _values, result)
    result = [val[1],val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 101)
  def _reduce_39(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 102)
  def _reduce_40(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 103)
  def _reduce_41(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 104)
  def _reduce_42(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 105)
  def _reduce_43(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 107)
  def _reduce_44(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 108)
  def _reduce_45(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 109)
  def _reduce_46(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 111)
  def _reduce_47(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 112)
  def _reduce_48(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 113)
  def _reduce_49(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 115)
  def _reduce_50(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 116)
  def _reduce_51(val, _values, result)
    result = [val[0], val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 118)
  def _reduce_52(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 120)
  def _reduce_53(val, _values, result)
    				                                            #puts("postfixのargument_expression_listのなかみ:#{val[2]}")
				                                            #result = val[2].unshift(val[0]).unshift("FCALL")
															result = ref_fun(val[2])
														   
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 126)
  def _reduce_54(val, _values, result)
    	                          #puts("primary_exprのなかみ:#{val[0]}")
	                          #result = val[0]
							  result = ref_var(val[0])
							
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 130)
  def _reduce_55(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 131)
  def _reduce_56(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 133)
  def _reduce_57(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 134)
  def _reduce_58(val, _values, result)
    result = [val[0] , val[2]]
    result
  end
.,.,

# reduce 59 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class TinyCC
